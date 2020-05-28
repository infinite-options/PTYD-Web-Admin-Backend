using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Meals.Model;

namespace InfiniteMeals.MealSelect
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {
        public IList<Meal> Meals { get; private set; }
        public IList<Categories> Categories { get; private set; }

        public MealChoices()
        {
            InitializeComponent();
            Categories = new List<Categories>();

            Categories.Add(new Categories
            {
                title = "Weekly Specials"
            });

            Categories.Add(new Categories
            {
                title = "Seasonal Favorites"
            });

            Categories.Add(new Categories
            {
                title = "Smoothies"
            });

            //BindingContext = this;
       

            Meals = new List<Meal>();
            Meals.Add(new Meal
            {
                name = "Savory Sweet Mashers w/ Collards & Swiss Chard",
                description = "Cal 456, Prot 15 , Carb 77, Sug 10, Fat 20, Sat 10",
                imageUrl = "mashers.jpg",
                infoUrl ="info.jpg"
            });

            Meals.Add(new Meal
            {
                name = "Credo Nachos",
                description = "Cal 360, Prot 5, Carb 47, Sug 4, Fat 16, Sat 4.5",
                imageUrl = "nacho.jpg",
                infoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                name = "Curcuma Golden Oats",
                description = "Cal 409, Prot 5 , Carb 49, Sug 10, Fat 17, Sat 8",
                imageUrl = "oats.jpg",
                infoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                name = "Borscht",
                description = "Cal 376, Prot 5 , Carb 18, Sug 7, Fat 33, Sat 11",
                imageUrl = "borscht.jpg",
                infoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                name = "Lasagna",
                description = "Cal 360, Prot 15 , Carb 47, Sug 4, Fat 16, Sat 4.5",
                imageUrl = "lasagna.jpeg",
                infoUrl = "info.jpg"
            });

            BindingContext = this;
        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }


       private void ClickedInfo(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("here " + sender);
            //DisplayAlert("Nutrition Facts", item.Description.ToString() , "OK");
        }

       void OnListViewItemSelected(object sender, SelectedItemChangedEventArgs e)
       {
           Meal selectedItem = e.SelectedItem as Meal;
           DisplayAlert("Nutrition Facts", selectedItem.description.ToString(), "OK");
        }

       /*
        * void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
       {
           Meal tappedItem = e.Item as Meal;
       }*/

    }

}