using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs.Services
{
    public class ResVnPayDTO
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public string OrderId { get; set; }
        public string TransactionId { get; set; }
    }
}
