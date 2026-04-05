using Application.DTOs.Services;
using Application.Interfaces;
using MassTransit;
using StackExchange.Redis;
using System.Text.Json;

namespace Application.Consumers
{
    public class CheckOrderExpirationConsumer : IConsumer<ReserveOrderEvent>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IDatabase _redisConnection;

        public CheckOrderExpirationConsumer(IUnitOfWork unitOfWork, IConnectionMultiplexer multiplexer)
        {
            _unitOfWork = unitOfWork;
            _redisConnection = multiplexer.GetDatabase();
        }

        public async Task Consume(ConsumeContext<ReserveOrderEvent> context)
        {
            int orderId = context.Message.OrderId;
            string reservationKey = $"Order:Reservation:{orderId}";
            var reservationValue = await _redisConnection.StringGetAsync(reservationKey);
            if (!reservationValue.HasValue)
            {
                return; 
            }

            var order = await _unitOfWork.OrderRepository.GetByIdAsync(orderId);
            if (order != null && order.Status == "Pending" && order.Payment?.PaymentStatus == "Unpaid")
            {
                order.Status = "Cancelled";

                var items = JsonSerializer.Deserialize<Dictionary<int, int>>(reservationValue!);
                if (items != null)
                {
                    foreach (var item in items)
                    {
                        string cacheKeyStock = $"Product:Stock:{item.Key}";
                        await _redisConnection.StringIncrementAsync(cacheKeyStock, item.Value);
                    }
                }

                await _unitOfWork.SaveChangesAsync();
            }
            await _redisConnection.KeyDeleteAsync(reservationKey);
        }
    }
}
