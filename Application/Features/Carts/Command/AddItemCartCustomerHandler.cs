using Application.Common;
using Application.Interfaces;
using Domain.Entities;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.Carts.Command
{
    public record AddItemCartCustomerCommand(int CustomerId, int ProductId, int Quantity);
    
    public class AddItemCartCustomerHandler : ICommandHandler<AddItemCartCustomerCommand>
    {
        private readonly IUnitOfWork _context;
        private readonly ILogger<AddItemCartCustomerHandler> _logger;

        public AddItemCartCustomerHandler(IUnitOfWork context, ILogger<AddItemCartCustomerHandler> logger) 
        { 
            _context = context;
            _logger = logger;
        }

        public async Task<Result> HandleAsync(AddItemCartCustomerCommand command, CancellationToken ct = default)
        {
            try
            {
                int? stockQuantity = await _context.ProductRepository.GetStockQuantityAsync(command.ProductId, ct);

                if (stockQuantity == null)
                {
                    return Result.Failure("Product not found.", 404);
                }

                var existingCart = await _context.CartRepository.GetCartAsync(command.CustomerId, command.ProductId);
                int currentQuantityInCart = existingCart?.Quantity ?? 0;

                if (stockQuantity.Value == 0 || (currentQuantityInCart + command.Quantity) > stockQuantity.Value)
                {
                    return Result.Failure("Not enough stock available for the requested quantity.", 400);
                }

                if (existingCart != null)
                {
                    existingCart.Quantity += command.Quantity;
                }
                else
                {
                    Cart newCart = new Cart{
                        CustomerId = command.CustomerId,
                        ProductId = command.ProductId,
                        Quantity = command.Quantity
                    };
                    await _context.CartRepository.AddNewCartAsync(newCart);
                }
                
                await _context.SaveChangesAsync();
                return Result.Success();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error adding item to cart. CustomerId: {CustomerId}, ProductId: {ProductId}", command.CustomerId, command.ProductId);
                return Result.Failure("An internal error occurred while processing your request.", 500);
            }
        }
    }
}
