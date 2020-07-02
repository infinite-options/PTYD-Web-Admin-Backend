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
    public partial class PaymentOptionPage : ContentPage {
        const string mealPlanAPI = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/plans"; // api used for meal plans
        public PaymentOptionPage() {


            InitializeComponent();

            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
        }

        private async void WeekPaymentPlanClicked(object sender, EventArgs e) {

            SubscriptionPlan weeklyPlan = new SubscriptionPlan((MealPlan)this.BindingContext, PaymentOption.Week);
            weeklyPlan.cost = await getMealPlanCost(weeklyPlan); // set the cost
            if (App.LoggedIn) {
                Delivery weeklyPlanCheckout = new Delivery();
                weeklyPlanCheckout.BindingContext = weeklyPlan;
                await Navigation.PushAsync(weeklyPlanCheckout);
            } else {
                CheckoutLogin checkoutLoginPage = new CheckoutLogin();
                checkoutLoginPage.BindingContext = weeklyPlan;
                await Navigation.PushAsync(checkoutLoginPage);
            }

        }

        private async void TwoWeekPaymentPlanClicked(object sender, EventArgs e) {

            SubscriptionPlan twoWeekPrePayPlan = new SubscriptionPlan((MealPlan)this.BindingContext, PaymentOption.TwoWeek);
            twoWeekPrePayPlan.cost = await getMealPlanCost(twoWeekPrePayPlan); // set the cost
            if (App.LoggedIn) { 
                Delivery twoWeekPrePayPlanCheckout = new Delivery();
                twoWeekPrePayPlanCheckout.BindingContext = twoWeekPrePayPlan;
                await Navigation.PushAsync(twoWeekPrePayPlanCheckout);
        } else {
                CheckoutLogin checkoutLoginPage = new CheckoutLogin();
                checkoutLoginPage.BindingContext = twoWeekPrePayPlan;
                await Navigation.PushAsync(checkoutLoginPage);
            }

        }

        private async void FourWeekPaymentPlanClicked(object sender, EventArgs e) {
            SubscriptionPlan fourWeekPrePayPlan = new SubscriptionPlan((MealPlan)this.BindingContext, PaymentOption.FourWeek);
            fourWeekPrePayPlan.cost = await getMealPlanCost(fourWeekPrePayPlan); // get the cost from the database and set it to the subscription plan

            if (App.LoggedIn) {
             
                System.Diagnostics.Debug.WriteLine("ID: " + fourWeekPrePayPlan.id);

                Delivery fourWeekPrePayPlanCheckout = new Delivery();
                fourWeekPrePayPlanCheckout.BindingContext = fourWeekPrePayPlan;
                await Navigation.PushAsync(fourWeekPrePayPlanCheckout);
            } else {
                CheckoutLogin checkoutLoginPage = new CheckoutLogin();
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
                foreach(Result result in obj.result.FiveMealPaymentPlans.result) {
                    if(result.meal_plan_id.Equals(subscriptionPlan.id)) {
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

            } catch (ArgumentNullException e) { // handles exception for null subscription plan
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            } catch (HttpRequestException e) { // handles exception for network connectivity
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            } catch(TaskCanceledException e) { // handles exception for timeout
                await DisplayAlert("Error", e.Message, "OK");
                return -1;
            }
            
        }

        
    }
}