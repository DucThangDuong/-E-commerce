using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class FeatureGroup
{
    public int FeatureGroupId { get; set; }

    public string GroupName { get; set; } = null!;

    public int? DisplayOrder { get; set; }

    public virtual ICollection<Feature> Features { get; set; } = new List<Feature>();
}
