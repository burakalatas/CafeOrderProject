﻿using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Beverage
{
    public int Beverageid { get; set; }

    public string? Beveragename { get; set; }

    public float? Beverageprice { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
