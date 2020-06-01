using System;
using System.ComponentModel;

namespace InfiniteMeals.Meals.Model
{
    public class Meal: INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public string imageUrl { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string price { get; set; }
        public string id { get; set; }
        public string kitchenId { get; set; }
        public string kitchenName { get; set; }
        public int order_qty { get; set; }
        public string infoUrl { get; set; }


        //public int meal_qty;
        public int qty {
            get { return order_qty; }
            set
            {
                order_qty = value;
                PropertyChanged(this, new PropertyChangedEventArgs("order_qty"));
            }
        }

        public override string ToString() {
            return this.name;
        }
    }
}
