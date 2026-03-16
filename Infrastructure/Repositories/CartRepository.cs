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

        public async Task<Cart> AddNewCartAsync(int customer_id, int product_id, int quantity)
        {
            var cart = new Cart
            {
                CustomerId = customer_id,
                ProductId = product_id,
                Quantity = quantity
            };
            await _context.Carts.AddAsync(cart);
            return cart;
        }


        public async Task<Cart> GetCartAsync(int customer_id, int product_id)
        {
            return await _context.Carts.FirstOrDefaultAsync(c => c.CustomerId == customer_id && c.ProductId == product_id);
        }
    }
}
