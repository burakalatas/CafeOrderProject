using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Cashier
{
    public int Staffid { get; set; }

    public virtual ICollection<Checkout> Checkouts { get; } = new List<Checkout>();

    public virtual Staff Staff { get; set; } = null!;
}
