using Application.Common;
using Application.Interfaces;
using Application.IServices;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.SignalR;
using StackExchange.Redis;
using System.Text.Json;

namespace Application.Features.Order.Commands
{
    public record AddOrderItemCustomerCommand(int CustomerId, Dictionary<int,int> Items, string Address, string PhoneNumber) : IRequest<Result>;
    public class AddOrderItemCustomerHandler: IRequestHandler<AddOrderItemCustomerCommand, Result>
    {
        public readonly IUnitOfWork _unitOfWork;
        public readonly INotificationService _hubContext;
        private readonly IDatabase _redisConnection;
        public AddOrderItemCustomerHandler(IUnitOfWork unitOfWork, INotificationService hub, IConnectionMultiplexer multiplexer)
        {
            _unitOfWork = unitOfWork;
            _hubContext = hub;
            _redisConnection = multiplexer.GetDatabase();
        }
        public async Task<Result> Handle(AddOrderItemCustomerCommand request, CancellationToken ct)
        {
            if (request.Items == null || !request.Items.Any())
                return Result.Failure("Danh sách sản phẩm không được rỗng.");

            List<int> productIds = request.Items.Keys.ToList();

            var stockMap = await _unitOfWork.InventoryRepository.GetStockByProductIdsAsync(productIds, ct);

            foreach (var item in request.Items)
            {
                int stock = stockMap.ContainsKey(item.Key) ? stockMap[item.Key] : 0;
                if (stock < item.Value)
                    return Result.Failure($"Sản phẩm ID {item.Key} không đủ tồn kho. Yêu cầu: {item.Value}, Tồn kho: {stock}");
            }

            Dictionary<int, int> availablStockAfterUpdate = await _unitOfWork.InventoryRepository.UpdateStockAsync(request.Items, ct);

            Dictionary<int, decimal> productPrices = await _unitOfWork.ProductRepository.GetProductPricesAsync(productIds, ct);

            var orderItems = new List<OrderItem>();
            decimal totalAmount = 0;

            foreach (var item in request.Items)
            {
                int productId = item.Key;
                int quantity = item.Value;

                if (!productPrices.TryGetValue(productId, out decimal unitPrice))
                {
                    return Result.Failure($"Sản phẩm ID {productId} không có thông tin giá hợp lệ.");
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
                Payment = new Payment
                {
                    Amount = totalAmount,
                    Provider = "COD",
                    PaymentStatus = "Unpaid",
                    PhoneNumber = request.PhoneNumber,
                    Address = request.Address
                }
            };
            await _unitOfWork.OrderRepository.AddAsync(newOrder);
            await _unitOfWork.SaveChangesAsync(ct);
            foreach (var item in orderItems)
            {
                string cacheKeyStock = $"product_stock_{item.ProductId}";
                await _redisConnection.StringDecrementAsync(cacheKeyStock, item.Quantity);
            }
            ;
            foreach (var item in availablStockAfterUpdate)
            {
                string jsonString = JsonSerializer.Serialize(new
                {
                    productId = item.Key,
                    quantity = item.Value
                });
                await _hubContext.SendProductUpdateNotification(item.Key, jsonString);
            }
            ;
            await _unitOfWork.CartRepository.DeleteCartItemsAsync(request.CustomerId, productIds, ct);

            return Result.Success();
        }
    }
}
