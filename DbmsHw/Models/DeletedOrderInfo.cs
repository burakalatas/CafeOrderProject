namespace DbmsHw.Models
{
    public class DeletedOrderInfo
    {
        public int OrderId { get; set; }
        public int TableId { get; set; }
        public int StaffId { get; set; }
        public string? OrderAddress { get; set; }
        public DateTime OrderDeletedTime { get; set; }
    }
}
