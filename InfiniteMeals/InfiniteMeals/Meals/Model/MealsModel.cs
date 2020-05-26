using System;
using System.ComponentModel;

namespace InfiniteMeals.Meals.Model
{
    public class MealsModel: INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public string imageString { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string price { get; set; }
        public string id { get; set; }
        public string kitchen_id { get; set; }
        public string kitchen_name { get; set; }
        public int order_qty { get; set; }

        //public int meal_qty;
        public int qty {
            get { return order_qty; }
            set
            {
                order_qty = value;
                PropertyChanged(this, new PropertyChangedEventArgs("order_qty"));
            }
        }
    }
}
