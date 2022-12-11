using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Courier
{
    public int Staffid { get; set; }

    public string? Couriername { get; set; }

    public string? Courierphoneno { get; set; }

    public virtual Staff Staff { get; set; } = null!;
}
