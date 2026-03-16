using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        public readonly EcommerceOrderSystemContext _context;
        public ICustomerRepository CustomerRepository { get; private set; }
        public ICartRepository CartRepository { get; private set; }
        public IApplicationDbContext Context { get; private set; }
        public ICategoryRepository CategoryRepository { get; private set; }
        public IProductRepository ProductRepository { get; private set; }


        public UnitOfWork(EcommerceOrderSystemContext context)
        {
            _context = context;
            CustomerRepository = new CustomerRepository(_context);
            CartRepository = new CartRepository(_context);
            CategoryRepository = new CategoryRepository(_context);
            ProductRepository = new ProductRepository(_context);
            Context = _context;
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
