using Application.DTOs.Response;
using Application.Features.Carts.Command;
using Application.Features.Categories.Queries;
using Domain.Entities;
using FastEndpoints;

namespace API.EndPoints.Category
{
    public class ReqGetTotalCategoryDto
    {
        public int take { get; set; } = 10;
    }
    public class GetTotalCategoryEndpoint : Endpoint<ReqGetTotalCategoryDto, List<ResCategoryDto>>
    {
        public GetAllCategoryHandler _handler { get; set; } = null!;
        public override void Configure()
        {
            Get("/category");
            AllowAnonymous();
        }
        public override async Task HandleAsync(ReqGetTotalCategoryDto req, CancellationToken ct)
        {
            var result = await _handler.HandleAsync(new GetAllCategoryQuery(req.take));
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(result.Data!, 200);
            }
            else
            {
                await Send.ResponseAsync(new List<ResCategoryDto>(), result.StatusCode);
            }
        }
    }
}