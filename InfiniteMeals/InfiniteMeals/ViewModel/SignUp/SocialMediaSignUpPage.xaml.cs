using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Newtonsoft.Json;

using InfiniteMeals.Model.Login;
using InfiniteMeals.Model.SignUp;
using System.Net;
using InfiniteMeals.Model.Database;

namespace InfiniteMeals.ViewModel.SignUp {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SocialMediaSignUpPage : ContentPage {

        public HttpClient client = new HttpClient();
        public string socialSignUpUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/socialSignup"; // api link for social account sign up
        const string socialLoginUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/socialacc/"; // api to login the user with social account, need user id at end of link

        public Boolean termsOfServiceChecked = false;
        public Boolean weeklyUpdatesChecked = false;

        private string accessToken = ""; 
        private string refreshToken = "";
        private string socialMedia = "";

        public SocialMediaSignUpPage() {
            InitializeComponent();
        }

        // ctor that takes first name, last name, email, social media, access token, and refresh token as params
        public SocialMediaSignUpPage(string firstName, string lastName, string email, string socialMedia, string accessToken, string refreshToken) {
            InitializeComponent();
            this.firstNameEntry.Text = firstName;
            this.lastNameEntry.Text = lastName;
            this.emailEntry.Text = email;
            this.socialMedia = socialMedia;
            this.accessToken = accessToken;
            this.refreshToken = refreshToken;

        }

        // handler for terms of service button
        private void termsOfServiceButtonClicked(object sender, EventArgs e) {
            ImageButton termsOfServiceButton = (ImageButton)sender;
            termsOfServiceChecked = !termsOfServiceChecked; // change boolean for termsOfServiceChecked
            if (termsOfServiceChecked) {
                termsOfServiceButton.Source = "checkboxSelected"; // change image to selected if checked
            }
            else {
                termsOfServiceButton.Source = "checkboxUnselected"; // change image to unselected if unchecked
            }
        }

        // handler for weekly updates button 
        private void weeklyUpdatesButtonClicked(object sender, EventArgs e) {
            ImageButton weeklyUpdatesButton = (ImageButton)sender;
            weeklyUpdatesChecked = !weeklyUpdatesChecked; // change boolean for weeklyUpdatesChecked
            if (weeklyUpdatesChecked) {
                weeklyUpdatesButton.Source = "checkboxSelected"; // change image to selected if checked
            }
            else {
                weeklyUpdatesButton.Source = "checkboxUnselected"; // change image to unselected if checked
            }

        }

        // handler for sign up button clicked
        private async void ClickedSignUp(object sender, EventArgs e) {
            if (String.IsNullOrEmpty(this.firstNameEntry.Text) || String.IsNullOrEmpty(this.lastNameEntry.Text) ||
                String.IsNullOrEmpty(this.emailEntry.Text) || String.IsNullOrEmpty(this.phoneNumberEntry.Text)) { // checks if any of the fields are empty
                await DisplayAlert("Empty Field(s)", "Please fill all fields", "OK");
                return;
            } else if(this.phoneNumberEntry.Text.Length < 10) { // checks for a valid 10 digit phone number
                await DisplayAlert("Invalid Phone Number", "Please enter a valid phone number", "OK");
                return;
            } else if(!termsOfServiceChecked) { // checks if terms of service are agreed to
                await DisplayAlert("Terms of Service Agreement", "Please agree to the Terms of Service", "OK");
                return;
            } else { // all fields are valid, attempt sign up
                SocialMediaSignUpPost socialSignUpContent = new SocialMediaSignUpPost {
                    Email = this.emailEntry.Text,
                    FirstName = this.firstNameEntry.Text,
                    LastName = this.lastNameEntry.Text,
                    PhoneNumber = this.phoneNumberEntry.Text,
                    WeeklyUpdates = this.weeklyUpdatesChecked.ToString(),
                    Referral = this.referralPicker.SelectedItem.ToString(),
                    SocialMedia = this.socialMedia,
                    AccessToken = this.accessToken,
                    RefreshToken = this.refreshToken

                };

                string signUpContentJson = JsonConvert.SerializeObject(socialSignUpContent); // convert to json 
                System.Diagnostics.Debug.WriteLine("sign up content: " + signUpContentJson);
                var httpContent = new StringContent(signUpContentJson, Encoding.UTF8, "application/json"); // convert to string content
                try {
                    var response = await client.PostAsync(socialSignUpUrl, httpContent);
                    if(response.StatusCode != HttpStatusCode.OK) { // error when signing up
                        var failResponseContent = await response.Content.ReadAsStringAsync();
                        var failResponse = JsonConvert.DeserializeObject<SocialMediaSignUpFailResponse>(failResponseContent);
                        await DisplayAlert("Sign Up Failed", failResponse.Result, "OK"); // display an alert with the error message

                    } else { // sign up successful, log the user in
                        var successResponseContent = await response.Content.ReadAsStringAsync();
                        var successResponse = JsonConvert.DeserializeObject<SocialMediaSignUpSuccessResponse>(successResponseContent);
                        var socialLoginAttempt = await socialLogin(successResponse.Result.UserUid);
                        if(socialLoginAttempt != null && socialLoginAttempt.Message != "Request failed, wrong password.") {
                            captureLoginSession(socialLoginAttempt);
                            await DisplayAlert("Success", "Your account was created and you are logged in.", "OK");
                            await Navigation.PopToRootAsync();
                            return;
                        }
                        
                    }
                } catch(Exception ex) {
                    System.Diagnostics.Debug.WriteLine(ex.Message);
                }
                return;
            }
            
        }

        public async Task<LoginResponse> socialLogin(string userUid) {
            const string deviceBrowserType = "Mobile";
            const string deviceIpAddress = "0.0.0.0";

            LoginPost loginPostContent = new LoginPost() { // object that contains ip address and browser type; will be converted into a json object 
                ipAddress = deviceIpAddress.ToString(),
                browserType = deviceBrowserType
            };

            string loginPostContentJson = JsonConvert.SerializeObject(loginPostContent); // make orderContent into json

            var httpContent = new StringContent(loginPostContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database

            var response = await client.PostAsync(socialLoginUrl + userUid, httpContent); // try to post to database
            if (response.StatusCode == HttpStatusCode.OK) {
                var responseContent = await response.Content.ReadAsStringAsync();

                var loginResponse = JsonConvert.DeserializeObject<LoginResponse>(responseContent);
                return loginResponse;
            }
            return null;
        }

        // captures the login session, sending the user data to local database 
        // sets the app as logged in and updates the main menu 
        public async void captureLoginSession(LoginResponse loginResponse) {

            var userSessionInformation = new UserLoginSession { // object to send into local database
                UserUid = loginResponse.Result.Result[0].UserUid,
                FirstName = loginResponse.Result.Result[0].FirstName,
                SessionId = loginResponse.LoginAttemptLog.SessionId,
                LoginId = loginResponse.LoginAttemptLog.LoginId,
                Email = loginResponse.Result.Result[0].UserEmail
            };

            await App.Database.SaveItemAsync(userSessionInformation); // send login session to local database
            System.Diagnostics.Debug.WriteLine("user logged in: " + App.Database.GetLastItem().Email);
            App.setLoggedIn(true);
            MainPage mainPage = (MainPage)Navigation.NavigationStack[0];
            mainPage.updateLoginButton();
        }
    }
}