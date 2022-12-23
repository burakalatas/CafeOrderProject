namespace DbmsHw.Models
{
    public class bevListPriceChanges
    {
        public int BeverageId { get; set; }
        public float NewBeveragePrice { get; set; }
        public float OldBeveragePrice { get; set; }
        public DateTime UpdateDate { get; set; }
    }
}
