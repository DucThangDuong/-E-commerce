using Application.Common;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Categories.Command
{
    public record AddNewCategoryCommand(string Name, string Description,string? Picture);
    public class AddNewCategoryHandler : ICommandHandler<AddNewCategoryCommand>
    {
        private readonly IUnitOfWork _context;
        public AddNewCategoryHandler(IUnitOfWork context)
        {
            _context = context;
        }
        public async Task<Result> HandleAsync(AddNewCategoryCommand command, CancellationToken ct = default)
        {
           var value= await _context.CategoryRepository.AddNewCategoryAsync(command.Name, command.Description, command.Picture);
            if(value!=null)
            {
                await _context.SaveChangesAsync();
                return Result.Success();
            }
            else
            {
                return Result.Failure("Failed to add new category", 500);
            }
        }
    }
}
