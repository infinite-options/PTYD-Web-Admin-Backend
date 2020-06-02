using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Meals.Model;
using System.Net.Http;
using InfiniteMeals.Model.Database;
using Newtonsoft.Json;

namespace InfiniteMeals.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {
        public IList<Meal> Meals { get; private set; }
        public IList<Meal> SeasonalMeals { get; private set; }
        public IList<Meal> Smoothies { get; private set; }

        public MealChoices()
        {
            InitializeComponent();
            getData();
        }

        public async void getData()
        {
            Meals = new List<Meal>();
            SeasonalMeals = new List<Meal>();
            Smoothies = new List<Meal>();

            // Normal Meals
            List<String> MenuForWeek1Names = new List<String>();
            List<String> MenuForWeek1Desc = new List<String>();
            List<String> MenuForWeek1Image = new List<String>();

            //Nutrition Facts Normal Meals
            List<double?> MenuForWeek1Fat = new List<double?>();
            List<double?> MenuForWeek1Sugar = new List<double?>();
            List<double?> MenuForWeek1Prot = new List<double?>();

            // Seasonal Meals
            List<String> SeasMenuForWeek1Names = new List<String>();
            List<String> SeasMenuForWeek1Desc = new List<String>();
            List<String> SeasMenuForWeek1Image = new List<String>();

            // Smoothies
            List<String> SmoothiesNames = new List<String>();
            List<String> SmoothiesDesc = new List<String>();
            List<String> SmoothiesImage = new List<String>();


            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);


            for(int placeHolder = 0; placeHolder < obj.Result.MenuForWeek1.Meals.Weekly.Menu.Length; placeHolder++)
            {
                MenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealName);
                MenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealDesc);
                MenuForWeek1Prot.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);
                MenuForWeek1Sugar.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealSugar);
                MenuForWeek1Fat.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);
                MenuForWeek1Image.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl.ToString());

                Meals.Add(new Meal
                {
                    name = MenuForWeek1Names[placeHolder],
                    description = MenuForWeek1Desc[placeHolder],
                    imageUrl= MenuForWeek1Image[placeHolder],
                    infoUrl = "https://lh3.googleusercontent.com/proxy/Qx2SUkXKZlrr5vwfQtmFspzAWcZIWsPzJk40_-rI917XZv3KT5Ci6jnNf3PXli9jf9Fi6f5NUzCz4ynJBJqGBBHSY5JchT7gJfQeLgRTFldp8BFY9I7osH368zSmLkIaXg",
                }) ;
            }

            for (int placeHolderSeas = 0; placeHolderSeas < obj.Result.MenuForWeek1.Meals.Seasonal.Menu.Length; placeHolderSeas++)
            {
                SeasMenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealName);
                SeasMenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealDesc);
                //SeasMenuForWeek1Image.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString());
                SeasonalMeals.Add(new Meal
                {
                    name = SeasMenuForWeek1Names[placeHolderSeas],
                    description = SeasMenuForWeek1Desc[placeHolderSeas],
                    //imageUrl = SeasMenuForWeek1Image[placeHolderSeas],
                    infoUrl = "https://lh3.googleusercontent.com/proxy/Qx2SUkXKZlrr5vwfQtmFspzAWcZIWsPzJk40_-rI917XZv3KT5Ci6jnNf3PXli9jf9Fi6f5NUzCz4ynJBJqGBBHSY5JchT7gJfQeLgRTFldp8BFY9I7osH368zSmLkIaXg",
                });
            }

            for (int smooth = 0; smooth < obj.Result.MenuForWeek1.Meals.Seasonal.Menu.Length; smooth++)
            {
                SmoothiesNames.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealName);
                SmoothiesDesc.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealDesc);
                //SmoothiesImage.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl.ToString());
                Smoothies.Add(new Meal
                {
                    name = SmoothiesNames[smooth],
                    description = SmoothiesDesc[smooth],
                    //imageUrl = SmoothiesImage[smooth],
                    infoUrl = "info.jpg",
                });
            }

            BindingContext = this;

        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }

        private async void ClickedSelect(object sender, EventArgs e)
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
           DisplayAlert("Ingredients", selectedItem.description.ToString(), "OK");
        }

         void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
       {
           Meal tappedItem = e.Item as Meal;
       }

    }

}
 