using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class UnitOfWork:IUnitOfWork
    {
        private readonly EcommerceOrderSystemContext _context;
        public ICustomerRepository CustomerRepository { get; private set; }

        public UnitOfWork(EcommerceOrderSystemContext context) { 
            _context = context;
            CustomerRepository = new CustomerRepository(_context);
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
