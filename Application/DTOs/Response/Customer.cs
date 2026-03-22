using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs.Response
{

    public class ResCustomerPrivateDto
    {
        public int id { get; set; }
        public string name { get; set; } = null!;
        public string? avatarUrl { get; set; }
        public string? email { get; set; }
        public string? address { get; set; }
        public string? phoneNumber { get; set; }
    }
}
