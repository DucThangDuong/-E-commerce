using Application.DTOs.Services;
using Application.Interfaces;
using Domain.Enums;
using MassTransit;
using Microsoft.EntityFrameworkCore;
using StackExchange.Redis;
using Microsoft.Extensions.Logging;

namespace Application.Consumers
{
    public class CheckOrderExpirationConsumer : IConsumer<OrderTimeoutEvent>
    {
        private readonly IDatabase _redisConnection;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IAppReadDbContext _db;

        private readonly ILogger<CheckOrderExpirationConsumer> _logger;

        public CheckOrderExpirationConsumer(
            IConnectionMultiplexer multiplexer,
            IUnitOfWork unitOfWork,
            IAppReadDbContext db,
            ILogger<CheckOrderExpirationConsumer> logger)
        {
            _redisConnection = multiplexer.GetDatabase();
            _unitOfWork = unitOfWork;
            _db = db;
            _logger = logger;
        }

        public async Task Consume(ConsumeContext<OrderTimeoutEvent> context)
        {
            int orderId = context.Message.OrderId;

            try
            {
                var order = await _unitOfWork.OrderRepository.GetByIdAsync(orderId);
                if (order == null)
                {
                    _logger.LogWarning("Order {OrderId} not found. Skipping timeout process.", orderId);
                    return;
                }

                if (order.Status == OrderStatus.Confirmed.ToString() ||
                    order.Status == OrderStatus.Shipping.ToString() ||
                    order.Status == OrderStatus.Completed.ToString())
                {
                    return;
                }

                if (order.Status == OrderStatus.Cancelled.ToString() ||
                    order.Status == OrderStatus.Failed.ToString())
                {
                    return;
                }

                if (order.Status == OrderStatus.Pending.ToString())
                {
                    order.Status = OrderStatus.Cancelled.ToString();
                    order.UpdatedAt = DateTime.UtcNow;

                    if (order.Payment != null)
                    {
                        order.Payment.PaymentStatus = PaymentStatus.Fail.ToString();
                    }

                    var orderItems = await _db.OrderItems
                        .Include(oi => oi.Vehicle)
                        .Where(oi => oi.OrderId == orderId)
                        .ToListAsync();

                    var vehicleIdsToRelease = orderItems.Select(oi => oi.VehicleId).ToList();
                    await _unitOfWork.InventoryRepository.ReleaseVehiclesAsync(vehicleIdsToRelease);

                    var groupedByColor = orderItems.GroupBy(oi => oi.Vehicle.ColorId);
                    foreach (var g in groupedByColor)
                    {
                        string cacheKeyStock = $"Color:Stock:{g.Key}";
                        await _redisConnection.StringIncrementAsync(cacheKeyStock, g.Count());
                    }

                    await _unitOfWork.SaveChangesAsync();
                    _logger.LogInformation("Order {OrderId} has been successfully cancelled due to timeout.", orderId);
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error processing order timeout for OrderId {OrderId}", orderId);
                throw;
            }
        }
    }
}
