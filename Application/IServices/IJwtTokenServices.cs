using Application.DTOs.Services;
using System.Security.Claims;

namespace Application.IServices
{
    public interface IJWTTokenServices
    {
        public string GenerateAccessToken(int userId, string role);
        public RefreshToken GenerateRefreshToken();
        public ClaimsPrincipal GetPrincipalFromExpiredToken(string token);
    }
}
