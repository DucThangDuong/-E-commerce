using Application.Common;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Customers.Commands
{
    public record UpdateCustomerNameCommand(int CustomerId, string Name) : IRequest<Result>;

    public class UpdateCustomerNameHandler : IRequestHandler<UpdateCustomerNameCommand, Result>
    {

        private readonly ICustomerRepository _customerRepository;
        public UpdateCustomerNameHandler(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        public async Task<Result> Handle(UpdateCustomerNameCommand command, CancellationToken ct)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(command.Name)) return Result.Failure("ERR_PROFILE_NAME_EMPTY", 400);

                int rowsAffected = await _customerRepository.UpdateCustomerProfileAsync(
                    command.CustomerId, 
                    command.Name, 
                    null, 
                    null, 
                    ct);

                if (rowsAffected == 0) return Result.Failure("ERR_USER_NOT_FOUND", 404);
                return Result.Success();
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }

    public record UpdateCustomerPhoneCommand(int CustomerId, string PhoneNumber) : IRequest<Result>;

    public class UpdateCustomerPhoneHandler : IRequestHandler<UpdateCustomerPhoneCommand, Result>
    {
        private readonly ICustomerRepository _customerRepository;

        public UpdateCustomerPhoneHandler(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        public async Task<Result> Handle(UpdateCustomerPhoneCommand command, CancellationToken ct)
        {
            try
            {
                // Basic validation
                if (string.IsNullOrWhiteSpace(command.PhoneNumber) || command.PhoneNumber.Length < 10) 
                    return Result.Failure("ERR_PROFILE_PHONE_INVALID", 400);

                int rowsAffected = await _customerRepository.UpdateCustomerProfileAsync(
                    command.CustomerId, 
                    null, 
                    command.PhoneNumber, 
                    null, 
                    ct);

                if (rowsAffected == 0) return Result.Failure("ERR_USER_NOT_FOUND", 404);
                return Result.Success();
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }

    public record UpdateCustomerAddressCommand(int CustomerId, string Address) : IRequest<Result>;

    public class UpdateCustomerAddressHandler : IRequestHandler<UpdateCustomerAddressCommand, Result>
    {
        private readonly ICustomerRepository _customerRepository;

        public UpdateCustomerAddressHandler(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        public async Task<Result> Handle(UpdateCustomerAddressCommand command, CancellationToken ct)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(command.Address)) 
                    return Result.Failure("ERR_PROFILE_ADDRESS_EMPTY", 400);

                int rowsAffected = await _customerRepository.UpdateCustomerProfileAsync(
                    command.CustomerId, 
                    null, 
                    null, 
                    command.Address, 
                    ct);

                if (rowsAffected == 0) return Result.Failure("ERR_USER_NOT_FOUND", 404);
                return Result.Success();
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }

    public record UpdateCustomerPasswordCommand(int CustomerId, string OldPassword, string NewPassword) : IRequest<Result>;

    public class UpdateCustomerPasswordHandler : IRequestHandler<UpdateCustomerPasswordCommand, Result>
    {
        private readonly IAppReadDbContext _db;
        private readonly ICustomerRepository _customerRepository;

        public UpdateCustomerPasswordHandler(ICustomerRepository customerRepository, IAppReadDbContext db)
        {
            _customerRepository = customerRepository;
            _db = db;
        }

        public async Task<Result> Handle(UpdateCustomerPasswordCommand command, CancellationToken ct)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(command.NewPassword) || command.NewPassword.Length < 6)
                    return Result.Failure("ERR_PROFILE_PASSWORD_MIN_LENGTH", 400);

                var customer = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.FirstOrDefaultAsync(_db.Customers, c => c.CustomerId == command.CustomerId, ct);
                
                if (customer == null) 
                    return Result.Failure("ERR_USER_NOT_FOUND", 404);

                if (string.IsNullOrEmpty(customer.PasswordHash))
                {
                    return Result.Failure("ERR_PROFILE_NO_PASSWORD_SET", 400);
                }

                bool isOldPasswordValid = BCrypt.Net.BCrypt.Verify(command.OldPassword, customer.PasswordHash);
                if (!isOldPasswordValid)
                {
                    return Result.Failure("ERR_PROFILE_OLD_PASSWORD_INCORRECT", 400);
                }

                string newHash = BCrypt.Net.BCrypt.HashPassword(command.NewPassword);
                await _customerRepository.UpdatePasswordAsync(command.CustomerId, newHash, ct);
                
                return Result.Success();
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }
}
