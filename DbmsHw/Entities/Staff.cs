using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Staff
{
    public int Staffid { get; set; }

    public string Stafftype { get; set; } = null!;

    public virtual Cashier? Cashier { get; set; }

    public virtual Courier? Courier { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();

    public virtual ICollection<Restaurant> Restaurants { get; } = new List<Restaurant>();

    public virtual Waiter? Waiter { get; set; }
}
