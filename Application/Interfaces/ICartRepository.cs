using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface ICartRepository
    {
        public Task<bool> AddNewCartAsync(Cart newCart);
        public Task<Cart?> GetCartAsync(int customer_id,int product_id);
        public Task<bool> DeleteCartAsync(int customerId, int productId);
    }
}
