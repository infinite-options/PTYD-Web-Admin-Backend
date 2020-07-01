using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.ViewModel.MealSelect;
using InfiniteMeals.ViewModel.Profile;
using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.ViewModel.SignUp;



namespace InfiniteMeals.ViewModel.Subscribe
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SubscribePage : ContentPage
    {
        public SubscribePage()
        {
            InitializeComponent();
            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage3.Source = ImageSource.FromFile("mealplan.jpg");
        }

        private async void ClickedSignUp(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignUpPage());
        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSchedule());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserProfile());
        }

        private async void Clicked5mealssubscription(object sender, EventArgs e)
        {
            FiveMealPaymentOptionPage fiveMealPlan = new FiveMealPaymentOptionPage();
            fiveMealPlan.BindingContext = MealPlan.FiveMeals;
            Label mealPlanLabel = (Label)fiveMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.FiveMeals);            
            await Navigation.PushAsync(fiveMealPlan);
        }

        private async void Clicked10mealssubscription(object sender, EventArgs e)
        {
            PaymentOptionPage tenMealPlan = new PaymentOptionPage();
            tenMealPlan.BindingContext = MealPlan.TenMeals;
            Label mealPlanLabel = (Label)tenMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.TenMeals);
            await Navigation.PushAsync(tenMealPlan);
        }

        private async void Clicked15mealssubscription(object sender, EventArgs e)
        {
            PaymentOptionPage fifteenMealPlan = new PaymentOptionPage();
            fifteenMealPlan.BindingContext = MealPlan.FifteenMeals;
            Label mealPlanLabel = (Label)fifteenMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.FifteenMeals);
            await Navigation.PushAsync(fifteenMealPlan);
        }

        private async void Clicked20mealssubscription(object sender, EventArgs e) {

            PaymentOptionPage twentyMealPlan = new PaymentOptionPage();
            twentyMealPlan.BindingContext = MealPlan.TwentyMeals;
            Label mealPlanLabel = (Label)twentyMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.TwentyMeals);
            await Navigation.PushAsync(twentyMealPlan);
        }


    }
}