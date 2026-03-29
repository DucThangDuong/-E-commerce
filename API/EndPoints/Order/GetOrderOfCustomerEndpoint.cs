using API.Extendsion;
using Application.Features.Order.Queries;
using FastEndpoints;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace API.EndPoints.Order
{
    public class GetOrderOfCustomerEndpoint: EndpointWithoutRequest
    {
        public IMediator Mediator { get; set; }
        
        public GetOrderOfCustomerEndpoint(IMediator mediator)
        {
            Mediator = mediator;
        }

        public override void Configure()
        {
            Get("/order/customer");
            AuthSchemes(JwtBearerDefaults.AuthenticationScheme);
        }
        
        public override async Task HandleAsync(CancellationToken ct)
        {
            int customerId = HttpContext.User.GetUserId();
            
            var result = await Mediator.Send(new GetOrderOfCustomerQuery(customerId), ct);
            
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(result.Data, cancellation: ct);
            }
            else
            {
                await Send.ResponseAsync(new { error = result.Error }, result.StatusCode, cancellation: ct);
            }
        }
    }
}
