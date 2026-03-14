using API.DTOs;
using Application.Features.Customer.Commands;
using FastEndpoints;

namespace API.EndPoints.Auth;

public class LoginEndpoint : Endpoint<ReqLoginDTo>
{
    public AddUserHandler Handler {get;set;}=null!;
    public override void Configure()
    {
        Post("/login");
        AllowAnonymous();
    }
    public override async Task HandleAsync(ReqLoginDTo req, CancellationToken ct)
    {
        var result= await Handler.HandleAsync(new AddUserCommand(req.Email,req.Password), ct);
        if(result.IsSuccess)
        {
            await Send.ResponseAsync(result.StatusCode);
        }
        else
        {
            await Send.ResponseAsync(result.Error, result.StatusCode, ct);
        }
    }
}
