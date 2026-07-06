using API.DTOs;
using Application.Features.Customers.Queries;
using FastEndpoints;
using MediatR;

namespace API.Endpoints.Auth;

public class RefreshTokenEndpoint : EndpointWithoutRequest
{
    public IMediator Mediator { get; set; } = null!;

    public Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> Localizer { get; set; } = null!;

    public override void Configure()
    {
        Post("/refresh-token");
        AllowAnonymous();
        Options(x => x.RequireRateLimiting("auth_strict"));
    }

    public override async Task HandleAsync(CancellationToken ct)
    {
        var accessToken = HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Replace("Bearer ", "");
        var refreshToken = HttpContext.Request.Cookies["refreshToken"];
        var result = await Mediator.Send(new RefreshTokenCommand(accessToken, refreshToken), ct);

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
                Message = Localizer["SUCCESS_TOKEN_REFRESHED"].Value,
            };
            await Send.ResponseAsync(response, 200, ct);
        }
        else
        {
            var response = new ApiErrorResponse
            {
                Message = Localizer[result.ErrorCode ?? "ERR_TOKEN_REFRESH_FAILED"].Value,
                ErrorCode = result.ErrorCode ?? "ERR_TOKEN_REFRESH_FAILED",
                Errors = result.Errors
            };
            await Send.ResponseAsync(response, result.StatusCode, ct);
        }
    }
}
