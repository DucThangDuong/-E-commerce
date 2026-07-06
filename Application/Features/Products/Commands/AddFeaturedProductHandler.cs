using Application.Common;
using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.Products.Commands
{
    public record AddFeaturedProductCommand(
        int ProductId,
        int? DisplayOrder,
        DateTime? StartDate,
        DateTime? EndDate) : IRequest<Result>;

    public class AddFeaturedProductHandler : IRequestHandler<AddFeaturedProductCommand, Result>
    {
        private readonly IUnitOfWork _unitOfWork;

        private readonly IProductRepository _productRepository;
        public AddFeaturedProductHandler(IUnitOfWork unitOfWork, IProductRepository productRepository)
        {
            _productRepository = productRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result> Handle(AddFeaturedProductCommand command, CancellationToken ct)
        {
            try
            {
                var product = await _productRepository.ProductExistsAsync(command.ProductId, ct);
                if (product == false)
                {
                    return Result.Failure("ERR_PRODUCT_NOT_FOUND", 404);
                }

                FeaturedProduct featuredProduct = new FeaturedProduct
                {
                    ProductId = command.ProductId,
                    DisplayOrder = command.DisplayOrder,
                    StartDate = command.StartDate,
                    EndDate = command.EndDate,
                    CreatedAt = DateTime.UtcNow
                };

                await _productRepository.AddFeaturedProductAsync(featuredProduct, ct);
                await _unitOfWork.SaveChangesAsync(ct);
                return Result.Success(201);
            }
            catch (Exception)
            {
                return Result.Failure("ERR_SERVER_ERROR", 500);
            }
        }
    }
}
