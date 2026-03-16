using Application.Common;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Carts.Command
{
    public record AddItemCartCustomerCommand(int customer_id, int product_id, int quantity);
    public class AddItemCartCustomerHandler : ICommandHandler<AddItemCartCustomerCommand>
    {
        private readonly IUnitOfWork _context;
        public AddItemCartCustomerHandler(IUnitOfWork context) { 
            _context = context;
        }

        public async Task<Result> HandleAsync(AddItemCartCustomerCommand command, CancellationToken ct = default)
        {
            try
            {
                int stock_quantity = await _context.Context.Inventories
                    .Where(i => i.ProductId == command.product_id)
                    .Select(i => i.StockQuantity)
                    .FirstOrDefaultAsync(ct);

                if (stock_quantity == 0 || stock_quantity < command.quantity)
                {
                    return Result.Failure("Not enough stock available", 400);
                }

                var existingCart = await _context.CartRepository.GetCartAsync(command.customer_id, command.product_id);
                if (existingCart != null)
                {
                    existingCart.Quantity += command.quantity;
                }
                else
                {
                    var newcart = await _context.CartRepository.AddNewCartAsync(command.customer_id, command.product_id, command.quantity);
                    if (newcart == null)
                    {
                        return Result.Failure("Failed to add item to cart", 500);
                    }
                }
                await _context.SaveChangesAsync();
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Failure($"An error occurred: {ex.Message}", 500);
            }
        }
    }
}
