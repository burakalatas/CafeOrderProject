namespace DbmsHw.Models
{
    public class OrderInfo
    {
        public int OrderId { get; set; }
        public string? OrderAddress { get; set; }
        public int? StaffId { get; set; }
        public float? TotalPrice { get; set; }
        public int TableId { get; set; }
        public string StaffName { get; set; }
    }
}
