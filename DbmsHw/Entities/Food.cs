using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Food
{
    public int Foodid { get; set; }

    public string? Foodname { get; set; }

    public float? Foodprice { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
