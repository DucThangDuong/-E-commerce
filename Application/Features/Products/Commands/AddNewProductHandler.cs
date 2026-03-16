using Application.Common;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Products.Commands
{
    public record AddNewProductCommand(int category_id ,string name ,string? description ,decimal base_price,int stock_quatity );
    public class AddNewProductHandler:ICommandHandler<AddNewProductCommand>
    {
        private readonly IUnitOfWork _context;
        public AddNewProductHandler(IUnitOfWork context) {
            _context = context;
        }

        public async Task<Result> HandleAsync(AddNewProductCommand command, CancellationToken ct = default)
        {
            try
            {

                bool hasCategory = _context.Context.Categories.AsNoTracking().Any(c => c.CategoryId == command.category_id);
                if (!hasCategory)
                {
                    return Result.Failure("Category not found", 404);
                }
                Product newProduct = new Product
                {
                    CategoryId = command.category_id,
                    Name = command.name,
                    Description = command.description,
                    BasePrice = command.base_price,
                    Inventory = new Inventory
                    {
                        StockQuantity = command.stock_quatity,
                        ReservedQuantity = 0,
                        LastUpdated = DateTime.UtcNow
                    }
                };
                await _context.ProductRepository.AddAsync(newProduct);
                await _context.SaveChangesAsync();
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Failure($"An error occurred while adding the product: {ex.Message}", 500);
            }

        }
    }
}
