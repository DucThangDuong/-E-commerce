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
    public class CustomerRepository:ICustomerRepository
    {
        private readonly EcommerceOrderSystemContext _context;
        public CustomerRepository(EcommerceOrderSystemContext context) { 
            _context = context;
        }

        public void AddAsync(Customer customer)
        {
            _context.Customers.Add(customer);
        }

        public async Task<Customer?> GetByEmailAsync(string email)
        {
            return await _context.Customers.FirstOrDefaultAsync(c => c.Email == email);
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
