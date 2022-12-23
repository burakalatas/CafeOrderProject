using System;
using System.Collections.Generic;

namespace DbmsHw.Entities;

public partial class DeletedOrder
{
    public int DeletedOrdersId { get; set; }

    public int OrderId { get; set; }

    public int StaffId { get; set; }

    public int TableId { get; set; }

    public string? OrderAddress { get; set; }

    public DateTime DeletedDate { get; set; }
}
