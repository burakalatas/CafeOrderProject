using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Foodlistpricechange
{
    public int Foodlistrecordno { get; set; }

    public short Foodid { get; set; }

    public float Oldfoodprice { get; set; }

    public float Newfoodprice { get; set; }

    public DateTime Updatedate { get; set; }
}
