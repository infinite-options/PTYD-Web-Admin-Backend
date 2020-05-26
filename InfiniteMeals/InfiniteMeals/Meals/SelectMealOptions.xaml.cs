using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using InfiniteMeals.Meals.Model;
using Newtonsoft.Json.Linq;
using Xamarin.Forms;



namespace InfiniteMeals.Meals
{

    public partial class SelectMealOptions : ContentPage
    {
        private int mealOrdersCount = 0;

        public ObservableCollection<MealsModel> Meals = new ObservableCollection<MealsModel>();

        private string kitchenID;
        private string kitchenZipcode;

        protected async Task GetMeals(string kitchen_id)
        {
            //Console.WriteLine("kitchen_name: " + kitchen_name);
            NoMealsLabel.IsVisible = false;
            var request = new HttpRequestMessage();
            request.RequestUri = new Uri("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v1/meals/" + kitchen_id);
            request.Method = HttpMethod.Get;
            var client = new HttpClient();
            HttpResponseMessage response = await client.SendAsync(request);
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                HttpContent content = response.Content;
                var mealsString = await content.ReadAsStringAsync();
                JObject meals = JObject.Parse(mealsString);
                String todaysDate = DateTime.Now.ToString("MM/dd/yyyy");

                if (todaysDate[0] == '0')
                {
                    todaysDate = todaysDate.Substring(1);
                }
                todaysDate = todaysDate.Replace("/0", "/");

                this.Meals.Clear();

                //Console.WriteLine("meals['result']: " + meals["result"]);
                //Console.WriteLine("meals: " + meals);

                NoMealsLabel.IsVisible = true;
                foreach (var m in meals["result"])
                {
                    //Console.WriteLine("created: " + m["created_at"]["S"]);
                    //Console.WriteLine("today: " + todaysDate);
                    if (m["created_at"]["S"].ToString().Contains(todaysDate) || (Boolean)m["auto_renew"]["BOOL"])
                    {
                        NoMealsLabel.IsVisible = false;
                        this.Meals.Add(new MealsModel()
                        {
                            imageString = m["photo"]["S"].ToString(),
                            title = m["meal_name"]["S"].ToString(),
                            price = m["price"]["S"].ToString(),
                            description = m["description"]["S"].ToString(),
                            kitchen_id = m["kitchen_id"]["S"].ToString(),
                            id = m["meal_id"]["S"].ToString(),
                            qty = 0
                        }
                        );
                    }
                }

                mealsListView.ItemsSource = Meals;
            }

        }

        public SelectMealOptions(string kitchen_id, string kitchen_name, string zipcode)
        {
            InitializeComponent();

            SetBinding(TitleProperty, new Binding(kitchen_name));

            kitchenID = kitchen_id;
            kitchenZipcode = zipcode;

            GetMeals(kitchenID);

            mealsListView.RefreshCommand = new Command(() =>
            {
                GetMeals(kitchenID);
                mealsListView.IsRefreshing = false;
            });
        }

        async void Handle_Clicked(object sender, System.EventArgs e)
        {
            if (mealOrdersCount == 0)
            {
                await DisplayAlert("Order Error", "Please make an order to continue", "Continue");
            }
            else
            {
                var secondPage = new Checkout.CheckOutPage(Meals, kitchenID, kitchenZipcode);
                await Navigation.PushAsync(secondPage);
            }

            //var checkoutPage = new CheckOutPage();
            //await Navigation.PushAsync(checkoutPage);
        }

        private void reduceOrders(object sender, System.EventArgs e)
        {
            var button = (Button)sender;
            var mealObject = (MealsModel)button.CommandParameter;

            if (mealObject != null)
            {
                if (mealObject.qty > 0)
                {
                    mealObject.qty -= 1;
                    mealOrdersCount -= 1;
                }
            }
        }

        private void addOrders(object sender, System.EventArgs e)
        {
        
            var button = (Button)sender;
            var mealObject = (MealsModel)button.CommandParameter;

            if (mealObject != null)
            {
                if (mealObject.qty < 50)
                {
                    mealObject.qty += 1;
                    mealOrdersCount += 1;
                }
            }
        }

        //public string createUrl()
        //{
        //    DateTime dateTime = DateTime.UtcNow.Date;
        //    var today = dateTime.ToString("yyyyMMdd");

        //    string url = "https://s3-us-west-2.amazonaws.com/ordermealapp/" + today;
        //    return url;
        //}
    }

}
