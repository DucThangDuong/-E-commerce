using Application.Common;
using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.Order.Commands
{
    public record AddOrderItemCustomerCommand(int CustomerId, Dictionary<int,int> Items, string Address, string PhoneNumber) : IRequest<Result>;
    public class AddOrderItemCustomerHandler: IRequestHandler<AddOrderItemCustomerCommand, Result>
    {
        public readonly IUnitOfWork _unitOfWork;
        public AddOrderItemCustomerHandler(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<Result> Handle(AddOrderItemCustomerCommand request, CancellationToken ct)
        {
            if (request.Items == null || !request.Items.Any())
                return Result.Failure("Danh sách sản phẩm không được rỗng.");
            List<int> productIds = request.Items.Keys.ToList();

            var allExist = await _unitOfWork.ProductRepository
                .AllProductsExistAsync(productIds, ct);
            if (!allExist)
                return Result.Failure("Một hoặc nhiều sản phẩm không tồn tại.");

            var stockMap = await _unitOfWork.InventoryRepository
                .GetStockByProductIdsAsync(productIds, ct);

            foreach (var item in request.Items)
            {
                int stock = stockMap.ContainsKey(item.Key) ? stockMap[item.Key] : 0;
                if (stock < item.Value)
                    return Result.Failure($"Sản phẩm ID {item.Key} không đủ tồn kho. Yêu cầu: {item.Value}, Tồn kho: {stock}");
            }

            await _unitOfWork.InventoryRepository.UpdateStockAsync(request.Items, ct);
            Dictionary<int, decimal> productPrices = await _unitOfWork.ProductRepository.GetProductPricesAsync(productIds, ct);

            var orderItems = new List<OrderItem>();
            decimal totalAmount = 0;

            foreach (var item in request.Items)
            {
                int productId = item.Key;
                int quantity = item.Value;
                decimal unitPrice = productPrices.ContainsKey(productId) ? productPrices[productId] : 0;
                
                orderItems.Add(new OrderItem
                {
                    ProductId = productId,
                    Quantity = quantity,
                    UnitPriceAtPurchase = unitPrice
                });

                totalAmount += unitPrice * quantity;
            }

            var newOrder = new Domain.Entities.Order
            {
                CustomerId = request.CustomerId, 
                OrderDate = DateTime.UtcNow,
                TotalAmount = totalAmount,
                Status = "Pending", 
                OrderItems = orderItems, 
                Payment = new Payment 
                {
                    Amount = totalAmount,
                    Provider = "COD", 
                    PaymentStatus = "Unpaid", 
                    PhoneNumber = request.PhoneNumber,
                    Address = request.Address
                }
            };

            await _unitOfWork.OrderRepository.AddAsync(newOrder);
            await _unitOfWork.CartRepository.DeleteCartItemsAsync(request.CustomerId, productIds, ct);
            await _unitOfWork.SaveChangesAsync(ct);

            return Result.Success();
        }
    }
}
