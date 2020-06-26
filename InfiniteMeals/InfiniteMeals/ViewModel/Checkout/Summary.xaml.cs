using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.Meals;
using Amazon.Runtime.Internal.Util;
using System.IO;
using System.Reflection;
using MySql.Data.MySqlClient;
using System.Net.Http;
using Newtonsoft.Json;
using System.Security.Cryptography;
using Rg.Plugins.Popup.Services;
using System.Net;
using InfiniteMeals.Model.Login;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Summary : ContentPage {
        const string tempEmail = "pmarathay@yahoo.com";
        const string tempPass = "prashant";
        const string checkoutURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/checkout"; // api to post to checkout database
        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end
        const string loginURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/"; // need email + hashed password



        public Summary() {

            InitializeComponent();


        }


        private async void ConfirmClicked(object sender, EventArgs e) {
            
     
        

            checkout();
            // login(tempEmail, tempPass);
            MainPage mainPage = new MainPage();
            NavigationPage.SetHasBackButton(mainPage, false);
            await Navigation.PushAsync(mainPage); // take the user to the home page
            await DisplayAlert("Payment Confirmed", "Go to menu to select your meals!", "OK"); // display a confirmation

        }
        
        // TODO: checkout should return true if success and false if not successful public async bool checkout()
        private async void checkout() { // completes the checkout and sends the information as a json to the database
            OrderInformation orderInformation = (OrderInformation)this.BindingContext; // contains all the info about the order 

            try {
                HttpClient client = new HttpClient();

                System.Diagnostics.Debug.WriteLine(client.GetAsync(accountSaltURL));
                var content = await client.GetStringAsync(accountSaltURL + tempEmail); // get a the requested account salt
                System.Diagnostics.Debug.WriteLine("content");
                System.Diagnostics.Debug.WriteLine(content);
                var obj = JsonConvert.DeserializeObject<AccountSalt>(content); // convert account salt into an object; obj[0] has the account salt

                System.Diagnostics.Debug.WriteLine(obj.result[0].passwordSalt);

                SHA512 sHA512 = new SHA512Managed();
                byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(tempPass + obj.result[0].passwordSalt)); // take the password and account salt to generate hash
                string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex


                var orderContent = new FinalCheckoutOrder { // contains json information to send to checkout database

                    ccNum = orderInformation.paymentInformation.cardNumber,
                    ccCVV = orderInformation.paymentInformation.cvv,
                    billingZip = orderInformation.shippingInformation.zipCode, // using zipcode for delivery
                    deliveryFirstName = orderInformation.shippingInformation.firstName,
                    deliveryLastName = orderInformation.shippingInformation.lastName,
                    deliveryEmail = tempEmail,
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
                    userUId = "100-000019",
                    item = MealPlanExtension.mealPlanToString(orderInformation.shippingInformation.subscriptionPlan.mealPlan) + " - " + // meal plan
                           PaymentOptionExtension.paymentOptionToString(orderInformation.shippingInformation.subscriptionPlan.paymentOption) + " - " + // payment option
                           orderInformation.shippingInformation.subscriptionPlan.cost.ToString(), // cost
                    itemPrice = orderInformation.shippingInformation.subscriptionPlan.cost.ToString()
                };

                
                System.Diagnostics.Debug.WriteLine(orderContent.item);
                string orderContentJson = JsonConvert.SerializeObject(orderContent); // make orderContent into json
                System.Diagnostics.Debug.WriteLine(orderContentJson);
                var httpContent = new StringContent(orderContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database

                System.Diagnostics.Debug.WriteLine(orderContentJson.ToString());
                var response = await client.PostAsync(checkoutURL, httpContent); // try to post to database
                System.Diagnostics.Debug.WriteLine(response);

                if (response.Content != null) { // post was successful
                    var responseContent = await response.Content.ReadAsStringAsync();

                    System.Diagnostics.Debug.WriteLine(responseContent);
                } 
            }
            catch (Exception ex) {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        public async void login(string userEmail, string userPassword) {
            const string deviceBrowserType = "mobile";
            var deviceIpAddress = Dns.GetHostAddresses(Dns.GetHostName()).FirstOrDefault();
            if(deviceIpAddress != null) {
                try {
                    HttpClient client = new HttpClient();
                    System.Diagnostics.Debug.WriteLine("ip: " + deviceIpAddress);
                    LoginPost loginPostContent = new LoginPost() { // object that contains ip address and browser type; will be converted into a json object 
                        ipAddress = deviceIpAddress.ToString(),
                        browserType = deviceBrowserType
                    };

                    string loginPostContentJson = JsonConvert.SerializeObject(loginPostContent); // make orderContent into json
                    System.Diagnostics.Debug.WriteLine(loginPostContentJson);
                    var httpContent = new StringContent(loginPostContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database


                    var content = await client.GetStringAsync(accountSaltURL + tempEmail); // get a the requested account salt
                    System.Diagnostics.Debug.WriteLine("content");
                    System.Diagnostics.Debug.WriteLine(content);
                    var obj = JsonConvert.DeserializeObject<AccountSalt>(content);



                    SHA512 sHA512 = new SHA512Managed();
                    byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(tempPass + obj.result[0].passwordSalt)); // take the password and account salt to generate hash
                    string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex

                    System.Diagnostics.Debug.WriteLine(loginPostContentJson.ToString());


                    
                    var response = await client.PostAsync(loginURL + tempEmail + "/" + hashedPassword, httpContent); // try to post to database
                    System.Diagnostics.Debug.WriteLine("response: " + response);

                    if (response.Content != null) { // post was successful
                        var responseContent = await response.Content.ReadAsStringAsync();

                        System.Diagnostics.Debug.WriteLine("response content: " + responseContent);
                    } 
                } catch(Exception e) {
                    System.Diagnostics.Debug.WriteLine(e.Message);
                } 


            } 
        }

    }
}