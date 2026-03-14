using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface ICustomerRepository
    {
        public void AddAsync(Customer customer);
        public Task SaveChangesAsync();
        public Task<Customer?> GetByEmailAsync(string email);
    }
}
