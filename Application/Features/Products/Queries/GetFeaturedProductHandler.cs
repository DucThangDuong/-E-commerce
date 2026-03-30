using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MediatR;

namespace Application.Features.Products.Queries
{
    public record GetFeaturedProductQuery() : IRequest<Result<List<ResFeaturedProductDto>>>;

    public class GetFeaturedProductHandler : IRequestHandler<GetFeaturedProductQuery, Result<List<ResFeaturedProductDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICacheService _cache;

        public GetFeaturedProductHandler(IUnitOfWork unitOfWork, ICacheService cache)
        {
            _unitOfWork = unitOfWork;
            _cache = cache;
        }

        public async Task<Result<List<ResFeaturedProductDto>>> Handle(GetFeaturedProductQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKey = "featured_products";
                var cachedProducts = await _cache.GetAsync<List<ResFeaturedProductDto>>(cacheKey);
                if (cachedProducts !=null)
                {
                    return Result<List<ResFeaturedProductDto>>.Success(cachedProducts);
                }
                var featuredProducts = await _unitOfWork.ProductRepository.GetFeaturedProductsAsync(ct);
                await _cache.SetAsync(cacheKey, featuredProducts, TimeSpan.FromHours(24));
                return Result<List<ResFeaturedProductDto>>.Success(featuredProducts);
            }
            catch (Exception ex)
            {
                return Result<List<ResFeaturedProductDto>>.Failure($"Failed to retrieve featured products: {ex.Message}", 500);
            }
        }
    }
}
