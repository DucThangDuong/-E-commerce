using FastEndpoints;
using FluentValidation;

namespace API.DTOs.Validators
{
    public class CustomerValidator:Validator<ReqGetCustomerProfile>
    {
        public CustomerValidator() {
            RuleFor(x => x.customerId)
                .NotEmpty().WithMessage("Yêu cầu mã người dùng");
        }
    }
    public class CustomerUpdateValidator : Validator<ReqUpdateCustomerProfile>
    {
        public CustomerUpdateValidator()
        {
            RuleFor(x=>x.Name)
                .NotEmpty().WithMessage($"Yêu cầu tên người dùng");
        }
    }
}
