using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class CreatePaymentValidator : Validator<ReqCreatePayment>
{
    public CreatePaymentValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Items)
            .NotEmpty().WithMessage(x => localizer["VAL_ITEMS_EMPTY"]);

        RuleForEach(x => x.Items).ChildRules(item =>
        {
            item.RuleFor(i => i.ColorId).GreaterThan(0).WithMessage(x => localizer["VAL_COLOR_ID_INVALID"]);
            item.RuleFor(i => i.Quantity).GreaterThan(0).WithMessage(x => localizer["VAL_QUANTITY_INVALID"]);
        });

        RuleFor(x => x.FullName)
            .NotEmpty().WithMessage(x => localizer["VAL_FULLNAME_EMPTY"])
            .MaximumLength(100).WithMessage(x => localizer["VAL_FULLNAME_MAX"])
            .Matches(@"^[\p{L}\p{M}\s\.\-]+$").WithMessage(x => localizer["VAL_FULLNAME_FORMAT"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);

        RuleFor(x => x.Address)
            .NotEmpty().WithMessage(x => localizer["VAL_ADDRESS_EMPTY"])
            .MaximumLength(500).WithMessage(x => localizer["VAL_ADDRESS_MAX"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);

        RuleFor(x => x.PhoneNumber)
            .NotEmpty().WithMessage(x => localizer["VAL_PHONE_EMPTY"])
            .MinimumLength(10).WithMessage(x => localizer["VAL_PHONE_MIN"])
            .MaximumLength(10).WithMessage(x => localizer["VAL_PHONE_MAX"])
            .Matches(@"^[\d\+\-\s]*$").WithMessage(x => localizer["VAL_PHONE_FORMAT"]);

        RuleFor(x => x.TypePayment)
            .InclusiveBetween(0, 1).WithMessage(x => localizer["VAL_PAYMENT_TYPE_INVALID"]);
    }
}

