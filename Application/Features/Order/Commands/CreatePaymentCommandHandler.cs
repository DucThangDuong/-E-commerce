using Application.Common;
using Application.IServices;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.Order.Commands
{
    public record CreatePaymentCommand(int OrderId, decimal Amount, string IpAddress) : IRequest<Result<string>>;

    public class CreatePaymentCommandHandler : IRequestHandler<CreatePaymentCommand, Result<string>>
    {
        private readonly IVnPayService _vnPayService;
        public CreatePaymentCommandHandler(IVnPayService vnPayService)
        {
            _vnPayService = vnPayService;
        }

        public async Task<Result<string>> Handle(CreatePaymentCommand request, CancellationToken cancellationToken)
        {
            try
            {
                var paymentUrl = _vnPayService.CreatePaymentUrl(request.OrderId, request.Amount, request.IpAddress);
                return Result<string>.Success(paymentUrl);
            }
            catch (Exception ex)
            {
                return Result<string>.Failure(ex.Message, 500);
            }
        }
    }
}
