using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Waiter
{
    public int Staffid { get; set; }

    public string? Waitername { get; set; }

    public string? Waiterphoneno { get; set; }

    public virtual Staff Staff { get; set; } = null!;

    public virtual ICollection<Table> Tables { get; } = new List<Table>();
}
