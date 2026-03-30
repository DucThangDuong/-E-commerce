using Application.Common;
using Application.Interfaces;
using MediatR;
using StackExchange.Redis;
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
        private readonly IDatabase _redisConnection;
        public UpdateRevokeRefreshTokenHandler(IConnectionMultiplexer multiplexer)
        {
            _redisConnection = multiplexer.GetDatabase();
        }

        public async Task<Result> Handle(UpdateRevokeRefreshTokenCommand request, CancellationToken cancellationToken)
        {
            try
            {
                string redisKey = $"RefreshToken:{request.customerId}";
                await _redisConnection.KeyDeleteAsync(redisKey);
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Failure("Lỗi server: " + ex.Message, 500);
            }
        }
    }
}
