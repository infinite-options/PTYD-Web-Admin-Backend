using System;

using Xamarin.Forms;
using Xamarin.Essentials;

using InfiniteMeals.ViewModel.Login;
using InfiniteMeals.ViewModel.MealSelect;
using InfiniteMeals.ViewModel.Profile;
using InfiniteMeals.ViewModel.Subscribe;
using InfiniteMeals.Model.Database;
using System.Windows.Input;
using InfiniteMeals.ViewModel.SignUp;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace InfiniteMeals
{

    // main page or home page of the app
    public partial class MainPage : ContentPage
    {
        private string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/";
        public ICommand ForgotPasswordCommand => new Command(onForgotPassword);
        private static string userID;
        MealChoices mc = (MealChoices)FormatterServices.GetUninitializedObject(typeof(MealChoices));

        public MainPage()
        {
            InitializeComponent();
            var currentVersion = VersionTracking.CurrentVersion;

            System.Diagnostics.Debug.WriteLine("version number: " + currentVersion);
            System.Diagnostics.Debug.WriteLine("logged in: " + App.LoggedIn);
            if (!App.LoggedIn)
            {
                this.loginButton.Text = "Log in";
            }
            else
            {
                this.loginButton.Text = "Log out";
            }

            if (Device.RuntimePlatform == Device.iOS)
            {
                getStartedButton.CornerRadius = 15;
                EatBetterButton.CornerRadius = 15;
                //TheCarousel.IsVisible = false;
            }
            else if (Device.RuntimePlatform == Device.Android)
            {
                getStartedButton.CornerRadius = 50;
                EatBetterButton.CornerRadius = 50;
                //TheCarousel.IsVisible = true;
            }
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
            /*
            WebClient client = new WebClient();
            userID = mc.getUserAcct();
            var userZipCodes = client.DownloadString(acctUrl + userID);
            var userZipObj = JsonConvert.DeserializeObject<UserInformation>(userZipCodes);
            var numSubscriptions = userZipObj.Result.Length;
            await Navigation.PushAsync(new MealSchedule());

            if (numSubscriptions == 0)
            {
                await DisplayAlert("You don't have any meal plans", "Please subscribe to a meal plan on the homepage first.", "OK");
            }
            else
            {*/
                await Navigation.PushAsync(new MealSchedule());
           // }

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
