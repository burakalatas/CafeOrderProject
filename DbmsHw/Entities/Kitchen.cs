using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Kitchen
{
    public int Sectionid { get; set; }

    public int? Orderid { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Section Section { get; set; } = null!;
}
