using Application.Common;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Carts.Command
{
    public record DeleteItemCartCustomerCommand(int customerId,int producId);
    public class DeleteItemCartCustomerHandler : ICommandHandler<DeleteItemCartCustomerCommand>
    {
        public IUnitOfWork _context;
        public DeleteItemCartCustomerHandler(IUnitOfWork context)
        {
            _context = context;
        }

        public async Task<Result> HandleAsync(DeleteItemCartCustomerCommand command, CancellationToken ct = default)
        {
            bool result= await _context.CartRepository.DeleteCartAsync(command.customerId, command.producId);
            if (result) {
                return Result.Success();
            }
            return Result.Failure("Loi he thong",500);
        }
    }
}
