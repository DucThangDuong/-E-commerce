using Application.Common;
using Application.Interfaces;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Customers.Commands
{
    public record UpdateRevokeRefreshTokenCommand(int customerId) : IRequest<Result>;
    public class UpdateRevokeRefreshTokenHandler : IRequestHandler<UpdateRevokeRefreshTokenCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;
        public UpdateRevokeRefreshTokenHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<Result> Handle(UpdateRevokeRefreshTokenCommand request, CancellationToken cancellationToken)
        {
            try
            {
                int rowsAffected = await _unitOfWork.CustomerRepository.RevokeRefreshTokenAsync(request.customerId);
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
