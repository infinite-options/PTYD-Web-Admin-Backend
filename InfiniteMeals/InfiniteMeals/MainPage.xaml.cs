using System;

using Xamarin.Forms;

using InfiniteMeals.ViewModel.SignIn;
using InfiniteMeals.ViewModel.MealSelect;
using InfiniteMeals.ViewModel.Profile;
using InfiniteMeals.ViewModel.Subscribe;



namespace InfiniteMeals
{
    public partial class MainPage : ContentPage
    {



        private async void ClickedSignIn(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignIn());
        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSchedule());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserProfile());
        }

        private async void ClickedSubscribe(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SubscribePage());
        }


       
        public MainPage()
        {
            InitializeComponent();

            homepage.Source = ImageSource.FromFile("homepage.jpg");

            
        }

    }
}
