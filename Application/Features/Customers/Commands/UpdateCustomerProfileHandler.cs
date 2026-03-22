using Application.Common;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Customers.Commands
{
    public record UpdateCustomerProfileCommand(int CustomerId, string Name, string? PhoneNumber, string? Address) : IRequest<Result>;

    public class UpdateCustomerProfileHandler : IRequestHandler<UpdateCustomerProfileCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        public UpdateCustomerProfileHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<Result> Handle(UpdateCustomerProfileCommand command, CancellationToken ct)
        {
            try
            {
                int rowsAffected = await _unitOfWork.CustomerRepository.UpdateCustomerProfileAsync(
                    command.CustomerId, 
                    command.Name, 
                    command.PhoneNumber, 
                    command.Address, 
                    ct);

                if (rowsAffected == 0)
                {
                    return Result.Failure("Không tìm thấy người dùng", 404);
                }

                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Failure("Lỗi server: " + ex.Message, 500);
            }
        }
    }
}
