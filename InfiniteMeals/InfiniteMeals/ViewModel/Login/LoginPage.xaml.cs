using System;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;

using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin.Essentials;

using InfiniteMeals.Model.Login;
using InfiniteMeals.ViewModel.SignUp;
using InfiniteMeals.Model.User;
using System.Threading.Tasks;
using InfiniteMeals.Model.Database;
using System.Windows.Input;
using Xamarin.Auth;
using System.Diagnostics;
using System.Collections;

namespace InfiniteMeals.ViewModel.Login
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        const string accountSaltUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end of link
        const string loginUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/"; // api to log in; need email + hashed password at the end of link
        const string socialUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/social/"; // api to check if user has a social media account; need email at end of link
        const string socialLoginUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/socialacc/"; // api to login the user with social account, need user id at end of link


        public HttpClient client = new HttpClient(); // client to handle all api calls

        Account account;
        [Obsolete]
        AccountStore store;

        [Obsolete]
        public LoginPage()
        {
            InitializeComponent();
            store = AccountStore.Create();
            InterfaceFormat();
            versionNumber.Text = "Version: " + VersionTracking.CurrentVersion; // show version number of app
        }

        public void InterfaceFormat()
        {
            if (Device.RuntimePlatform == Device.iOS)
            {
                LoginButton.CornerRadius = 15;
                SignUpButton.CornerRadius = 15;
            }
            else if (Device.RuntimePlatform == Device.Android)
            {
                LoginButton.CornerRadius = 50;
                SignUpButton.CornerRadius = 50;
            }
        }


        // handles when the login button is clicked
        private async void ClickedLogin(object sender, EventArgs e)
        {
            LoginButton.IsEnabled = false;
            if (String.IsNullOrEmpty(this.loginEmail.Text) || String.IsNullOrEmpty(this.loginPassword.Text))
            { // check if all fields are filled out
                await DisplayAlert("Error", "Please fill in all fields", "OK");
                LoginButton.IsEnabled = true;
            }
            else
            {

                var accountSalt = await retrieveAccountSalt(this.loginEmail.Text); // retrieve user's account salt
                System.Diagnostics.Debug.WriteLine("account salt count: " + accountSalt.result.Count);
                if (accountSalt != null && accountSalt.result.Count != 0)
                { // make sure the account salt exists 
                    var loginAttempt = await login(this.loginEmail.Text, this.loginPassword.Text, accountSalt);
                    System.Diagnostics.Debug.WriteLine("login attempt: " + loginAttempt.GetType());
                    if (loginAttempt != null && loginAttempt.Message != "Request failed, wrong password.")
                    { // make sure the login attempt was successful
                        captureLoginSession(loginAttempt);
                        await Navigation.PopAsync();

                    }
                    else
                    {
                        await DisplayAlert("Error", "Wrong password was entered", "OK");
                        LoginButton.IsEnabled = true;
                    }
                }
                else
                {
                    await DisplayAlert("Error", "An account with that email does not exist", "OK");
                    LoginButton.IsEnabled = true;

                }

            }

        }

        // logs the user into the app 
        // returns a LoginResponse if successful and null if unsuccessful 
        public async Task<LoginResponse> login(string userEmail, string userPassword, AccountSalt accountSalt)
        {
            const string deviceBrowserType = "Mobile";
            // var deviceIpAddress = Dns.GetHostAddresses(Dns.GetHostName()).FirstOrDefault();

            var deviceIpAddress = "0.0.0.0";
            if (deviceIpAddress != null)
            {
                try
                {

                    LoginPost loginPostContent = new LoginPost()
                    { // object that contains ip address and browser type; will be converted into a json object 
                        ipAddress = deviceIpAddress.ToString(),
                        browserType = deviceBrowserType
                    };

                    string loginPostContentJson = JsonConvert.SerializeObject(loginPostContent); // make orderContent into json

                    var httpContent = new StringContent(loginPostContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database


                    SHA512 sHA512 = new SHA512Managed();
                    byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(userPassword + accountSalt.result[0].passwordSalt)); // take the password and account salt to generate hash
                    string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex


                    var response = await client.PostAsync(loginUrl + userEmail + "/" + hashedPassword, httpContent); // try to post to database


                    if (response.Content != null)
                    { // post was successful
                        var responseContent = await response.Content.ReadAsStringAsync();

                        var loginResponse = JsonConvert.DeserializeObject<LoginResponse>(responseContent);
                        return loginResponse;

                    }
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Exception message: " + e.Message);
                    return null;

                }


            }
            return null;

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
            if(response.StatusCode == HttpStatusCode.OK) {
                var responseContent = await response.Content.ReadAsStringAsync();

                var loginResponse = JsonConvert.DeserializeObject<LoginResponse>(responseContent);
                return loginResponse;
            }
            return null;
        }

        // uses account salt api to retrieve the user's account salt
        // account salt is used to find the user's hashed password
        public async Task<AccountSalt> retrieveAccountSalt(string userEmail)
        {
            try
            {
                var content = await client.GetStringAsync(accountSaltUrl + userEmail); // get the requested account salt
                var accountSalt = JsonConvert.DeserializeObject<AccountSalt>(content);
                System.Diagnostics.Debug.WriteLine("account salt good");
                return accountSalt;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);

            }
            return null;
        }

        // navigates the user to the sign up page
        private async void SignUpClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignUpPage());
        }


        public async void captureLoginSession(LoginResponse loginResponse)
        {

            var userSessionInformation = new UserLoginSession
            { // object to send into local database
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

        // handler for when google login button is clicked 
        [Obsolete]
        private void googleLoginButtonClicked(object sender, EventArgs e) {
            string clientId = null;
            string redirectUri = null;

            // retrieve client id based on the platform
            switch(Device.RuntimePlatform) {
                case Device.iOS:
                    clientId = SocialMediaLoginConstants.GoogleiOSClientId;
                    redirectUri = SocialMediaLoginConstants.GoogleiOSRedirectUrl;
                    break;

                case Device.Android:
                    clientId = SocialMediaLoginConstants.GoogleAndroidClientId;
                    redirectUri = SocialMediaLoginConstants.GoogleAndroidRedirectUrl;
                    break;
            }

            account = store.FindAccountsForService(SocialMediaLoginConstants.AppName).FirstOrDefault();

            var authenticator = new OAuth2Authenticator(
                clientId,
                null,
                SocialMediaLoginConstants.GoogleScope,
                new Uri(SocialMediaLoginConstants.GoogleAuthorizeUrl),
                new Uri(redirectUri),
                new Uri(SocialMediaLoginConstants.GoogleAccessTokenUrl),
                null,
                true);

            authenticator.Completed += OnAuthCompleted;
            authenticator.Error += OnAuthError;

            AuthenticationState.Authenticator = authenticator;

            var presenter = new Xamarin.Auth.Presenters.OAuthLoginPresenter();

            presenter.Login(authenticator);
        }

        // handler for when facebook login button is clicked
        [Obsolete]
        private void facebookLoginButtonClicked(object sender, EventArgs e) {
            string clientId = null;
            string redirectUri = null;

            switch (Device.RuntimePlatform) {
                case Device.iOS:
                    clientId = SocialMediaLoginConstants.FacebookiOSClientId;
                    redirectUri = SocialMediaLoginConstants.FacebookiOSRedirectUrl;
                    break;

                case Device.Android:
                    clientId = SocialMediaLoginConstants.FacebookAndroidClientId;
                    redirectUri = SocialMediaLoginConstants.FacebookAndroidRedirectUrl;
                    break;
            }

            account = store.FindAccountsForService(SocialMediaLoginConstants.AppName).FirstOrDefault();

            var authenticator = new OAuth2Authenticator(
                clientId,
                SocialMediaLoginConstants.FacebookScope,
                new Uri(SocialMediaLoginConstants.FacebookAuthorizeUrl),
                new Uri(SocialMediaLoginConstants.FacebookAccessTokenUrl),
                null);

            authenticator.Completed += OnAuthCompleted;
            authenticator.Error += OnAuthError;

            var presenter = new Xamarin.Auth.Presenters.OAuthLoginPresenter();
            presenter.Login(authenticator);

            
        }

        // function when the auth is completed without any errors
        [Obsolete]
        async void OnAuthCompleted(object sender, AuthenticatorCompletedEventArgs e) {
            var authenticator = sender as OAuth2Authenticator;
            if(authenticator != null) {
                authenticator.Completed -= OnAuthCompleted;
                authenticator.Error -= OnAuthError;
            }
            Debug.WriteLine("starting authentication");
            if(e.IsAuthenticated) {
                Debug.WriteLine("first authentication");
                if(authenticator.AuthorizeUrl.Host == "www.facebook.com") {
                    Debug.WriteLine("authenticated!!!");
                    FacebookEmail facebookEmail = null;

                    var json = await client.GetStringAsync($"https://graph.facebook.com/me?fields=id,name,first_name,last_name,email,picture.type(large)&access_token=" + e.Account.Properties["access_token"]);

                    facebookEmail = JsonConvert.DeserializeObject<FacebookEmail>(json);

                    await store.SaveAsync(account = e.Account, SocialMediaLoginConstants.AppName);

                    Application.Current.Properties.Remove("Id");
                    Application.Current.Properties.Remove("FirstName");
                    Application.Current.Properties.Remove("LastName");
                    Application.Current.Properties.Remove("DisplayName");
                    Application.Current.Properties.Remove("EmailAddress");
                    Application.Current.Properties.Remove("ProfilePicture");

                    Application.Current.Properties.Add("Id", facebookEmail.Id);
                    Application.Current.Properties.Add("FirstName", facebookEmail.First_Name);
                    Application.Current.Properties.Add("LastName", facebookEmail.Last_Name);
                    Application.Current.Properties.Add("DisplayName", facebookEmail.Name);
                    Application.Current.Properties.Add("EmailAddress", facebookEmail.Email);
                    Application.Current.Properties.Add("ProfilePicture", facebookEmail.Picture.Data.Url);
                    
                    try {
                        var socialAccountJson = await client.GetStringAsync(socialUrl + facebookEmail.Email); // get the user's account from the social accounts table
                   
                        SocialAccountResponse socialAccountResponse = JsonConvert.DeserializeObject<SocialAccountResponse>(socialAccountJson);

                        if (socialAccountResponse.Result.Result.Length == 0) { // if the social account doesn't exist, navigate to social sign up page
                            Debug.WriteLine("no social account found");
                            string accessToken = e.Account.Properties["access_token"]; // access token retrieved from facebook
                            // facebook doesn't provide refresh token!
                            string socialMedia = "Facebook";
                            SocialMediaSignUpPage socialSignUpPage = new SocialMediaSignUpPage(facebookEmail.First_Name, facebookEmail.Last_Name, facebookEmail.Email, socialMedia, accessToken, ""); // declare new social sign up page with user's name, email, and tokens

                            await Navigation.PushAsync(socialSignUpPage);
                        }
                        else { // user's social account exists and login attempt is made
                            Debug.WriteLine("social account found, logging in");
                            LoginResponse socialLoginAttempt = await socialLogin(socialAccountResponse.Result.Result[0].UserUid);
                            captureLoginSession(socialLoginAttempt);
                            await Navigation.PopAsync(); // go back to home page

                        }
                    }
                    catch (Exception ex) {
                        System.Diagnostics.Debug.WriteLine(ex.Message);
                    }

                } else {
                    User user = null;

                    // If the user is authenticated, request their basic user data from Google
                    // UserInfoUrl https://www.googleapis.com/oauth2/v2/userinfo

                    var request = new OAuth2Request("GET", new Uri(SocialMediaLoginConstants.GoogleUserInfoUrl), null, e.Account); // create the request to get the user's google info
                    var response = await request.GetResponseAsync();
                    if(response != null) {
                        // Deserialize the data and store it in the account store
                        // The users email address will be used to identify data in SimpleDB
                        string userJson = await response.GetResponseTextAsync();
                        Debug.WriteLine("user json: " + userJson);
                        user = JsonConvert.DeserializeObject<User>(userJson);
                        
                    }

                    if(account != null) {
                        store.Delete(account, SocialMediaLoginConstants.AppName);
                    }

                    await store.SaveAsync(account = e.Account, SocialMediaLoginConstants.AppName);

                    Application.Current.Properties.Remove("Id");
                    Application.Current.Properties.Remove("FirstName");
                    Application.Current.Properties.Remove("LastName");
                    Application.Current.Properties.Remove("DisplayName");
                    Application.Current.Properties.Remove("EmailAddress");
                    Application.Current.Properties.Remove("ProfilePicture");

                    Application.Current.Properties.Add("Id", user.Id);
                    Application.Current.Properties.Add("FirstName", user.GivenName);
                    Application.Current.Properties.Add("LastName", user.FamilyName);
                    Application.Current.Properties.Add("DisplayName", user.Name);
                    Application.Current.Properties.Add("EmailAddress", user.Email);
                    Application.Current.Properties.Add("ProfilePicture", user.Picture);
                    try {
                        var socialAccountJson = await client.GetStringAsync(socialUrl + user.Email); // get the user's account from the social accounts table

                        SocialAccountResponse socialAccountResponse = JsonConvert.DeserializeObject<SocialAccountResponse>(socialAccountJson);

                        if (socialAccountResponse.Result.Result.Length == 0) { // if the social account doesn't exist, navigate to social sign up page
                            string accessToken = e.Account.Properties["access_token"]; // access token retrieved from google 
                            string refreshToken = e.Account.Properties["refresh_token"]; // refresh token retrieved from google 
                            string socialMedia = "Google";
                            SocialMediaSignUpPage socialSignUpPage = new SocialMediaSignUpPage(user.GivenName, user.FamilyName, user.Email, socialMedia, accessToken, refreshToken); // declare new social sign up page, maybe bind to certain info???

                            await Navigation.PushAsync(socialSignUpPage);
                        }
                        else { // user's social account exists and login attempt is made
                            LoginResponse socialLoginAttempt = await socialLogin(socialAccountResponse.Result.Result[0].UserUid);
                            captureLoginSession(socialLoginAttempt);
                            await Navigation.PopAsync(); // go back to home page

                        }
                    } catch(Exception ex) {
                        System.Diagnostics.Debug.WriteLine(ex.Message);
                    }

                    //await Navigation.PopAsync();
                }
            }
        }

        // function when authenticator gives an error
        [Obsolete]
        void OnAuthError(object sender, AuthenticatorErrorEventArgs e) {
            var authenticator = sender as OAuth2Authenticator;
            if(authenticator != null) {
                authenticator.Completed -= OnAuthCompleted;
                authenticator.Error -= OnAuthError;
            }

            Debug.WriteLine("Authentication Error " + e.Message);
        }

    }
}