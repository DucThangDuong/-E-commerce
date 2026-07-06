using API.DTOs;
using API.Extensions;
using Application.Features.Brands.Commands;
using FastEndpoints;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace API.EndPoints.Brand
{
    public class AddNewBrandEndpoint : Endpoint<ReqCreateBrandDto>
    {
        public IMediator Mediator { get; set; } = null!;
        public Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> Localizer { get; set; } = null!;

        public override void Configure()
        {
            Post("/brand");
            AuthSchemes(JwtBearerDefaults.AuthenticationScheme);
            Roles("Admin");
        }

        public override async Task HandleAsync(ReqCreateBrandDto req, CancellationToken ct)
        {
            var result = await Mediator.Send(new AddNewBrandCommand(req.Name, req.Description, req.LogoUrl), ct);
            await this.SendApiResponseAsync(result, ct, Message: "SUCCESS_BRAND_CREATED");
        }
    }
}

