using System;

using Xamarin.Forms;

using InfiniteMeals.ViewModel.Login;
using InfiniteMeals.ViewModel.MealSelect;
using InfiniteMeals.ViewModel.Profile;
using InfiniteMeals.ViewModel.Subscribe;
using InfiniteMeals.Model.Database;
using System.Windows.Input;
using InfiniteMeals.ViewModel.SignUp;
using System.Collections.Generic;

namespace InfiniteMeals
{

    // main page or home page of the app
    public partial class MainPage : ContentPage
    {

        public ICommand ForgotPasswordCommand => new Command(onForgotPassword);

        public MainPage()
        {
            InitializeComponent();
            System.Diagnostics.Debug.WriteLine("logged in: " + App.LoggedIn);
            if (!App.LoggedIn)
            {
                this.loginButton.Text = "Log in";
            }
            else
            {
                this.loginButton.Text = "Log out";
            }
            //homepage.Source = ImageSource.FromFile("homepage.jpg");
        }

        private async void ClickedLogin(object sender, EventArgs e)
        {
            if (!App.LoggedIn)
            {
                LoginPage loginPage = new LoginPage();
                loginPage.BindingContext = this;
                await Navigation.PushAsync(loginPage);
            }
            else
            {
                App.setLoggedIn(false);
                updateLoginButton();
            }
        }

        private async void ClickedSignup(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignUpPage());
        }

        private async void ClickedMenu(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MenuView());
        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSchedule());
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

        private async void ClickedSubscribe(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SubscribePage());
        }

        // updates the login button based on whether the user is logged in or logged out 
        public void updateLoginButton()
        {
            if (!App.LoggedIn)
            {
                this.loginButton.Text = "Log in";
                profileButton.SetValue(IsVisibleProperty, false);
                msButton.SetValue(IsVisibleProperty, false);
                signupButton.SetValue(IsVisibleProperty, true);

            }
            else
            {
                this.loginButton.Text = "Log out";
                profileButton.SetValue(IsVisibleProperty, true);
                msButton.SetValue(IsVisibleProperty, true);
                signupButton.SetValue(IsVisibleProperty, false);

            }
        }

        private async void onForgotPassword()
        {
            System.Diagnostics.Debug.WriteLine("clicked");
            await Navigation.PushAsync(new ResetPasswordPage());
        }


    }
}
