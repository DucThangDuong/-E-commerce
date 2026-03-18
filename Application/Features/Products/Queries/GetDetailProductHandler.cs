using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Products.Queries
{
    public record GetDetailProductQuery(int productId);
    public class GetDetailProductHandler : IQueryHandler<GetDetailProductQuery, ResProductDto>
    {
        private readonly IUnitOfWork _context;
        public GetDetailProductHandler(IUnitOfWork context) { 
            _context = context;
        }
        public async Task<Result<ResProductDto>> HandleAsync(GetDetailProductQuery query, CancellationToken ct = default)
        {
            try
            {
                var products = await _context.Context.Products
                    .Where(e => e.ProductId == query.productId)
                    .Select(e => new ResProductDto
                    {
                        BasePrice = e.BasePrice,
                        CategoryId = e.CategoryId,
                        Description = e.Description,
                        Name = e.Name,
                        ProductId = e.ProductId,
                        StockQuantity = e.Inventory.StockQuantity,
                        imageUrl = e.ProductImages.Select(e => e.ImageUrl).ToList(),
                    }).FirstOrDefaultAsync();

                return Result<ResProductDto>.Success(products);
            }
            catch (Exception ex)
            {
                return Result<ResProductDto>.Failure($"Lỗi khi lấy danh sách sản phẩm: {ex.Message}", 500);
            }
        }
    }
}
