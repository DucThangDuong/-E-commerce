using Application.DTOs.Response;
using Application.Features.Products.Queries;
using FastEndpoints;

namespace API.EndPoints.Product
{
    public class ReqGetDetalProductDto
    {
        public int productId { get; set; }
    }
    public class GetDetailProductEndpoint:Endpoint<ReqGetDetalProductDto>
    {
        public GetDetailProductHandler _handler { get; set; } = null!;
        public override void Configure()
        {
            Get("/product/detail");
            AllowAnonymous();
        }
        public override async Task HandleAsync(ReqGetDetalProductDto req, CancellationToken ct)
        {
            var result = await _handler.HandleAsync(new GetDetailProductQuery(req.productId));
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(result.Data, 200, ct);
            }
            else
            {
                await Send.ResponseAsync(result.Error, result.StatusCode, ct);
            }
        }
    }
}
