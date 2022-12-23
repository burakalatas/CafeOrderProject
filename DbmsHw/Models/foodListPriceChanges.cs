namespace DbmsHw.Models
{
    public class foodListPriceChanges
    {
        public int FoodId { get; set; }
        public float NewFoodPrice { get; set; }
        public float OldFoodPrice { get; set; }
        public DateTime UpdateDate { get; set; }
    }
}
