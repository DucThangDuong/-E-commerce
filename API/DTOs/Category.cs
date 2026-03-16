using System.ComponentModel.DataAnnotations;

namespace API.DTOs
{
    public class ReqCreateCategoryDto
    {
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Picture { get; set; } = string.Empty;
    }
}
