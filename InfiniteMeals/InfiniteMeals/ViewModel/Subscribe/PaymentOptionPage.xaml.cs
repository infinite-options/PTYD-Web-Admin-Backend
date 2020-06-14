using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.ViewModel.Checkout;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace InfiniteMeals.ViewModel.Subscribe {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PaymentOptionPage : ContentPage {

        public PaymentOptionPage() {


            InitializeComponent();

            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
        }

        private async void WeekPaymentPlanClicked(object sender, EventArgs e) {
            Delivery weeklyPlanCheckout = new Delivery();
            SubscriptionPlan weeklyPlan = new SubscriptionPlan {
                mealPlan = (MealPlan)this.BindingContext,
                paymentOption = PaymentOption.Week
            };
            weeklyPlanCheckout.BindingContext = weeklyPlan;
            await Navigation.PushAsync(weeklyPlanCheckout);
        }

        private async void TwoWeekPaymentPlanClicked(object sender, EventArgs e) {
            Delivery twoWeekPlanCheckout = new Delivery();
            SubscriptionPlan twoWeekPlan = new SubscriptionPlan {
                mealPlan = (MealPlan)this.BindingContext,
                paymentOption = PaymentOption.TwoWeek
            };
            twoWeekPlanCheckout.BindingContext = twoWeekPlan;
            await Navigation.PushAsync(twoWeekPlanCheckout);

        }

        private async void FourWeekPaymentPlanClicked(object sender, EventArgs e) {
            Delivery fourWeekPlanCheckout = new Delivery();
            SubscriptionPlan fourWeekPlan = new SubscriptionPlan {
                mealPlan = (MealPlan)this.BindingContext,
                paymentOption = PaymentOption.FourWeek
            };
            fourWeekPlanCheckout.BindingContext = fourWeekPlan;
            await Navigation.PushAsync(fourWeekPlanCheckout);

        }
    }
}