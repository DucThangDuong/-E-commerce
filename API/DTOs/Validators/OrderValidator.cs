using API.DTOs;
using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class OrderValidator : Validator<ReqAddNewOrder>
{
    public OrderValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Items)
            .NotNull().WithMessage(x => localizer["VAL_ITEMS_NULL"])
            .NotEmpty().WithMessage(x => localizer["VAL_ITEMS_MIN"]);

        RuleForEach(x => x.Items).ChildRules(items =>
        {
            items.RuleFor(x => x.ColorId)
                .GreaterThan(0).WithMessage(x => localizer["VAL_COLOR_ID_INVALID"]);
            
            items.RuleFor(x => x.Quantity)
                .GreaterThan(0).WithMessage(x => localizer["VAL_QUANTITY_INVALID"]);
        });
    }
}

