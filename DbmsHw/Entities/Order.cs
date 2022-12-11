﻿using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Order
{
    public int Orderid { get; set; }

    public string? Orderaddress { get; set; }

    public float? Totalprice { get; set; }

    public int? Staffid { get; set; }

    public virtual ICollection<Checkout> Checkouts { get; } = new List<Checkout>();

    public virtual ICollection<Kitchen> Kitchens { get; } = new List<Kitchen>();

    public virtual Staff? Staff { get; set; }

    public virtual ICollection<Table> Tables { get; } = new List<Table>();

    public virtual ICollection<Beverage> Beverages { get; } = new List<Beverage>();

    public virtual ICollection<Food> Foods { get; } = new List<Food>();
}