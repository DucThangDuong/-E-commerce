using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Feature
{
    public int FeatureId { get; set; }

    public int FeatureGroupId { get; set; }

    public int ProductId { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public string ImageUrl { get; set; } = null!;

    public int? DisplayOrder { get; set; }

    public virtual FeatureGroup FeatureGroup { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
