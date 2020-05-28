using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

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
                Name = "Weekly Specials"
            });

            Categories.Add(new Categories
            {
                Name = "Seasonal Favorites"
            });

            Categories.Add(new Categories
            {
                Name = "Smoothies"
            });

            //BindingContext = this;
       

            Meals = new List<Meal>();
            Meals.Add(new Meal
            {
                Name = "Savory Sweet Mashers w/ Collards & Swiss Chard",
                Description = "Cal 456, Prot 15 , Carb 77, Sug 10, Fat 20, Sat 10",
                ImageUrl = "mashers.jpg",
                InfoUrl ="info.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Credo Nachos",
                Description = "Cal 360, Prot 5, Carb 47, Sug 4, Fat 16, Sat 4.5",
                ImageUrl = "nacho.jpg",
                InfoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Curcuma Golden Oats",
                Description = "Cal 409, Prot 5 , Carb 49, Sug 10, Fat 17, Sat 8",
                ImageUrl = "oats.jpg",
                InfoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Borscht",
                Description = "Cal 376, Prot 5 , Carb 18, Sug 7, Fat 33, Sat 11",
                ImageUrl = "borscht.jpg",
                InfoUrl = "info.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Lasagna",
                Description = "Cal 360, Prot 15 , Carb 47, Sug 4, Fat 16, Sat 4.5",
                ImageUrl = "lasagna.jpeg",
                InfoUrl = "info.jpg"
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
           DisplayAlert("Nutrition Facts", selectedItem.Description.ToString(), "OK");
        }

       /*
        * void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
       {
           Meal tappedItem = e.Item as Meal;
       }*/

    }

}