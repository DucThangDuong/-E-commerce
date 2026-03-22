using API.Extendsion;
using Application.Features.Customers.Commands;
using FastEndpoints;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace API.Endpoints.Auth;

public class LogoutEndpoint : EndpointWithoutRequest
{
    public IMediator Mediator { get; set; } = null!;
    public override void Configure()
    {
        Post("/logout");
        AuthSchemes(JwtBearerDefaults.AuthenticationScheme);
    }

    public override async Task HandleAsync(CancellationToken ct)
    {
        int userId = HttpContext.User.GetUserId();
        var result = await Mediator.Send(new UpdateRevokeRefreshTokenCommand(userId));
        if (result.IsSuccess)
        {
            await Send.NoContentAsync();
        }
        await Send.ResponseAsync(new { message = result.Error }, result.StatusCode, ct);
    }
}

