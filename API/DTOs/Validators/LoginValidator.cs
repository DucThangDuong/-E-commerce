using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class LoginValidator : Validator<ReqLoginDTo>
{
    public LoginValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.Email)
            .NotEmpty().WithMessage(x => localizer["VAL_EMAIL_EMPTY"])
            .EmailAddress().WithMessage(x => localizer["VAL_EMAIL_INVALID"])
            .MaximumLength(255).WithMessage(x => localizer["VAL_EMAIL_MAX"]);

        RuleFor(x => x.Password)
            .NotEmpty().WithMessage(x => localizer["VAL_PASSWORD_EMPTY"])
            .MaximumLength(100).WithMessage(x => localizer["VAL_PASSWORD_MAX"]);
    }
}
public class LoginGoogle : Validator<ReqGoogleLoginDTO>
{
    public LoginGoogle(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer)
    {
        RuleFor(x => x.IdToken)
            .NotEmpty().WithMessage(x => localizer["VAL_IDTOKEN_EMPTY"])
            .MaximumLength(4096).WithMessage(x => localizer["VAL_IDTOKEN_MAX"])
            .Must(XssProtection.IsCleanText).WithMessage(x => localizer["VAL_IDTOKEN_XSS"]);
    }
}

