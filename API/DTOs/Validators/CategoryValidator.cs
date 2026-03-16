using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators;

public class CategoryValidator : Validator<ReqCreateCategoryDto>
{
    public CategoryValidator()
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage("Tên danh mục không được để trống");
    }
}
