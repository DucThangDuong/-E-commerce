using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MediatR;

namespace Application.Features.Products.Queries
{
    public record GetFilteredProductsQuery(List<int>? CategoryIds, List<int>? BrandIds, int Skip, int Take) : IRequest<Result<List<ResProductDto>>>;

    public class GetFilteredProductsHandler : IRequestHandler<GetFilteredProductsQuery, Result<List<ResProductDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICacheService _cache;

        public GetFilteredProductsHandler(IUnitOfWork unitOfWork, ICacheService cache)
        {
            _unitOfWork = unitOfWork;
            _cache = cache;
        }

        public async Task<Result<List<ResProductDto>>> Handle(GetFilteredProductsQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKey = $"products_{string.Join("_", query.CategoryIds ?? new List<int>())}" +
                    $"_{string.Join("_", query.BrandIds ?? new List<int>())}_{query.Skip}_{query.Take}";
                var cachedData = await _cache.GetAsync<List<ResProductDto>>(cacheKey);
                if (cachedData != null)
                {
                    return Result<List<ResProductDto>>.Success(cachedData);
                }
                var result = await _unitOfWork.ProductRepository.GetFilteredProductsAsync(query.CategoryIds, query.BrandIds, query.Skip, query.Take, ct);
                if (result != null)
                {
                    await _cache.SetAsync(cacheKey, result, TimeSpan.FromMinutes(10));
                }
                return Result<List<ResProductDto>>.Success(result ?? new List<ResProductDto>());
            }
            catch (Exception ex)
            {
                return Result<List<ResProductDto>>.Failure(ex.Message, 400);
            }
        }
    }
}
