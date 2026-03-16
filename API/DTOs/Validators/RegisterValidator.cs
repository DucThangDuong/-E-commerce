using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class RegisterValidator : Validator<ReqRegisterDto>
{
    public RegisterValidator()
    {
        RuleFor(x => x.Email)
            .NotEmpty().WithMessage("Email không được để trống")
            .EmailAddress().WithMessage("Email không đúng định dạng");

        RuleFor(x => x.Password)
            .NotEmpty().WithMessage("Mật khẩu không được để trống")
            .MinimumLength(6).WithMessage("Mật khẩu phải dài ít nhất 6 ký tự");

        RuleFor(x => x.Fullname)
            .NotEmpty().WithMessage("Họ tên không được để trống");
    }
}
