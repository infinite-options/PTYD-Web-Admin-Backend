using System;
using System.Linq;
using System.Text;


using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Model.Subscribe;

using System.Net.Http;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Net;
using InfiniteMeals.Model.Login;
using InfiniteMeals.Model.User;
using Stripe;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Summary : ContentPage {
        string password = "";
        const string checkoutURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/checkout"; // api to post to checkout database
        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end
        public HttpClient client = new HttpClient();


        public Summary() {

            InitializeComponent();


        }


        private async void ConfirmClicked(object sender, EventArgs e) {

            password = await DisplayPromptAsync("Password", "Please enter your password");

            if(await checkout() == HttpStatusCode.BadRequest) {
                await DisplayAlert("Error", "Purchase was not able to be completed", "OK");
            } else {
                await Navigation.PopToRootAsync();
                await DisplayAlert("Payment Confirmed", "Go to menu to select your meals!", "OK"); // display a confirmation
            }


        }
        
        // performs the checkout and sends to local database and stripe
        // returns HttpStatusCode.OK if successful and HttpStatusCode.BadRequest if unsuccessful
        private async Task<HttpStatusCode> checkout() { // completes the checkout and sends the information as a json to the database
            OrderInformation orderInformation = (OrderInformation)this.BindingContext; // contains all the info about the order 

            try {
                


                var content = await client.GetStringAsync(accountSaltURL + App.Database.GetLastItem().Email); // get the requested account salt
                var obj = JsonConvert.DeserializeObject<AccountSalt>(content); // convert account salt into an object; obj[0] has the account salt



                SHA512 sHA512 = new SHA512Managed();
                byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(password + obj.result[0].passwordSalt.ToString())); // take the password and account salt to generate hash
                string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex


                var orderContent = new CheckoutOrder { // contains json information to send to checkout database
                    
                    ccNum = orderInformation.paymentInformation.cardNumber,
                    ccCVV = orderInformation.paymentInformation.cvv,
                    billingZip = orderInformation.shippingInformation.zipCode, // using zipcode for delivery
                    deliveryFirstName = orderInformation.shippingInformation.firstName,
                    deliveryLastName = orderInformation.shippingInformation.lastName,
                    deliveryEmail = App.Database.GetLastItem().Email,
                    deliveryPhone = orderInformation.shippingInformation.phoneNumber,
                    deliveryAddress = orderInformation.shippingInformation.addressOne,
                    deliveryAddressUnit = "",
                    deliveryCity = orderInformation.shippingInformation.city,
                    deliveryState = orderInformation.shippingInformation.state,
                    deliveryZip = orderInformation.shippingInformation.zipCode,
                    deliveryRegion = "US",
                    deliveryInstructions = orderInformation.paymentInformation.deliveryInstructions,
                    ccExpMonth = orderInformation.paymentInformation.expirationMonth,
                    ccExpYear = orderInformation.paymentInformation.expirationYear,
                    salt = hashedPassword,
                    isGift = "false",
                    userUId = App.Database.GetLastItem().UserUid,
                    item = MealPlanExtension.mealPlanToString(orderInformation.shippingInformation.subscriptionPlan.mealPlan) + " - " + // meal plan
                           PaymentOptionExtension.paymentOptionToString(orderInformation.shippingInformation.subscriptionPlan.paymentOption) + " - " + // payment option
                           orderInformation.shippingInformation.subscriptionPlan.cost.ToString(), // cost
                    totalCharge = orderInformation.shippingInformation.subscriptionPlan.cost,
                    totalDiscount = 0.00,
                    couponId = "" 

        
           


                };

                

                string orderContentJson = JsonConvert.SerializeObject(orderContent); // make orderContent into json

                var httpContent = new StringContent(orderContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database

                var response = await client.PostAsync(checkoutURL, httpContent); // try to post to database

                return response.StatusCode;
            }
            catch (Exception ex) {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }

            return HttpStatusCode.BadRequest;
        }
       


    }
}