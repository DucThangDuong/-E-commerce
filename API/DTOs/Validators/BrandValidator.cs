using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class BrandValidator : Validator<ReqCreateBrandDto>
{
    public BrandValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage(x => localizer["VAL_BRAND_NAME_EMPTY"])
            .MaximumLength(100).WithMessage(x => localizer["VAL_BRAND_NAME_MAX"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);

        RuleFor(x => x.Description)
            .MaximumLength(500).WithMessage(x => localizer["VAL_BRAND_DESC_MAX"])
            .Must(XssProtection.IsCleanDescription).WithMessage(x => localizer["VAL_XSS_DETECTED"])
            .When(x => !string.IsNullOrEmpty(x.Description));

        RuleFor(x => x.LogoUrl)
            .MaximumLength(2048).WithMessage(x => localizer["VAL_BRAND_LOGO_MAX"])
            .Must(XssProtection.IsCleanUrl).WithMessage(x => localizer["VAL_URL_INVALID"])
            .When(x => !string.IsNullOrEmpty(x.LogoUrl));
    }
}

