﻿using System;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;

using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Login;
using InfiniteMeals.ViewModel.SignUp;
using InfiniteMeals.Model.User;
using System.Threading.Tasks;
using InfiniteMeals.Model.Database;


namespace InfiniteMeals.ViewModel.Login
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage {

        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end of link
        const string loginURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/"; // api to log in; need email + hashed password at the end of link
        public HttpClient client = new HttpClient(); // client to handle all api calls

        public LoginPage() {
            InitializeComponent();
            
        }

        private async void ClickedLogin(object sender, EventArgs e) {
            if (String.IsNullOrEmpty(this.loginEmail.Text) && String.IsNullOrEmpty(this.loginPassword.Text)) { // checks that all fields are filled
                await DisplayAlert("Error", "Please fill in all fields", "OK");
            } else {
               
                var accountSalt = await retrieveAccountSalt(this.loginEmail.Text); // retrieve user's account salt
                if (accountSalt != null && accountSalt.result.Count != 0) { // make sure the account salt exists 
                    var loginAttempt = await login(this.loginEmail.Text, this.loginPassword.Text, accountSalt);
                    if (loginAttempt != null && loginAttempt.Message != "Request failed, wrong password.") { // make sure the login attempt was successful
                        var userSessionInformation = new UserLoginSession { // object to send into local database
                            UserUid = loginAttempt.Result.Result[0].UserUid,
                            FirstName = loginAttempt.Result.Result[0].FirstName,
                            SessionId = loginAttempt.LoginAttemptLog.SessionId,
                            LoginId = loginAttempt.LoginAttemptLog.LoginId,
                            Email = loginAttempt.Result.Result[0].UserEmail
                        };
                        await App.Database.SaveItemAsync(userSessionInformation); // send login session to local database
                        App.setLoggedIn(true);
                        if (this.BindingContext != null) {
                            MainPage mainPage = (MainPage)this.BindingContext;
                            mainPage.updateLoginButton();
                        }
                        
                        await Navigation.PopAsync();
                        
                        await DisplayAlert("Note", "Successfully logged in!", "OK");
                    } else {
                        await DisplayAlert("Error", "Wrong password was entered", "OK");
                    }
                } else {
                    await DisplayAlert("Error", "An account with that email does not exist", "OK");
                }  

            }
            
        }

        // logs the user into the app 
        // returns a LoginResponse if successful and null if unsuccessful 
        public async Task<LoginResponse> login(string userEmail, string userPassword, AccountSalt accountSalt) {
            const string deviceBrowserType = "Mobile";
            var deviceIpAddress = Dns.GetHostAddresses(Dns.GetHostName()).FirstOrDefault();
            if (deviceIpAddress != null) {
                try {
                    System.Diagnostics.Debug.WriteLine("ip: " + deviceIpAddress);
                    LoginPost loginPostContent = new LoginPost() { // object that contains ip address and browser type; will be converted into a json object 
                        ipAddress = deviceIpAddress.ToString(),
                        browserType = deviceBrowserType
                    };

                    string loginPostContentJson = JsonConvert.SerializeObject(loginPostContent); // make orderContent into json
                    System.Diagnostics.Debug.WriteLine(loginPostContentJson);
                    var httpContent = new StringContent(loginPostContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database


                    SHA512 sHA512 = new SHA512Managed();
                    byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(userPassword + accountSalt.result[0].passwordSalt)); // take the password and account salt to generate hash
                    string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex


                    var response = await client.PostAsync(loginURL + userEmail + "/" + hashedPassword, httpContent); // try to post to database
                    System.Diagnostics.Debug.WriteLine("response: " + response);

                    if (response.Content != null) { // post was successful
                        var responseContent = await response.Content.ReadAsStringAsync();

                        var loginResponse = JsonConvert.DeserializeObject<LoginResponse>(responseContent);

                        return loginResponse;

                    }
                } 
                catch (Exception e) {
                    System.Diagnostics.Debug.WriteLine(e.Message);
                  
                }


            }
            return null;
        }

        // uses account salt api to retrieve the user's account salt
        // account salt is used to find the user's hashed password
        public async Task<AccountSalt> retrieveAccountSalt(string userEmail) {
            try {
                var content = await client.GetStringAsync(accountSaltURL + userEmail); // get the requested account salt
                System.Diagnostics.Debug.WriteLine("content");
                System.Diagnostics.Debug.WriteLine(content);
                var accountSalt = JsonConvert.DeserializeObject<AccountSalt>(content);
                return accountSalt;
            } catch(Exception ex) {
                System.Diagnostics.Debug.WriteLine(ex.Message);
         
            }
            return null;
        }

        // navigates the user to the sign up page
        private async void SignUpClicked(object sender, EventArgs e) {
            await Navigation.PushAsync(new SignUpPage());
        }
    }
}