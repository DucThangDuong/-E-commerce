using Application.Common;
using Application.Interfaces;
using Application.IServices;
using Microsoft.AspNetCore.Http;

namespace Application.Features.Customer.Commands
{
    public record AddUserCommand(string ?Email, string ?Password);

    public class AddUserHandler : ICommandHandler<AddUserCommand>
    {
        private readonly IUnitOfWork _context;
        private readonly IJWTTokenServices _jwtTokenService;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AddUserHandler(IUnitOfWork context, IJWTTokenServices jwtTokenService, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _jwtTokenService = jwtTokenService;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<Result> HandleAsync(AddUserCommand command, CancellationToken cancellationToken)
        {
            if (string.IsNullOrEmpty(command.Email) || string.IsNullOrEmpty(command.Password))
            {
                return Result.Failure("Email và mật khẩu không được để trống.", 400);
            }
            var userEntity = await _context.CustomerRepository.GetByEmailAsync(command.Email);
            if (userEntity == null || !BCrypt.Net.BCrypt.Verify(command.Password, userEntity.PasswordHash))
            {
                return Result.Failure("Tài khoản hoặc mật khẩu không chính xác.", 401);
            }
            try
            {
                string role = userEntity.Role ?? "User";
                var accessToken = _jwtTokenService.GenerateAccessToken(userEntity.CustomerId, userEntity.Email!, role);
                var refreshToken = _jwtTokenService.GenerateRefreshToken();
                userEntity.RefreshToken = refreshToken.Token;
                userEntity.RefreshTokenExpiryTime = refreshToken.ExpiryDate;
                userEntity.LoginProvider = "Custom";

                var httpContext = _httpContextAccessor.HttpContext;
                if (httpContext != null)
                {
                    httpContext.Response.Cookies.Append("refreshToken", refreshToken.Token, new CookieOptions
                    {
                        HttpOnly = true,
                        Expires = refreshToken.ExpiryDate,
                        Secure = true,
                        SameSite = SameSiteMode.None,
                        IsEssential = true
                    });
                }

                await _context.SaveChangesAsync();
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Failure($"Lỗi server: {ex.Message}", 500);
            }
        }
    }
}
