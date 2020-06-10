using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using System.Threading.Tasks;
using Xamarin.Forms;
using Newtonsoft.Json;
using InfiniteMeals.Meals.Model;
using System.Collections.ObjectModel;
using Newtonsoft.Json.Linq;

namespace InfiniteMeals.ViewModel.Checkout
{
 /*   public class OrderInfo
    {
        public string orderId = "";
        public string email = ""; 
        public string name = "";
        public string phone = "";
        public string street = "";
        public string city = "";
        public string state = "";
        public string zipCode = "";
        public string totalAmount = "";
        public bool paid = false;
        public string paymentType = "cash";
        //public string deliveryTime = "5:00 PM";
        //public string mealOption1 = "1";
        //public string mealOption2 = "1";
        public string kitchenId = "";
        public List<Dictionary<string, string>> orderedItems = new List<Dictionary<string, string>>() ;
    }

    public partial class CheckOutPage : ContentPage
    {
        OrderInfo currentOrder = new OrderInfo();

        ObservableCollection<Meal> mealsOrdered = new ObservableCollection<Meal>();

        double totalCostsForMeals = 0;

        double calculatedTaxAmount = 0;

        string kitchenZipcode;

        //var firstNameField = new Entry() { Placeholder="First name", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };
        //var lastNameField = new Entry() { Placeholder = "Last name", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };
        public Entry fullNameField = new Entry() { Placeholder = "Full name", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };
        public Entry emailField = new Entry() { Placeholder = "Email", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };
        public Entry phoneField = new Entry() { Placeholder = "Phone", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45, Keyboard = Keyboard.Numeric };


        public Entry streetAddressField = new Entry() { Placeholder = "Street Address", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };
        public Entry cityField = new Entry() { Placeholder = "City", HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45 };

        public Entry stateField = new Entry() { Placeholder = "State", VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45, MinimumWidthRequest = 100 };
        public Entry zipCodeField = new Entry() { Placeholder = "Zip Code", VerticalOptions = LayoutOptions.Center, HorizontalTextAlignment = TextAlignment.Start, HeightRequest = 45, MinimumWidthRequest = 170, Keyboard = Keyboard.Numeric };



        public CheckOutPage(ObservableCollection<Meal> meals, string kitchen_id, string kitchen_zipcode)
        {
            InitializeComponent();

            kitchenZipcode = kitchen_zipcode;

            mealsOrdered = meals;
            SetupUI();

            Auto_Fill("user_id", fullNameField);
            Auto_Fill("email", emailField);
            Auto_Fill("phone", phoneField);
            Auto_Fill("street", streetAddressField);
            Auto_Fill("city", cityField);
            Auto_Fill("state", stateField);
            Auto_Fill("zip", zipCodeField);

            currentOrder.kitchenId = kitchen_id;

            foreach (var meal in mealsOrdered)
            {
                currentOrder.orderedItems.Add(new Dictionary<string, string>()
                {
                    { "meal_id", meal.id },
                    { "qty", meal.order_qty.ToString() },
                    { "name", meal.name },
                    { "price", meal.price }
                });
            }

        }

        void SetupUI()
        {

            var mainStackLayout = new StackLayout() { Orientation = StackOrientation.Vertical };

            var grid = new Grid();
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Auto) });
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Auto) });
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Auto) });
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Auto) });
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Auto) });

            var grid1 = new StackLayout() { Orientation = StackOrientation.Vertical, MinimumHeightRequest = 150, Margin = 10 };
            var grid2 = new StackLayout() { Orientation = StackOrientation.Vertical, MinimumHeightRequest = 150, Margin = 10 };
            var grid3 = new StackLayout() { Orientation = StackOrientation.Vertical, MinimumHeightRequest = 150, Margin = 10 };
            var grid4 = new StackLayout() { Orientation = StackOrientation.Vertical, MinimumHeightRequest = 50, Margin = 10 };
            var grid5 = new StackLayout() { Orientation = StackOrientation.Horizontal, Margin = 10 };


            var addressFieldStackLayout = new StackLayout() { Orientation = StackOrientation.Horizontal, MinimumHeightRequest = 45, HorizontalOptions = LayoutOptions.FillAndExpand };

            var orderTitleLabel = new Label() { Margin = 10, Text = "Your Order:" };


            var orderNamesStackLayout = new StackLayout() { Orientation = StackOrientation.Vertical, HorizontalOptions = LayoutOptions.StartAndExpand, Margin = 10 };
            var orderPriceAndQtyLayout = new StackLayout() { Orientation = StackOrientation.Vertical, HorizontalOptions = LayoutOptions.EndAndExpand};

            foreach (var meal in mealsOrdered)
            {
                // calculate total cost for the order
                totalCostsForMeals += (double.Parse(meal.price) * meal.order_qty);

                // create label for the UI
                if (meal.order_qty >= 1)
                {
                    var mealNameLabel = new Label() { Text = meal.name, FontSize = 12 };
                    var mealPriceAndQty = new Label() { Text = meal.order_qty.ToString() + "  x  " + "$ " + meal.price, FontSize = 12 };
                    orderNamesStackLayout.Children.Add(mealNameLabel);
                    orderPriceAndQtyLayout.Children.Add(mealPriceAndQty);
                }
            }

            // calculate tax amount
            calculatedTaxAmount = Math.Round((totalCostsForMeals * 0.09), 2);

            String currencyTax = FormatCurrency(calculatedTaxAmount.ToString());

            var taxLabel = new Label() { Text = "Tax", FontSize = 12 };
            var taxAmount = new Label() { Text = "$ " + currencyTax, FontSize = 12, HorizontalTextAlignment = TextAlignment.End };

            var totalAmountTextLabel = new Label() { Text = "Total Amount", FontSize = 14, FontAttributes = FontAttributes.Bold };
            var totalAmountLabel = new Label() { Text = "$ " + FormatCurrency((calculatedTaxAmount + totalCostsForMeals).ToString()), FontSize = 14, FontAttributes = FontAttributes.Bold, HorizontalTextAlignment = TextAlignment.End };

            // store total amount of the order
            currentOrder.totalAmount = (calculatedTaxAmount + totalCostsForMeals).ToString();

            Guid g;
            // Create and display the value of two GUIDs.
            g = Guid.NewGuid();
            currentOrder.orderId = g.ToString();

            orderNamesStackLayout.Children.Add(taxLabel);
            orderNamesStackLayout.Children.Add(totalAmountTextLabel);

            orderPriceAndQtyLayout.Children.Add(taxAmount);
            orderPriceAndQtyLayout.Children.Add(totalAmountLabel);


            //grid1.Children.Add(firstNameField);
            //grid1.Children.Add(lastNameField);
            grid1.Children.Add(fullNameField);
            grid1.Children.Add(emailField);
            grid1.Children.Add(phoneField);

            addressFieldStackLayout.Children.Add(stateField);
            addressFieldStackLayout.Children.Add(zipCodeField);
            grid2.Children.Add(streetAddressField);
            grid2.Children.Add(cityField);
            grid2.Children.Add(addressFieldStackLayout);


            grid4.Children.Add(orderTitleLabel);

            grid5.Children.Add(orderNamesStackLayout);
            grid5.Children.Add(orderPriceAndQtyLayout);


            grid.Children.Add(grid1);
            grid.Children.Add(grid2);
            grid.Children.Add(grid3);
            grid.Children.Add(grid4);
            grid.Children.Add(grid5);

            Grid.SetRow(grid1, 0);
            Grid.SetRow(grid2, 1);
            Grid.SetRow(grid3, 2);
            Grid.SetRow(grid4, 3);
            Grid.SetRow(grid5, 4);


            var scrollView = new ScrollView()
            {
                Content = grid
            };

            var checkoutButton = new Button() { Text = "Proceed to Payment", HeightRequest = 40, Margin = new Thickness(20, 10, 20, 10), BorderWidth = 0.5, BorderColor = Color.Gray};
            checkoutButton.Clicked += Handle_Clicked();


            mainStackLayout.Children.Add(scrollView);
            mainStackLayout.Children.Add(checkoutButton);

            var copyrightLabel = new Label() { Text = "© Infinite Options v1.2", FontSize = 10, HorizontalOptions = LayoutOptions.Center,  Margin = new Thickness(20, 10, 20, 10) };

            mainStackLayout.Children.Add(copyrightLabel);

            Content = new StackLayout
            {
                Children = { mainStackLayout }
            };
        }

        private EventHandler Handle_Clicked()
        {
            return placeOrder;
        }


        async void placeOrder(object sender, System.EventArgs e)
        {

            Console.WriteLine("fullNameField.Text: " + fullNameField.Text);
            Console.WriteLine("emailField.Text: " + emailField.Text);
            Console.WriteLine("phoneField.Text: " + phoneField.Text);
            Console.WriteLine("streetAddressField.Text: " + streetAddressField.Text);
            Console.WriteLine("cityField.Text: " + cityField.Text);
            Console.WriteLine("stateField.Text: " + stateField.Text);
            Console.WriteLine("zipCodeField.Text: " + zipCodeField.Text);

            if (fullNameField.Text.Length == 0 || emailField.Text.Length == 0 || phoneField.Text.Length == 0 || streetAddressField.Text.Length == 0 || cityField.Text.Length == 0 || stateField.Text.Length == 0 || zipCodeField.Text.Length == 0)
            {
                await DisplayAlert("Error", "Please enter all information within the boxes provided.", "OK");
                return;
            }

            if (fullNameField.Text != null)
            {
                Application.Current.Properties["user_id"] = fullNameField.Text;
                currentOrder.name = fullNameField.Text;
            }

            if (emailField.Text != null)
            {
                Application.Current.Properties["email"] = emailField.Text;
                currentOrder.email = emailField.Text;
            }

            if (phoneField.Text != null)
            {
                Application.Current.Properties["phone"] = phoneField.Text;
                currentOrder.phone = phoneField.Text;
            }

            if (streetAddressField.Text != null)
            {
                Application.Current.Properties["street"] = streetAddressField.Text;
                currentOrder.street = streetAddressField.Text;
            }
            if (cityField.Text != null)
            {
                Application.Current.Properties["city"] = cityField.Text;
                currentOrder.city = cityField.Text;
            }
            if (stateField.Text != null)
            {
                Application.Current.Properties["state"] = stateField.Text;
                currentOrder.state = stateField.Text;
            }
            if (zipCodeField.Text != null)
            {
                if (zipCodeField.Text.Trim() == "95120" || zipCodeField.Text.Trim() == "95135" || zipCodeField.Text.Trim() == "95060" || zipCodeField.Text.Trim() == "90000")
                {
                    Console.WriteLine("customer zipcode: " + zipCodeField.Text.Trim());
                    Console.WriteLine("farmer zipcode: " + kitchenZipcode.Trim());
                    if (zipCodeField.Text.Trim() != parseAreaToZipcode(kitchenZipcode.Trim()))
                    {
                        await DisplayAlert("Sorry for the inconvience!", "Serving Now is only accepting orders from farms within " + formatZipcode(zipCodeField.Text.Trim()) + ".", "OK");
                        return;
                    }
                    Application.Current.Properties["zip"] = zipCodeField.Text;
                    currentOrder.zipCode = zipCodeField.Text;
                }
                else
                {
                    await DisplayAlert("Sorry for the inconvience!", "Serving Now is only accepting orders from the 95060, 95120, and 95135, zip codes.", "OK");
                    return;
                }
            }

            ((Button)sender).IsEnabled = false;

            await Application.Current.SavePropertiesAsync();
            //currentOrder.deliveryTime = deliveryTime.Time.ToString();

            await sendOrderRequest(currentOrder);
            await DisplayAlert("Thank you!", "Your order has been placed." + System.Environment.NewLine + " An email receipt has been sent to " + currentOrder.email + ". Please complete the payment process by clicking the button below.", "Continue to PayPal");
            Device.OpenUri(new System.Uri("https://servingnow.me/payment/" + currentOrder.orderId + "/" + currentOrder.totalAmount));

            await Navigation.PopModalAsync();
            // "(Copyright Symbol) 2019 Infinite Options   v1.2"
        }
            

        void Auto_Fill(string key, Entry location)
        {
            if (Application.Current.Properties.ContainsKey(key) && Application.Current.Properties[key] != null)
            {
                location.Text = Application.Current.Properties[key].ToString();
            }
        }

        async Task sendOrderRequest(OrderInfo currentOrder)
        {

            var currentOrderJSONString = JsonConvert.SerializeObject(currentOrder);
            //JObject currentOrderJSON = JObject.Parse(currentOrderJSONString);
            //System.Console.WriteLine(currentOrderJSON.GetType());
            var content = new StringContent(currentOrderJSONString, Encoding.UTF8, "application/json");

            //System.Console.WriteLine(JsonConvert.SerializeObject(content));
            var request = new HttpRequestMessage();
            request.RequestUri = new Uri("https://phaqvwjbw6.execute-api.us-west-1.amazonaws.com/dev/api/v1/orders");
            request.Method = HttpMethod.Post;
            request.Content = content;
            var client = new HttpClient();
            HttpResponseMessage response = await client.SendAsync(request);
            //System.Console.WriteLine(response);
            //HttpResponseMessage response = null;

            //string uri = "https://o5yv1ecpk1.execute-api.us-west-2.amazonaws.com/dev/api/v1/meal/order";
            //response = await client.PostAsync(uri, content);
            //var result = await response.Content.ReadAsStringAsync();
        }

        private String FormatCurrency(String number)
        {
            if (!number.Contains("."))
            {
                return number + ".00";
            }
            if (number[number.Length - 2] == '.')
            {
                return number + "0";
            }
            return number;
        }

        private string formatZipcode(string zipcode)
        {
            if (zipcode == "95120")
            {
                return "Almaden";
            }
            if (zipcode == "95135")
            {
                return "Evergreen";
            }
            if (zipcode == "95060")
            {
                return "Santa Cruz";
            }
            return "Other";
        }

        private string parseAreaToZipcode(string zipcode)
        {
            if (zipcode == "Almaden")
            {
                return "95120";
            }
            if (zipcode == "Evergreen")
            {
                return "95135";
            }
            if (zipcode == "Santa Cruz")
            {
                return "95060";
            }
            if (zipcode == "Other")
            {
                return "90000";
            }
            return "";
        }
    }
 */
}
