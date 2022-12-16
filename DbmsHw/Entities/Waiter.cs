using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Waiter
{
    public int Staffid { get; set; }

    public virtual Staff Staff { get; set; } = null!;
}
