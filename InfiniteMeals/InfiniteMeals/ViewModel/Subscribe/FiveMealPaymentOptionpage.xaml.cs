using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.ViewModel.Checkout;
using InfiniteMeals.ViewModel.Login;
using Newtonsoft.Json;
using PrepToYourDoor.ViewModel.Checkout;
using System;
using System.Net.Http;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.ViewModel.Subscribe {
    [XamlCompilation(XamlCompilationOptions.Compile)]

    // 5 meal plans only have weekly and 4 week pre-pay
    // displays payment options for the user to choose
    public partial class FiveMealPaymentOptionPage : ContentPage {

        const string mealPlanAPI = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/plans"; // api used for meal plans
        public FiveMealPaymentOptionPage() {
            InitializeComponent();

            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
        }

        // handles when the weekly payment button is clicked
        private async void WeekPaymentPlanClicked(object sender, EventArgs e) {

            SubscriptionPlan weeklyPlan = new SubscriptionPlan((MealPlan)this.BindingContext, PaymentOption.Week);
            weeklyPlan.cost = await getMealPlanCost(weeklyPlan); // set the cost
            if (App.LoggedIn) { // user is led to checkout process if logged in
                DeliveryPage weeklyPlanCheckout = new DeliveryPage();
                weeklyPlanCheckout.BindingContext = weeklyPlan;
                await Navigation.PushAsync(weeklyPlanCheckout);
            } else { // user is prompted to log in if not logged in 
                CheckoutLoginPage checkoutLoginPage = new CheckoutLoginPage();
                checkoutLoginPage.BindingContext = weeklyPlan;
                await Navigation.PushAsync(checkoutLoginPage);
            }

        }

        // handles when the 4 week pre-pay button is clicked
        private async void FourWeekPaymentPlanClicked(object sender, EventArgs e) {

            SubscriptionPlan fourWeekPrePayPlan = new SubscriptionPlan((MealPlan)this.BindingContext, PaymentOption.FourWeek);
            fourWeekPrePayPlan.cost = await getMealPlanCost(fourWeekPrePayPlan); // set the cost
            if (App.LoggedIn) { // user is led to checkout process if logged in
                DeliveryPage fourWeekPrePayPlanCheckout = new DeliveryPage();
                fourWeekPrePayPlanCheckout.BindingContext = fourWeekPrePayPlan;
                await Navigation.PushAsync(fourWeekPrePayPlanCheckout);
            } else { // user is prompted to log in if not logged in 
                CheckoutLoginPage checkoutLoginPage = new CheckoutLoginPage();
                checkoutLoginPage.BindingContext = fourWeekPrePayPlan;
                await Navigation.PushAsync(checkoutLoginPage);
            }

        }


        // function to get the meal plan cost based on the subscription plan
        // returns a task (double) with the result
        public async Task<double> getMealPlanCost(SubscriptionPlan subscriptionPlan) {
            try {
                HttpClient client = new HttpClient();
                var content = await client.GetStringAsync(mealPlanAPI);
                var obj = JsonConvert.DeserializeObject<MealPlanInformation>(content);

                // check the five meal payment plans for a match
                foreach (Result result in obj.result.FiveMealPaymentPlans.result) {
                    if (result.meal_plan_id.Equals(subscriptionPlan.id)) {
                        System.Diagnostics.Debug.WriteLine(result.meal_plan_price);
                        return result.meal_plan_price;

                    }
                }

                // check the ten meal payment plans for a match
                foreach (Result result in obj.result.TenMealPaymentPlans.result) {
                    if (result.meal_plan_id.Equals(subscriptionPlan.id)) {
                        System.Diagnostics.Debug.WriteLine(result.meal_plan_price);
                        return result.meal_plan_price;

                    }
                }

                // check the fifteen meal payment plans for a match
                foreach (Result result in obj.result.FifteenMealPaymentPlans.result) {
                    if (result.meal_plan_id.Equals(subscriptionPlan.id)) {
                        System.Diagnostics.Debug.WriteLine(result.meal_plan_price);
                        return result.meal_plan_price;

                    }
                }

                // check the twenty meal payment plans for a match
                foreach (Result result in obj.result.TwentyMealPaymentPlans.result) {
                    if (result.meal_plan_id.Equals(subscriptionPlan.id)) {
                        System.Diagnostics.Debug.WriteLine(result.meal_plan_price);
                        return result.meal_plan_price;

                    }
                }

                return -1; // result isn't found, return -1

            }
            catch (ArgumentNullException e) { // handles exception for null subscription plan
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            }
            catch (HttpRequestException e) { // handles exception for network connectivity
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            }
            catch (TaskCanceledException e) { // handles exception for timeout
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            }

        }


    }
}