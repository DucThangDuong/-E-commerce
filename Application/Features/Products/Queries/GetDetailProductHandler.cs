using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MassTransit;
using MediatR;
using StackExchange.Redis;
using System.Text.Json;

namespace Application.Features.Products.Queries
{
    public record GetDetailProductQuery(int ProductId, string? ConnectionId = null) : IRequest<Result<ResProductDto>>;

    public class GetDetailProductHandler : IRequestHandler<GetDetailProductQuery, Result<ResProductDto>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly INotificationService _notificationService;
        private readonly IDatabase _redisConnection;
        public GetDetailProductHandler(IUnitOfWork unitOfWork, INotificationService notificationService, IConnectionMultiplexer redisConnection)
        {
            _unitOfWork = unitOfWork;
            _notificationService = notificationService;
            _redisConnection = redisConnection.GetDatabase();
        }

        public async Task<Result<ResProductDto>> Handle(GetDetailProductQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKeyInfo = $"Product:Detail:{query.ProductId}";
                string cacheKeyStock = $"Product:Stock:{query.ProductId}";
                var infoTask = await _redisConnection.StringGetAsync(cacheKeyInfo);
                var stockTask = await _redisConnection.StringGetAsync(cacheKeyStock);
                if (!infoTask.IsNullOrEmpty)
                {
                    var cachedProduct = JsonSerializer.Deserialize<ResProductDto>(infoTask.ToString());
                    if (cachedProduct != null && !stockTask.IsNull)
                    {
                        if (int.TryParse(stockTask.ToString(), out int stockQuantity))
                        {
                            cachedProduct.StockQuantity = stockQuantity;
                        }
                        return Result<ResProductDto>.Success(cachedProduct);
                    }
                }

                var product = await _unitOfWork.ProductRepository.GetProductDetailAsync(query.ProductId, ct);
                if (product == null)
                {
                    return Result<ResProductDto>.Failure("Product not found", 404);
                }
                if (!string.IsNullOrWhiteSpace(query.ConnectionId))
                {
                    await _notificationService.AddConnectionToGroup(query.ConnectionId, $"Product_{query.ProductId}");
                }
                await _redisConnection.StringSetAsync(cacheKeyInfo, JsonSerializer.Serialize(product), TimeSpan.FromMinutes(10));
                await _redisConnection.StringSetAsync(cacheKeyStock, product.StockQuantity.ToString(), TimeSpan.FromMinutes(10));
                return Result<ResProductDto>.Success(product);
            }
            catch (Exception ex)
            {
                return Result<ResProductDto>.Failure($"Lỗi khi lấy chi tiết sản phẩm: {ex.Message}", 500);
            }
        }
    }
}
