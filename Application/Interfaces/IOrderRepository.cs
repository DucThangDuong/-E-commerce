using Application.DTOs.Response;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IOrderRepository
    {
        public Task AddAsync(Order order);
        public Task<List<ResOrder>> GetOrdersByCustomerIdAsync(int customerId);
        public Task<Order?> GetByIdAsync(int orderId);
    }
}
