using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Application.IServices;
using MediatR;
using Microsoft.Extensions.Caching.Distributed;
using System.Text.Json;

namespace Application.Features.Brands.Queries
{
    public record GetAllBrandsQuery(int Take) : IRequest<Result<List<ResBrandDto>>>;

    public class GetAllBrandsHandler : IRequestHandler<GetAllBrandsQuery, Result<List<ResBrandDto>>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICacheService _cache;
        
        public GetAllBrandsHandler(ICacheService cache, IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _cache = cache;
        }

        public async Task<Result<List<ResBrandDto>>> Handle(GetAllBrandsQuery query, CancellationToken ct)
        {
            try
            {
                string cacheKey = $"brand";
                var cachedData = await _cache.GetAsync<List<ResBrandDto>>(cacheKey);
                if(cachedData != null)
                {
                    return Result<List<ResBrandDto>>.Success(cachedData);
                }
                
                var result = await _unitOfWork.BrandRepository.GetAllBrandsAsync(query.Take, ct);
                await _cache.SetAsync(cacheKey, result, TimeSpan.FromHours(24));
                return Result<List<ResBrandDto>>.Success(result);
            }
            catch (Exception ex)
            {
                return Result<List<ResBrandDto>>.Failure(ex.Message);
            }
        }
    }
}
