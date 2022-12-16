using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Beverage
{
    public int Beverageid { get; set; }

    public string Beveragename { get; set; } = null!;

    public float Beverageprice { get; set; }

    public int Orderid { get; set; }

    public virtual Order Order { get; set; } = null!;
}
