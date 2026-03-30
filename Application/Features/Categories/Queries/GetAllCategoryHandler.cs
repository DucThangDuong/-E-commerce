using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MediatR;

namespace Application.Features.Categories.Queries
{
    public record GetAllCategoryQuery(int Take) : IRequest<Result<List<ResCategoryDto>>>;

    public class GetAllCategoryHandler : IRequestHandler<GetAllCategoryQuery, Result<List<ResCategoryDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICacheService _cache;
        public GetAllCategoryHandler( ICacheService cache, IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _cache = cache;
        }

        public async Task<Result<List<ResCategoryDto>>> Handle(GetAllCategoryQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKey = $"category";
                var cachedData = await _cache.GetAsync<List<ResCategoryDto>>(cacheKey);
                if (cachedData != null)
                {
                    return Result<List<ResCategoryDto>>.Success(cachedData);
                }

                var result = await _unitOfWork.CategoryRepository.GetAllCategoriesAsync(query.Take, ct);
                await _cache.SetAsync(cacheKey,result, TimeSpan.FromHours(24));
                return Result<List<ResCategoryDto>>.Success(result);
            }
            catch (Exception ex)
            {
                return Result<List<ResCategoryDto>>.Failure(ex.Message);
            }
        }
    }
}
