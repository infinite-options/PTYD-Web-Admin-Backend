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

        public MealChoices()
        {
            InitializeComponent();
            Meals = new List<Meal>();
            Meals.Add(new Meal
            {
                Name = "Savory Sweet Mashers w/ Collards & Swiss Chard",
                Description = "Cal 456, Prot 15 , Carb 77, Sug 10, Fat 20, Sat 10",
                ImageUrl = "mashers.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Credo Nachos",
                Description = "Cal 360, Prot 5, Carb 47, Sug 4, Fat 16, Sat 4.5",
                ImageUrl = "nacho.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Curcuma Golden Oats",
                Description = "Cal 409, Prot 5 , Carb 49, Sug 10, Fat 17, Sat 8",
                ImageUrl = "oats.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Borscht",
                Description = "Cal 376, Prot 5 , Carb 18, Sug 7, Fat 33, Sat 11",
                ImageUrl = "borscht.jpg"
            });

            Meals.Add(new Meal
            {
                Name = "Lasagna",
                Description = "Cal 360, Prot 15 , Carb 47, Sug 4, Fat 16, Sat 4.5",
                ImageUrl = "lasagna.jpeg"
            });

            BindingContext = this;
        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }

        void OnListViewItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            Meal selectedItem = e.SelectedItem as Meal;
        }

        void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
        {
            Meal tappedItem = e.Item as Meal;
        }
    }

}