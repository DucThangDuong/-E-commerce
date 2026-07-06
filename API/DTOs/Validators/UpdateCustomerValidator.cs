using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class UpdateCustomerNameValidator : Validator<ReqUpdateCustomerName>
{
    public UpdateCustomerNameValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage(x => localizer["VAL_NAME_EMPTY"])
            .MaximumLength(100).WithMessage(x => localizer["VAL_NAME_MAX"])
            .Matches(@"^[\p{L}\p{M}\s\.\-]+$").WithMessage(x => localizer["VAL_NAME_FORMAT"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);
    }
}

public class UpdateCustomerPhoneValidator : Validator<ReqUpdateCustomerPhone>
{
    public UpdateCustomerPhoneValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.PhoneNumber)
            .NotEmpty().WithMessage(x => localizer["VAL_PHONE_EMPTY"])
            .MaximumLength(20).WithMessage(x => localizer["VAL_PHONE_MAX_20"])
            .Matches(@"^[\d\+\-\s]*$").WithMessage(x => localizer["VAL_PHONE_FORMAT_EXT"]);
    }
}

public class UpdateCustomerAddressValidator : Validator<ReqUpdateCustomerAddress>
{
    public UpdateCustomerAddressValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Address)
            .NotEmpty().WithMessage(x => localizer["VAL_ADDRESS_EMPTY"])
            .MaximumLength(500).WithMessage(x => localizer["VAL_ADDRESS_MAX"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);
    }
}

public class UpdateCustomerPasswordValidator : Validator<ReqUpdateCustomerPassword>
{
    public UpdateCustomerPasswordValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.OldPassword)
            .NotEmpty().WithMessage(x => localizer["VAL_OLD_PASSWORD_EMPTY"]);

        RuleFor(x => x.NewPassword)
            .NotEmpty().WithMessage(x => localizer["VAL_NEW_PASSWORD_EMPTY"])
            .MinimumLength(6).WithMessage(x => localizer["VAL_NEW_PASSWORD_MIN_6"]);
    }
}

