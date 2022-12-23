using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Beveragelistpricechange
{
    public int Beveragelistrecordno { get; set; }

    public short Beverageid { get; set; }

    public float Oldbeverageprice { get; set; }

    public float Newbeverageprice { get; set; }

    public DateTime Updatedate { get; set; }
}
