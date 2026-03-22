using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using MediatR;

namespace Application.Features.Customers.Queries
{
    public record GetCustomerProfileQuery(int CustomerId) : IRequest<Result<ResCustomerPrivateDto>>;

    public class GetCustomerProfileHandler : IRequestHandler<GetCustomerProfileQuery, Result<ResCustomerPrivateDto>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetCustomerProfileHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<ResCustomerPrivateDto>> Handle(GetCustomerProfileQuery query, CancellationToken ct)
        {
            try
            {
                var customer = await _unitOfWork.CustomerRepository.GetCustomerProfileAsync(query.CustomerId, ct);
                if (customer == null)
                {
                    return Result<ResCustomerPrivateDto>.Failure("Not found", 404);
                }
                return Result<ResCustomerPrivateDto>.Success(customer);
            }
            catch (Exception ex)
            {
                return Result<ResCustomerPrivateDto>.Failure(ex.Message, 400);
            }
        }
    }
}
