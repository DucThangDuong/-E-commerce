using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class ProductValidator : Validator<ReqCreateProductDto>
{
    public ProductValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.category_id)
            .GreaterThan(0).WithMessage(x => localizer["VAL_CATEGORY_ID_INVALID"]);
        RuleFor(x => x.brand_id)
            .GreaterThan(0).WithMessage(x => localizer["VAL_BRAND_ID_INVALID"]);

        RuleFor(x => x.name)
            .NotEmpty().WithMessage(x => localizer["VAL_PRODUCT_NAME_EMPTY"])
            .MaximumLength(255).WithMessage(x => localizer["VAL_PRODUCT_NAME_MAX"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);

        RuleFor(x => x.description)
            .MaximumLength(5000).WithMessage(x => localizer["VAL_PRODUCT_DESC_MAX"])
            .Must(XssProtection.IsCleanDescription).WithMessage(x => localizer["VAL_XSS_DETECTED"])
            .When(x => !string.IsNullOrEmpty(x.description));

        RuleFor(x => x.base_price)
            .GreaterThan(0).WithMessage(x => localizer["VAL_BASE_PRICE_INVALID"]);
        RuleFor(x => x.stock_quantity)
            .GreaterThan(0).WithMessage(x => localizer["VAL_STOCK_INVALID"]);
    }
}

