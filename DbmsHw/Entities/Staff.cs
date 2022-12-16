using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Staff
{
    public int Staffid { get; set; }

    public string Stafftype { get; set; } = null!;

    public string? Staffname { get; set; }

    public string? Staffphoneno { get; set; }

    public virtual Cashier? Cashier { get; set; }

    public virtual Courier? Courier { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();

    public virtual Waiter? Waiter { get; set; }
}
