using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class CartValidator : Validator<ReqCreateCartDto>
{
    public CartValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {

        RuleFor(x => x.color_id)
            .GreaterThan(0).WithMessage(x => localizer["VAL_COLOR_ID_INVALID"]);

        RuleFor(x => x.quantity)
            .GreaterThan(0).WithMessage(x => localizer["VAL_QUANTITY_INVALID"]);
    }
}

