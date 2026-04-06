using Application.DTOs.Services;
using System;

namespace Application.IServices
{

    public interface IVnPayService
    {
        string CreatePaymentUrl(int orderId, decimal amount, string ipAddress);
        ResVnPayDTO PaymentCallback(Microsoft.AspNetCore.Http.IQueryCollection collections);
    }
}
