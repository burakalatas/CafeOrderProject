using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Beveragelist
{
    public int Beverageid { get; set; }

    public string Beveragename { get; set; } = null!;

    public float Beverageprice { get; set; }
}
