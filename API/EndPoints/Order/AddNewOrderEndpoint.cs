using API.DTOs;
using API.Extendsion;
using Application.Features.Order.Commands;
using FastEndpoints;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace API.EndPoints.Order
{
    public class AddNewOrderEndpoint : Endpoint<ReqAddNewOrder>
    {
        public IMediator Mediator { get; set; }
        public AddNewOrderEndpoint(IMediator mediator)
        {
            Mediator = mediator;
        }
        public override void Configure()
        {
            Post("/order");
            AuthSchemes(JwtBearerDefaults.AuthenticationScheme);
        }
        public override async Task HandleAsync(ReqAddNewOrder req, CancellationToken ct)
        {
            Dictionary<int, int> items = new Dictionary<int, int>();
            int userId = HttpContext.User.GetUserId();
            foreach (var item in req.Items)
            {
                if (items.ContainsKey(item.ProductId))
                {
                    items[item.ProductId] += item.Quantity;
                }
                else
                {
                    items.Add(item.ProductId, item.Quantity);
                }
            }
            var result = await Mediator.Send(new AddOrderItemCustomerCommand(userId, items, req.Address, req.PhoneNumber), ct);
            if (result.IsSuccess)
            {
                await Send.NoContentAsync(ct);
            }
            else
            {
                await Send.ResponseAsync(new { message = result.Error, outOfStockItems = result.Data }, statusCode: result.StatusCode, ct);
            }
        }
    }
}
