using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Categories.Queries;

public record GetAllCategoryQuery(int take);
public class GetAllCategoryHandler : IQueryHandler<GetAllCategoryQuery, List<ResCategoryDto>>
{
    private readonly IUnitOfWork _context;
    public GetAllCategoryHandler(IUnitOfWork context)
    {
        _context = context;
    }
    public async Task<Result<List<ResCategoryDto>>> HandleAsync(GetAllCategoryQuery query, CancellationToken ct = default)
    {
        try
        {
            var result = await _context.Context.Categories.AsNoTracking()
                .OrderBy(e=>e.CategoryId)
                .Take(query.take)
                .Select(c => new ResCategoryDto
                {
                    CategoryId = c.CategoryId,
                    Description = c.Description,
                    Name = c.Name,
                    Picture = c.Picture
                }).ToListAsync(ct);
            return Result<List<ResCategoryDto>>.Success(result);
        }
        catch (Exception ex)
        {
            return Result<List<ResCategoryDto>>.Failure(ex.Message);
        }
    }
}

