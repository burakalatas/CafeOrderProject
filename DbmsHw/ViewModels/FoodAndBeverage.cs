using DbmsHw.Entities;

namespace DbmsHw.ViewModels
{
    public class FoodAndBeverage
    {
        public List<Foodlist>? Foodlists { get; set; }
        public List<Beveragelist>? Beveragelist { get; set; }
        public List<Staff>? staffLists { get; set; }
        public List<Table> tables { get; set; }
    }
}
