using Application.Interfaces;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class CategoryRepository: ICategoryRepository
    {
        private readonly EcommerceOrderSystemContext _context;
        public CategoryRepository(EcommerceOrderSystemContext context) { 
            _context = context;
        }

        public async Task<Category> AddNewCategoryAsync(string name, string description, string? picture)
        {
            var category = new Category
            {
                Name = name,
                Description = description,
                Picture = picture
            };
            await _context.Categories.AddAsync(category);
            return category;
        }
    }
}
