using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Products.Queries
{
    public record GetFeaturedProductQuery() : IRequest<Result<List<ResFeaturedProductDto>>>;

    public class GetFeaturedProductHandler : IRequestHandler<GetFeaturedProductQuery, Result<List<ResFeaturedProductDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetFeaturedProductHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<List<ResFeaturedProductDto>>> Handle(GetFeaturedProductQuery query, CancellationToken ct)
        {
            try
            {
                var featuredProducts = await _unitOfWork.ProductRepository.GetFeaturedProductsAsync(ct);
                return Result<List<ResFeaturedProductDto>>.Success(featuredProducts);
            }
            catch (Exception ex)
            {
                return Result<List<ResFeaturedProductDto>>.Failure($"Failed to retrieve featured products: {ex.Message}", 500);
            }
        }
    }
}
