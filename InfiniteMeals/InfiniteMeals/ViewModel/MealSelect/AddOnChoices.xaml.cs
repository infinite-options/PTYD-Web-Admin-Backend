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
    public partial class AddOnChoices : ContentPage
    {
        public IList<Meal> AddOn { get; private set; }
        public IList<Meal> MoreMeals { get; private set; }

        public AddOnChoices()
        {
            InitializeComponent();
            getData();
        }

        public async void getData()
        {
            AddOn = new List<Meal>();
            MoreMeals = new List<Meal>();

            // Normal Meals
            List<String> AddNames = new List<String>();
            List<String> AddDesc = new List<String>();
            List<String> AddPrice = new List<String>();
            List<String> AddImage = new List<String>();

            List<String> AddMealName = new List<String>();
            List<String> AddMealDesc = new List<String>();
            List<String> AddMealPrice = new List<String>();
            List<String> AddMealImage = new List<String>();

            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);


            for (int placeHolder = 0; placeHolder < obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu.Length; placeHolder++)
            {
                AddNames.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealName);
                AddDesc.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealDesc);
                AddPrice.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].ExtraMealPrice);
                AddImage.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealPhotoUrl.ToString());

                AddOn.Add(new Meal
                {
                    name = AddNames[placeHolder],
                    price = "Add On Cost: $" + AddPrice[placeHolder],
                    description = AddDesc[placeHolder],
                    imageUrl = AddImage[placeHolder],
                    infoUrl = "https://lh3.googleusercontent.com/proxy/Qx2SUkXKZlrr5vwfQtmFspzAWcZIWsPzJk40_-rI917XZv3KT5Ci6jnNf3PXli9jf9Fi6f5NUzCz4ynJBJqGBBHSY5JchT7gJfQeLgRTFldp8BFY9I7osH368zSmLkIaXg",
                });
            }

            for (int j = 0; j < obj.Result.MenuForWeek1.Addons.Weekly.Menu.Length; j++)
            {
                AddMealName.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealName);
                AddMealDesc.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealDesc);
                AddMealPrice.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].ExtraMealPrice);
                //AddMealImage.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[placeHolder].MealPhotoUrl.ToString());

                MoreMeals.Add(new Meal
                {
                    name = AddMealName[j],
                    price = "Add On Cost: $" + AddMealPrice[j],
                    description = AddMealDesc[j],
                    //imageUrl = AddImage[placeHolder],
                    infoUrl = "https://lh3.googleusercontent.com/proxy/Qx2SUkXKZlrr5vwfQtmFspzAWcZIWsPzJk40_-rI917XZv3KT5Ci6jnNf3PXli9jf9Fi6f5NUzCz4ynJBJqGBBHSY5JchT7gJfQeLgRTFldp8BFY9I7osH368zSmLkIaXg",
                });
            }

            BindingContext = this;

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

        void OnInfoClicked(object sender, EventArgs e)
        {
        }
    }
}
