using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.Subscribe
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Subscribe : ContentPage
    {
        public Subscribe()
        {
            InitializeComponent();
            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage3.Source = ImageSource.FromFile("mealplan.jpg");
        }

        private async void ClickedSignUp(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Signup.SignUp());
        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Meals.MealSchedule());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Profile.UserProfile());
        }

        private async void Clicked5mealssubscription(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new FiveMeals());
        }

        private async void Clicked10mealssubscription(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new TenMeals());
        }

        private async void Clicked15mealssubscription(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new FifteenMeals());
        }


    }
}