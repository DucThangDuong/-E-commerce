using Application.Common;
using Application.DTOs.Response;
using Application.Interfaces;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Order.Queries
{
    public record GetOrderOfCustomerQuery(int CustomerId) : IRequest<Result<List<ResOrder>>>;
    public class GetOrderOfCustomerHandler : IRequestHandler<GetOrderOfCustomerQuery, Result<List<ResOrder>>>
    {
        private readonly IUnitOfWork _unitOfWork;

        public GetOrderOfCustomerHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<List<ResOrder>>> Handle(GetOrderOfCustomerQuery request, CancellationToken cancellationToken)
        {
            var orders = await _unitOfWork.OrderRepository.GetOrdersByCustomerIdAsync(request.CustomerId);
            return Result<List<ResOrder>>.Success(orders);
        }
    }
}
