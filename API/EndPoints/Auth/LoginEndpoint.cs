using API.DTOs;
using Application.Features.Customers.Queries;
using FastEndpoints;

namespace API.EndPoints.Auth;

public class LoginEndpoint : Endpoint<ReqLoginDTo>
{
    public GetLoginUserHandler Handler {get;set;}=null!;
    public override void Configure()
    {
        Post("/login");
        AllowAnonymous();
        Options(x=>x.RequireRateLimiting("auth_strict"));
    }
    public override async Task HandleAsync(ReqLoginDTo req, CancellationToken ct)
    {
        var result = await Handler.HandleAsync(new LoginCommand(req.Email, req.Password), ct);
        if (result.IsSuccess)
        {
            if (result.Data != null)
            {
                HttpContext.Response.Cookies.Append("refreshToken", result.Data.RefreshToken, new CookieOptions
                {
                    HttpOnly = true,
                    Expires = result.Data.RefreshTokenExpiryTime,
                    Secure = true, 
                    SameSite = SameSiteMode.None,
                    IsEssential = true
                });
            }
            await Send.ResponseAsync(result.Data!, result.StatusCode, ct);
        }
        else
        {
            await Send.ResponseAsync(new { message = result.Error }, result.StatusCode, ct);
        }
    }
}
