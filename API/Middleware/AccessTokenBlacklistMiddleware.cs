using StackExchange.Redis;
namespace API.Middleware
{
    public class AccessTokenBlacklistMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IDatabase _redisConnection;
        public AccessTokenBlacklistMiddleware(RequestDelegate next, IConnectionMultiplexer multiplexer)
        {
            _next = next;
            _redisConnection = multiplexer.GetDatabase();
        }
        public async Task InvokeAsync(HttpContext context)
        {
            var authHeader = context.Request.Headers["Authorization"].FirstOrDefault();

            if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Bearer "))
            {
                var token = authHeader.Substring("Bearer ".Length).Trim();
                bool isBlacklisted = await _redisConnection.KeyExistsAsync($"Blacklist:{token}");

                if (isBlacklisted)
                {
                    context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                    context.Response.ContentType = "application/json";
                    return; 
                }
            }
            await _next(context);
        }
    }
}
