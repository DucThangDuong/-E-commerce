using Application.Common;
using Application.Interfaces;
using Application.IServices;
using Domain.Entities;
using MassTransit;
using MediatR;
using StackExchange.Redis;
using System.Text.Json;

namespace Application.Features.Order.Commands
{
    public record AddOrderItemCustomerCommand(int CustomerId, Dictionary<int,int> Items) : IRequest<Result<List<int>>>;
    public class AddOrderItemCustomerHandler : IRequestHandler<AddOrderItemCustomerCommand, Result<List<int>>>
    {
        public readonly IUnitOfWork _unitOfWork;
        public readonly INotificationService _hubContext;
        private readonly IDatabase _redisConnection;
        private readonly IPublishEndpoint _publishEndpoint;

        public AddOrderItemCustomerHandler(IUnitOfWork unitOfWork, INotificationService hub, IConnectionMultiplexer multiplexer, IPublishEndpoint publishEndpoint)
        {
            _unitOfWork = unitOfWork;
            _hubContext = hub;
            _redisConnection = multiplexer.GetDatabase();
            _publishEndpoint = publishEndpoint;
        }
        public async Task<Result<List<int>>> Handle(AddOrderItemCustomerCommand request, CancellationToken ct)
        {
            List<int> productIds = request.Items.Keys.ToList();

            var stockMap = new Dictionary<int, int>();
            var missingProductIds = new List<int>();

            var redisKeys = productIds.Select(id => (RedisKey)$"Product:Stock:{id}").ToArray();
            var redisValues = await _redisConnection.StringGetAsync(redisKeys);

            for (int i = 0; i < productIds.Count; i++)
            {
                if (redisValues[i].HasValue && int.TryParse(redisValues[i], out int redisStock))
                {
                    stockMap[productIds[i]] = redisStock;
                }
                else
                {
                    missingProductIds.Add(productIds[i]);
                }
            }

            if (missingProductIds.Any())
            {
                var dbStockMap = await _unitOfWork.InventoryRepository.GetStockByProductIdsAsync(missingProductIds, ct);
                foreach (var id in missingProductIds)
                {
                    int dbStock = dbStockMap.ContainsKey(id) ? dbStockMap[id] : 0;
                    stockMap[id] = dbStock;
                    await _redisConnection.StringSetAsync($"Product:Stock:{id}", dbStock, TimeSpan.FromDays(1));
                }
            }

            var outOfStockItems = new List<int>();
            foreach (var item in request.Items)
            {
                int stock = stockMap.ContainsKey(item.Key) ? stockMap[item.Key] : 0;
                if (stock < item.Value)
                {
                    outOfStockItems.Add(item.Key);
                }
            }

            if (outOfStockItems.Any())
            {
                return Result<List<int>>.Failure("Các sản phẩm không đủ tồn kho.", 400, outOfStockItems);
            }

            try
            {
                // Trừ để giữ chỗ trong Redis trước
                foreach (var item in request.Items)
                {
                    string cacheKeyStock = $"Product:Stock:{item.Key}";
                    await _redisConnection.StringDecrementAsync(cacheKeyStock, item.Value);
                }

                Dictionary<int, decimal> productPrices = await _unitOfWork.ProductRepository.GetProductPricesAsync(productIds, ct);

                var orderItems = new List<OrderItem>();
                decimal totalAmount = 0;

                foreach (var item in request.Items)
                {
                    int productId = item.Key;
                    int quantity = item.Value;

                    if (!productPrices.TryGetValue(productId, out decimal unitPrice))
                    {
                        return Result<List<int>>.Failure($"Sản phẩm ID {productId} không có thông tin giá hợp lệ.");
                    }

                    orderItems.Add(new OrderItem
                    {
                        ProductId = productId,
                        Quantity = quantity,
                        UnitPriceAtPurchase = unitPrice
                    });

                    totalAmount += unitPrice * quantity;
                }

                var newOrder = new Domain.Entities.Order
                {
                    CustomerId = request.CustomerId,
                    OrderDate = DateTime.UtcNow,
                    TotalAmount = totalAmount,
                    Status = "Pending",
                    OrderItems = orderItems,
                };
                await _unitOfWork.OrderRepository.AddAsync(newOrder);
                await _unitOfWork.SaveChangesAsync(ct);

                string reservationKey = $"Order:Reservation:{newOrder.OrderId}";
                await _redisConnection.StringSetAsync(reservationKey, JsonSerializer.Serialize(request.Items), TimeSpan.FromMinutes(15));

                await _publishEndpoint.Publish(new DTOs.Services.ReserveOrderEvent(newOrder.OrderId), context =>
                {
                    context.Delay = TimeSpan.FromMinutes(15);
                });

            }
            catch (Exception)
            {
                foreach (var item in request.Items)
                {
                    string cacheKeyStock = $"Product:Stock:{item.Key}";
                    await _redisConnection.StringIncrementAsync(cacheKeyStock, item.Value);
                }
                throw;
            }
            await _unitOfWork.CartRepository.DeleteCartItemsAsync(request.CustomerId, productIds, ct);

            return Result<List<int>>.Success(new List<int>());
        }
    }
}
