using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Table
{
    public int Tableid { get; set; }

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
