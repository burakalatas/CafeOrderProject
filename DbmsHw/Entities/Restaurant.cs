using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class Restaurant
{
    public int Restaurantid { get; set; }

    public string Restaurantname { get; set; } = null!;

    public string Restaurantaddress { get; set; } = null!;

    public int Sectionid { get; set; }

    public int? Staffid { get; set; }

    public virtual Section Section { get; set; } = null!;

    public virtual Staff? Staff { get; set; }
}
