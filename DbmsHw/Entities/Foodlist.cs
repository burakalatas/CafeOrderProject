using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Foodlist
{
    public int Foodid { get; set; }

    public string Foodname { get; set; } = null!;

    public float Foodprice { get; set; }
}
