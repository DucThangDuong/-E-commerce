using Application.DTOs.Response;
using Domain.Entities;

namespace Application.Interfaces
{
    public interface ICustomerRepository
    {
        Task AddAsync(string email, string password, string fullname);
        public Task<int> RevokeRefreshTokenAsync(int customerId);
        Task AddAsync(Customer customer);
        Task<Customer?> GetByEmailAsync(string email);
        Task<bool> EmailExistsAsync(string email);
        Task<Customer?> GetUserByRefreshTokenAsync(string refreshToken);
        Task<ResCustomerPrivateDto?> GetCustomerProfileAsync(int customerId, CancellationToken ct = default);
        Task<int> UpdateCustomerProfileAsync(int customerId, string name, string? phoneNumber, string? address, CancellationToken ct = default);
    }
}
