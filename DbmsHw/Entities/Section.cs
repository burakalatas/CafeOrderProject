using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Section
{
    public int Sectionid { get; set; }

    public string Sectiontype { get; set; } = null!;

    public virtual Checkout? Checkout { get; set; }

    public virtual Kitchen? Kitchen { get; set; }

    public virtual ICollection<Restaurant> Restaurants { get; } = new List<Restaurant>();

    public virtual Table? Table { get; set; }
}
