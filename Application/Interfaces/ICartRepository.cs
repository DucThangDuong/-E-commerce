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
        public Task<Cart> AddNewCartAsync(int customer_id, int product_id,int quantity);
        public Task<Cart> GetCartAsync(int customer_id,int product_id);
    }
}
