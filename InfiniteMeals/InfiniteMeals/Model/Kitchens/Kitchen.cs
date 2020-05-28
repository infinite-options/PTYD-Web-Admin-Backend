using System;
namespace InfiniteMeals.Kitchens.Model
{
    public class Kitchen
    {
        public string kitchenId { get; set; }
        public string title { get; set; }
 
        public string description { get; set; }
 
        public string openHours { get; set; }
        public string zipcode { get; set; }

        public string deliveryPeriod { get; set; }
        public bool isOpen { get; set; }
        public string status { get; set; }
        public string statusColor { get; set; }
        public string opacity { get; set; }
    }
}
