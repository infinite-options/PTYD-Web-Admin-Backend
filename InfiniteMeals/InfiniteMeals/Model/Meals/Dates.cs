using System;
using System.ComponentModel;

namespace InfiniteMeals.Meals.Model
{
    public class Dates: INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public string sundayDate { get; set; }
        public string mondayDate { get; set; }
    }
}
