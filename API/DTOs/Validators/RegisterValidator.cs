using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class RegisterValidator : Validator<ReqRegisterDto>
{
    public RegisterValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Email)
            .NotEmpty().WithMessage(x => localizer["VAL_EMAIL_EMPTY"])
            .EmailAddress().WithMessage(x => localizer["VAL_EMAIL_INVALID"])
            .MaximumLength(255).WithMessage(x => localizer["VAL_EMAIL_MAX"]);

        RuleFor(x => x.Password)
            .NotEmpty().WithMessage(x => localizer["VAL_PASSWORD_EMPTY"])
            .MinimumLength(8).WithMessage(x => localizer["VAL_PASSWORD_MIN"])
            .MaximumLength(64).WithMessage(x => localizer["VAL_PASSWORD_MAX_64"])
            .Matches("[A-Z]").WithMessage(x => localizer["VAL_PASSWORD_UPPERCASE"])
            .Matches("[a-z]").WithMessage(x => localizer["VAL_PASSWORD_LOWERCASE"])
            .Matches("[0-9]").WithMessage(x => localizer["VAL_PASSWORD_DIGIT"])
            .Matches("[^a-zA-Z0-9]").WithMessage(x => localizer["VAL_PASSWORD_SPECIAL"]);

        RuleFor(x => x.Fullname)
            .NotEmpty().WithMessage(x => localizer["VAL_FULLNAME_EMPTY"])
            .MaximumLength(100).WithMessage(x => localizer["VAL_FULLNAME_MAX"])
            .Matches(@"^[\p{L}\p{M}\s\.\-]+$").WithMessage(x => localizer["VAL_FULLNAME_FORMAT"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_XSS_DETECTED"]);
    }
}

