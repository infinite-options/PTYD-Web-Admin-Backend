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
using System.Net;
using Newtonsoft.Json;
using InfiniteMeals.Model.Database;

namespace InfiniteMeals.ViewModel.Subscribe
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    // prompts the user to select a meal plan
    public partial class SubscribePage : ContentPage
    {
        private static string textUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/plans";
        private static List<string> payments = new List<string>();
        private static List<string> paymentText = new List<string>();

        public SubscribePage()
        {
            InitializeComponent();

            WebClient client = new WebClient();
            var content = client.DownloadString(textUrl);
            var obj = JsonConvert.DeserializeObject<SubscriptionPlans>(content);
            var mealNum = 0;
            for (int i = 0; i < obj.Result.MealPlans.Result.Length; i++)
            {
                if (i == 0)
                    mealNum = 5;
                else if (i == 1)
                    mealNum = 10;
                else if (i == 2)
                    mealNum = 15;
                else
                    mealNum = 20;
                payments.Add(String.Format("\t\t{0} Meal Plan \n Starting at {0:0.00} per meal", mealNum, obj.Result.MealPlans.Result[i].MealPlanPricePerMeal));
            }

            Meals5Label.Text = payments[0];
            Meals10Label.Text = payments[1];
            Meals15Label.Text = payments[2];
            Meals20Label.Text = payments[3];

            mealimage.Source = ImageSource.FromFile("subscription.jpg");
            mealimage1.Source = ImageSource.FromFile("subscription.jpg");
            mealimage2.Source = ImageSource.FromFile("subscription.jpg");
            mealimage3.Source = ImageSource.FromFile("subscription.jpg");
        }

        private async void ClickedSignUp(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignUpPage());
        }

        private async void ClickedMenuView(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MenuView());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            if (!App.LoggedIn)
            {
                await DisplayAlert("Error", "You are currently not logged in", "OK");
            }
            else
            {
                UserProfile userProfile = new UserProfile();
                UserLoginSession currentUserInfo = App.Database.GetLastItem();
                userProfile.BindingContext = currentUserInfo;
                await Navigation.PushAsync(userProfile);
            }
        }

        // handles when the 5 meal plan button is clicked
        private async void Clicked5mealssubscription(object sender, EventArgs e)
        {
            FiveMealPaymentOptionPage fiveMealPlan = new FiveMealPaymentOptionPage();
            fiveMealPlan.BindingContext = MealPlan.FiveMeals;
            Label mealPlanLabel = (Label)fiveMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.FiveMeals);
            await Navigation.PushAsync(fiveMealPlan);
        }

        // handles when the 10 meal plan button is clicked
        private async void Clicked10mealssubscription(object sender, EventArgs e)
        {
            PaymentOptionPage tenMealPlan = new PaymentOptionPage();
            tenMealPlan.BindingContext = MealPlan.TenMeals;
            Label mealPlanLabel = (Label)tenMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.TenMeals);
            await Navigation.PushAsync(tenMealPlan);
        }

        // handles when the 15 meal plan button is clicked
        private async void Clicked15mealssubscription(object sender, EventArgs e)
        {
            PaymentOptionPage fifteenMealPlan = new PaymentOptionPage();
            fifteenMealPlan.BindingContext = MealPlan.FifteenMeals;
            Label mealPlanLabel = (Label)fifteenMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.FifteenMeals);
            await Navigation.PushAsync(fifteenMealPlan);
        }

        // handles when the 20 meal plan button is clicked
        private async void Clicked20mealssubscription(object sender, EventArgs e)
        {

            PaymentOptionPage twentyMealPlan = new PaymentOptionPage();
            twentyMealPlan.BindingContext = MealPlan.TwentyMeals;
            Label mealPlanLabel = (Label)twentyMealPlan.FindByName("mealPlan");
            mealPlanLabel.Text = MealPlanExtension.mealPlanToString(MealPlan.TwentyMeals);
            await Navigation.PushAsync(twentyMealPlan);
        }


    }
}