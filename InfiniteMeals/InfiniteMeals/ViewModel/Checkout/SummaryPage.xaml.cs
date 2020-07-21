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
using InfiniteMeals.Model.User;
using System.Threading.Tasks;
using InfiniteMeals.Model.Database;
using InfiniteMeals.Model.Coupon;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SummaryPage : ContentPage {
        public string password = "";
        const string checkoutURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/checkout"; // api to post to checkout database
        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end
        public HttpClient client = new HttpClient(); // client to handle all api requests
        const string couponURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/coupon"; // api to get coupon
        public string couponID = ""; // stores the coupon ID
        public double totalDiscount = 0.00;
        public double totalCharge = 0.00;
        public Boolean couponApplied = false;


        public SummaryPage() {

            InitializeComponent();
           
        }


        private async void ConfirmClicked(object sender, EventArgs e) {

            SummaryPasswordPopup passwordPopup = new SummaryPasswordPopup();
            passwordPopup.BindingContext = this;
            await Navigation.PushAsync(passwordPopup);

        }

        // performs the checkout and sends to local database and stripe
        // returns HttpStatusCode.OK if successful and HttpStatusCode.BadRequest if unsuccessful
        public async Task<HttpStatusCode> checkout() { // completes the checkout and sends the information as a json to the database
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
                    totalCharge = this.totalCharge,
                    totalDiscount = this.totalDiscount,
                    couponId = this.couponID
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



        private async void couponButtonClicked(object sender, EventArgs e) {
            UserLoginSession currentUserInfo = App.Database.GetLastItem(); 
            if(!String.IsNullOrEmpty(this.couponEntry.Text)) {
                try {
                    if(couponApplied) {
                        await DisplayAlert("Coupon Already Applied", "A coupon has been applied already.", "OK"); 
                        return;
                    }
                    
                    var fullCouponURL = couponURL + "?coupon_id=" + this.couponEntry.Text + "&email=" + currentUserInfo.Email; // coupon url with params coupon_id and email
                    
                    var response = await client.GetStringAsync(fullCouponURL);

                    var couponResult = JsonConvert.DeserializeObject<CouponResponse>(response);
                    if (couponResult.Message == "Invalid email address for current coupon ID.") { //invalid email
                        await DisplayAlert("Invalid Email", couponResult.Message, "OK");
                    }
                    else if (couponResult.Message == "This coupon is no longer available.") { 
                        await DisplayAlert("Invalid Coupon", couponResult.Message, "OK");
                    }
                    else if (couponResult.Message == "This coupon has expired.") {
                        await DisplayAlert("Expired Coupon", couponResult.Message, "OK");
                    }
                    else if (couponResult.Message == "This coupon is no longer active.") {
                        await DisplayAlert("Inactive Coupon", couponResult.Message, "OK");
                    }
                    else if (couponResult.Message == "Invalid coupon ID") {
                        await DisplayAlert("Invalid Coupon", couponResult.Message, "OK");
                    }
                    else { // success, set coupon id and change front end costs
                        this.couponID = couponResult.Result.CouponID;
                        this.totalDiscount = couponResult.Result.DiscountAmount;
                        this.totalCost.Text = "$" + Math.Round((this.totalCharge - this.totalDiscount),2).ToString();
                        this.totalCharge -= this.totalDiscount;
                        this.fullPlan.Text += "- " + this.couponID;
                        this.totalCostLabel.Text += " - $" + String.Format("{0:.00}",Math.Round(couponResult.Result.DiscountAmount,2));
                    }
                } catch(Exception ex) { // invalid coupon
                    System.Diagnostics.Debug.WriteLine(ex.Message);
                    await DisplayAlert("Invalid Coupon", "Coupon is invalid.", "OK");
                }

            } else {
                await DisplayAlert("Error", "Invalid coupon ID", "OK");
            }
            
        }
    }
}