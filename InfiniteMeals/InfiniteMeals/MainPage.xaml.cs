using System;

using Xamarin.Forms;

using InfiniteMeals.ViewModel.Login;
using InfiniteMeals.ViewModel.MealSelect;
using InfiniteMeals.ViewModel.Profile;
using InfiniteMeals.ViewModel.Subscribe;



namespace InfiniteMeals
{
    public partial class MainPage : ContentPage
    {

        public MainPage() {
            InitializeComponent();
            System.Diagnostics.Debug.WriteLine("logged in: " + App.LoggedIn);
            if (!App.LoggedIn) {
                this.loginButton.Text = "Log in";
            }
            else {
                this.loginButton.Text = "Log out";
            }
            homepage.Source = ImageSource.FromFile("homepage.jpg");
        }

        private async void ClickedLogin(object sender, EventArgs e)
        {
            var loginPage = new LoginPage();
            loginPage.BindingContext = this;
            await Navigation.PushAsync(loginPage);
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

        // updates the login button based on whether the user is logged in or logged out 
        public void updateLoginButton() {
            if (!App.LoggedIn) {
                this.loginButton.Text = "Log in";
            }
            else {
                this.loginButton.Text = "Log out";
            }
        }


       

    }
}
