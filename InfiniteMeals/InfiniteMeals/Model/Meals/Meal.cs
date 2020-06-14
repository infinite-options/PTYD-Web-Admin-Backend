using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace InfiniteMeals.Meals.Model
{
    public class MealGroup : ObservableCollection<Meal>
    {
        public string LongName { get; set; }
        public string ShortName { get; set; }
    }


    public class Meal : INotifyPropertyChanged
    {
        int qty1;
        double _totalCost;
        public event PropertyChangedEventHandler PropertyChanged;

        public enum Category { Meals, SeasonalMeals, Smoothies };
        public string imageUrl { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public double price { get; set; }
        public string id { get; set; }
        public string kitchenId { get; set; }
        public string kitchenName { get; set; }
        public int order_qty { get; set; }
        public string infoUrl { get; set; }
        public Category category { get; set; }
        public int meal_qty;
        //public int  qty { get; set; }
        //public int qty;

        public double total
        {
            set
            {
                if (_totalCost != value)
                {
                    _totalCost = value;
                    OnPropertyChanged("total");
                }
            }
            get
            {
                return _totalCost;
            }

        }
        public int qty
        {
            set
            {
                if (qty1 != value)
                {
                    qty1 = (int) value;
                    OnPropertyChanged("qty");
                }
            }
            get
            {
                return qty1;
            }
        }

        

        protected void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        public override string ToString() {
            return this.name;
        }

    }
}
