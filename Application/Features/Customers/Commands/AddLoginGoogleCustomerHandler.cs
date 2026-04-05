using Application.Common;
using Application.DTOs.Response;
using Application.DTOs.Services;
using Application.Interfaces;
using Application.IServices;
using MassTransit;
using MediatR;
using StackExchange.Redis;

namespace Application.Features.Customers.Commands
{
    public record AddLoginGoogleCustomerCommand(string IdToken) : IRequest<Result<LoginResponse>>;

    public class AddLoginGoogleCustomerHandler : IRequestHandler<AddLoginGoogleCustomerCommand, Result<LoginResponse>>
    {
        private readonly IGoogleAuthService _googleAuthService;
        private readonly IPublishEndpoint _publishEndpoint;
        private readonly IDatabase _redisconnection;
        private readonly IUnitOfWork _unitOfWork;

        public AddLoginGoogleCustomerHandler(IGoogleAuthService googleAuthService, IPublishEndpoint publishEndpoint, IConnectionMultiplexer multiplexer, IUnitOfWork unitOfWork)
        {
            _googleAuthService = googleAuthService;
            _publishEndpoint = publishEndpoint;
            _redisconnection = multiplexer.GetDatabase();
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<LoginResponse>> Handle(AddLoginGoogleCustomerCommand command, CancellationToken ct)
        {
            var result = await _googleAuthService.HandleGoogleLoginAsync(command.IdToken);
            if (result != null && result.IsSuccess)
            {
                await _publishEndpoint.Publish(new SendMail(result.Email!, "Đăng nhập thành công",
                    $"Xin chào {result.Email},\n\nBạn đã đăng nhập thành công bằng tài khoản Google của mình. " +
                    $"Nếu không phải là bạn, vui lòng liên hệ với chúng tôi ngay lập tức.\n\nTrân trọng"), ct);
                await _unitOfWork.SaveChangesAsync(ct);
                string redisKey = $"RefreshToken:{result.customerId}";
                await _redisconnection.KeyDeleteAsync(redisKey);
                await _redisconnection.StringSetAsync(redisKey, result.refreshToken.Token, TimeSpan.FromDays(7));
                return Result<LoginResponse>.Success(new LoginResponse
                {
                    AccessToken = result.CustomJwtToken!,
                    RefreshToken = result.refreshToken.Token,
                    RefreshTokenExpiryTime = result.refreshToken.ExpiryDate,
                });
            }
            else
            {
                return Result<LoginResponse>.Failure(result?.ErrorMessage ?? "Lỗi khi đăng nhập bằng Google");
            }
        }
    }
}
