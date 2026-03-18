using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class CartRepository : ICartRepository
    {
        private readonly EcommerceOrderSystemContext _context;
        public CartRepository(EcommerceOrderSystemContext context) { 
            _context = context;
        }

        public async Task<bool> AddNewCartAsync(Cart newCart)
        {
            try
            {

                await _context.Carts.AddAsync(newCart);
                return true;
            }
            catch {
                return false;
            }
        }

        public async Task<bool> DeleteCartAsync(int customerId, int productId)
        {
            try
            {
                await _context.Carts
                    .Where(e => e.ProductId == productId && e.CustomerId == customerId)
                    .ExecuteDeleteAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<Cart?> GetCartAsync(int customer_id, int product_id)
        {
            return await _context.Carts.FirstOrDefaultAsync(c => c.CustomerId == customer_id && c.ProductId == product_id);
        }
    }
}
