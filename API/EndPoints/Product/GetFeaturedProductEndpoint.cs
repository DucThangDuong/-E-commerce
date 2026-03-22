using Application.Features.Products.Queries;
using FastEndpoints;
using MediatR;

namespace API.EndPoints.Product
{
    public class GetFeaturedProductEndpoint : EndpointWithoutRequest
    {
        public IMediator Mediator { get; set; } = null!;

        public override void Configure()
        {
            Get("/product/featured");
            AllowAnonymous();
        }

        public override async Task HandleAsync(CancellationToken ct)
        {
            var result = await Mediator.Send(new GetFeaturedProductQuery(), ct);
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(result.Data!, 200, ct);
            }
            else
            {
                await Send.ResponseAsync(new { message = result.Error }, result.StatusCode, ct);
            }
        }
    }
}
