using API.DTOs;
using Application.Features.Categories.Command;
using FastEndpoints;

namespace API.EndPoints.Category
{
    public class AddNewCategoryEndpoint:Endpoint<ReqCreateCategoryDto>
    {
        public AddNewCategoryHandler Handler { get; set; } = null!;
        public override void Configure()
        {
            Post("/category");
            AllowAnonymous();
        }
        public override async Task HandleAsync(ReqCreateCategoryDto req, CancellationToken ct)
        {
            var result = await Handler.HandleAsync(new AddNewCategoryCommand(req.Name, req.Description, req.Picture));
            if (result.IsSuccess)
            {
                await Send.ResponseAsync(null, 201, ct);
                return;
            }
            await Send.ResponseAsync(new { message = result.Error }, result.StatusCode, ct);
            return;

        }
    }
}
