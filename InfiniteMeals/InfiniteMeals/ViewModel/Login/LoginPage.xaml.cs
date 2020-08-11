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

namespace InfiniteMeals.ViewModel.Login
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end of link
        const string loginURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/"; // api to log in; need email + hashed password at the end of link
        public HttpClient client = new HttpClient(); // client to handle all api calls
        public LoginPage()
        {
            InitializeComponent();
            InterfaceFormat();
            versionNumber.Text = "Version: " + VersionTracking.CurrentVersion;
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


                    var response = await client.PostAsync(loginURL + userEmail + "/" + hashedPassword, httpContent); // try to post to database


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

        // uses account salt api to retrieve the user's account salt
        // account salt is used to find the user's hashed password
        public async Task<AccountSalt> retrieveAccountSalt(string userEmail)
        {
            try
            {
                var content = await client.GetStringAsync(accountSaltURL + userEmail); // get the requested account salt
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
            App.setLoggedIn(true);
            MainPage mainPage = (MainPage)Navigation.NavigationStack[0];
            mainPage.updateLoginButton();
        }

    }
}