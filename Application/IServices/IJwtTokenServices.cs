using Application.DTOs.Services;

namespace Application.IServices
{
    public interface IJWTTokenServices
    {
        public string GenerateAccessToken(int userId, string email, string role);
        public RefreshToken GenerateRefreshToken();
    }
}
