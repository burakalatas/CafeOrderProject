using DbmsHw.Models;

namespace DbmsHw.ViewModels
{
    public class OrderDetailsInfo
    {
        public List<FoodDetails> foodDetails { get; set; }
        public List<BeverageDetails> beverageDetails { get; set; }

    }
}
