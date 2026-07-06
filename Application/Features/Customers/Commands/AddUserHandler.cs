using Application.Common;
using Application.Interfaces;
using MassTransit;
using Application.DTOs.Services;
using MediatR;

namespace Application.Features.Customers.Commands
{
    public record AddUserCommand(string Name, string Email, string Password) : IRequest<Result>;

    public class AddUserHandler : IRequestHandler<AddUserCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        private readonly ICustomerRepository _customerRepository;
        public AddUserHandler(IUnitOfWork unitOfWork, ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result> Handle(AddUserCommand command, CancellationToken ct)
        {
            if (string.IsNullOrEmpty(command.Email) || string.IsNullOrEmpty(command.Password) || string.IsNullOrEmpty(command.Name))
            {
                return Result.Failure("ERR_AUTH_CREDENTIALS_EMPTY", 400);
            }
            try
            {
                bool isEmailExists = await _customerRepository.EmailExistsAsync(command.Email);
                if (isEmailExists)
                {
                    return Result.Failure("ERR_AUTH_EMAIL_EXISTS", 400);
                }
                await _customerRepository.AddAsync(command.Email, command.Password, command.Name);

                await _unitOfWork.SaveChangesAsync(ct);
                return Result.Success(201);
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }
}

