using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Checkout
{
    public int Sectionid { get; set; }

    public int? Cashierid { get; set; }

    public int? Orderid { get; set; }

    public virtual Cashier? Cashier { get; set; }

    public virtual Order? Order { get; set; }
}
