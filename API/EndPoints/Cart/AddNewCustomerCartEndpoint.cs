using API.DTOs;
using Application.Features.Carts.Command;
using FastEndpoints;
using Infrastructure;
using Microsoft.AspNetCore.Authentication.JwtBearer;
namespace API.EndPoints.Cart
{
    public class AddNewCustomerCartEndpoint : Endpoint<ReqCreateCartDto>
    {
        public AddItemCartCustomerHandler Handler { get; set; } = null!;
        public override void Configure()
        {
            Post("/cart");
            AllowAnonymous();
            AuthSchemes(JwtBearerDefaults.AuthenticationScheme);
        }
        public override async Task HandleAsync(ReqCreateCartDto req, CancellationToken ct)
        {
            if (req.customer_id == 0 || req.product_id == 0 || req.quantity == 0)
            {
                await Send.ResponseAsync(new { message = "customer_id, product_id and quantity must be provided and greater than 0" }, statusCode: 400, ct);
                return;
            }
            var result = await Handler.HandleAsync(new AddItemCartCustomerCommand(req.customer_id, req.product_id, req.quantity), ct);
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(null, 201);
            }
            else
            {
                await Send.ResponseAsync(new { message = result.Error }, statusCode: 400, ct);
            }
        }
    }
}
