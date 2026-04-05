using Application.DTOs.Response;
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
    public class OrderRepository : IOrderRepository
    {
        private readonly EcommerceOrderSystemContext _context;
        public OrderRepository(EcommerceOrderSystemContext context) { 
            _context = context;
        }

        public async Task AddAsync(Order order)
        {
            await _context.Orders.AddAsync(order);
        }

        public async Task<Order?> GetByIdAsync(int orderId)
        {
            return await _context.Orders.FirstOrDefaultAsync(e => e.OrderId == orderId);
        }

        public async Task<List<ResOrder>> GetOrdersByCustomerIdAsync(int customerId)
        {
            var orders = await _context.Orders
                .Where(e => e.CustomerId == customerId)
                .Select(e => new ResOrder
                {
                    Address = e.Payment != null ? e.Payment.Address : "",
                    PhoneNumber = e.Payment != null ? e.Payment.PhoneNumber : null,
                    OrderId = e.OrderId,
                    OrderDate = e.OrderDate,
                    TotalAmount = e.TotalAmount,
                    Status = e.Status,
                    PaymentStatus = e.Payment != null ? e.Payment.PaymentStatus : "Unpaid",
                    OrderItems = e.OrderItems.Select(oi => new ResOrderWithItems
                    {
                        name = oi.Product.Name,
                        quantity = oi.Quantity,
                        unitPriceAtPurchase = oi.UnitPriceAtPurchase,
                        basePrice = oi.Product.BasePrice,
                        imageUrl = oi.Product.ProductImages.Select(pi => pi.ImageUrl).ToList()
                    }).ToList()
                })
                .OrderByDescending(e => e.OrderDate)
                .ToListAsync();
            return orders;
        }
    }
}
