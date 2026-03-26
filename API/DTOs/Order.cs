namespace API.DTOs
{
    public class ReqAddNewOrder
    {
        public List<ProductOrder> Items { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
    }
    public class ProductOrder
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
