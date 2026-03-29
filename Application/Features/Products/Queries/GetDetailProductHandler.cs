using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MediatR;

namespace Application.Features.Products.Queries
{
    public record GetDetailProductQuery(int ProductId, string? ConnectionId = null) : IRequest<Result<ResProductDto>>;

    public class GetDetailProductHandler : IRequestHandler<GetDetailProductQuery, Result<ResProductDto>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly INotificationService _notificationService;

        public GetDetailProductHandler(IUnitOfWork unitOfWork, INotificationService notificationService)
        {
            _unitOfWork = unitOfWork;
            _notificationService = notificationService;
        }

        public async Task<Result<ResProductDto>> Handle(GetDetailProductQuery query, CancellationToken ct)
        {
            try
            {
                var product = await _unitOfWork.ProductRepository.GetProductDetailAsync(query.ProductId, ct);
                if (product == null)
                {
                    return Result<ResProductDto>.Failure("Product not found", 404);
                }
                if (!string.IsNullOrWhiteSpace(query.ConnectionId))
                {
                    await _notificationService.AddConnectionToGroup(query.ConnectionId, $"Product_{query.ProductId}");
                }

                return Result<ResProductDto>.Success(product);
            }
            catch (Exception ex)
            {
                return Result<ResProductDto>.Failure($"Lỗi khi lấy chi tiết sản phẩm: {ex.Message}", 500);
            }
        }
    }
}
