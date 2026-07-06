using FastEndpoints;
using FluentValidation;
using System.ComponentModel.DataAnnotations;

namespace API.DTOs.Validators
{
    public class UpdateAvatarCustomerValidator : Validator<ResUpdateAvatarProfile>
    {
        public UpdateAvatarCustomerValidator(Microsoft.Extensions.Localization.IStringLocalizer<API.SharedResource> localizer) {
            RuleFor(x => x.AvatarFile)
                .NotNull().WithMessage(x => localizer["VAL_AVATAR_NULL"]);
            RuleFor(x => x.AvatarFile)
                .Must(x => x != null && x.Length <= 5 * 1024 * 1024)
                .WithMessage(x => localizer["VAL_AVATAR_SIZE"]);
            RuleFor(x => x.AvatarFile)
                .Must(x => x != null && (x.ContentType.Equals("image/jpeg")
                       || x.ContentType.Equals("image/jpg") || x.ContentType.Equals("image/png")))
                .WithMessage(x => localizer["VAL_AVATAR_FORMAT"]);
        }
    }
}

