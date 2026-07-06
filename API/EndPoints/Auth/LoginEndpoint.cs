using API.DTOs;
using Application.Features.Customers.Commands;
using Application.Features.Customers.Queries;
using FastEndpoints;
using MediatR;

namespace API.EndPoints.Auth;

public class LoginEndpoint : Endpoint<ReqLoginDTo>
{
    public IMediator Mediator { get; set; } = null!;

    public Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> Localizer { get; set; } = null!;

    public override void Configure()
    {
        Post("/login");
        AllowAnonymous();
        Options(x => x.RequireRateLimiting("auth_strict"));
    }

    public override async Task HandleAsync(ReqLoginDTo req, CancellationToken ct)
    {
        var result = await Mediator.Send(new AddLoginUserCommands(req.Email, req.Password), ct);
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
            var response = new ApiSuccessResponse<string>
            {
                Data = result.Data?.AccessToken ?? "",
                Message = Localizer["SUCCESS_LOGIN"].Value,
            };
            await Send.ResponseAsync(response, result.StatusCode, ct);
        }
        else
        {
            var response = new ApiErrorResponse
            {
                Message = Localizer[result.ErrorCode ?? "ERR_LOGIN_FAILED"].Value,
                ErrorCode = result.ErrorCode ?? "ERR_LOGIN_FAILED",
                Errors = result.Errors
            };
            await Send.ResponseAsync(response, result.StatusCode, ct);
        }
    }
}
