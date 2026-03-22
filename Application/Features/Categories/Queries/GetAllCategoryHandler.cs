using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using MediatR;
using Microsoft.Extensions.Caching.Distributed;
using System.Text.Json;

namespace Application.Features.Categories.Queries
{
    public record GetAllCategoryQuery(int Take) : IRequest<Result<List<ResCategoryDto>>>;

    public class GetAllCategoryHandler : IRequestHandler<GetAllCategoryQuery, Result<List<ResCategoryDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IDistributedCache _cache;
        public GetAllCategoryHandler( IDistributedCache cache, IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _cache = cache;
        }

        public async Task<Result<List<ResCategoryDto>>> Handle(GetAllCategoryQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKey = $"category";
                string cachedData = await _cache.GetStringAsync(cacheKey);
                if (string.IsNullOrEmpty(cachedData))
                {
                    var cachedList = JsonSerializer.Deserialize<List<ResCategoryDto>>(cachedData);
                    if (cachedList != null)
                    {
                        return Result<List<ResCategoryDto>>.Success(cachedList);
                    }
                }
                var result = await _unitOfWork.CategoryRepository.GetAllCategoriesAsync(query.Take, ct);
                var cacheOptions = new DistributedCacheEntryOptions()
                    .SetAbsoluteExpiration(TimeSpan.FromHours(2));

                await _cache.SetStringAsync(cacheKey, JsonSerializer.Serialize(result), cacheOptions, ct);
                return Result<List<ResCategoryDto>>.Success(result);
            }
            catch (Exception ex)
            {
                return Result<List<ResCategoryDto>>.Failure(ex.Message);
            }
        }
    }
}
