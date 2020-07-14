using InfiniteMeals.Model.Database;
using InfiniteMeals.Model.Login;
using InfiniteMeals.Model.SignUp;
using InfiniteMeals.Model.User;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.ViewModel.SignUp {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignUpPage : ContentPage {
        public Boolean termsOfServiceChecked = false;
        public Boolean weeklyUpdatesChecked = false;
        public HttpClient client = new HttpClient();
        public const string signUpApi = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/signup";
        const string accountSaltURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountsalt/"; // api to get account salt; need email at the end of link
        const string loginURL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/"; // api to log in; need email + hashed password at the end of link

        public SignUpPage() {
            
            InitializeComponent();

        }

        private async void ClickedSignUp(object sender, EventArgs e) {
            System.Diagnostics.Debug.WriteLine("begin check: " + (Navigation == null).ToString());
            System.Diagnostics.Debug.WriteLine("begin navigation count: " + Navigation.NavigationStack.Count);
            if (String.IsNullOrEmpty(this.firstNameEntry.Text) || String.IsNullOrEmpty(this.lastNameEntry.Text) || String.IsNullOrEmpty(this.emailEntry.Text) ||
                String.IsNullOrEmpty(this.confirmEmailEntry.Text) || String.IsNullOrEmpty(this.passwordEntry.Text) || String.IsNullOrEmpty(this.confirmPasswordEntry.Text) ||
                String.IsNullOrEmpty(this.phoneNumberEntry.Text)) { // fields are empty  
                await DisplayAlert("Error", "Please fill all fields", "OK");
                return;
            } else { 
                if(!validateEmail(this.emailEntry.Text) || !validateEmail(this.confirmEmailEntry.Text)) { // email isn't valid
                    await DisplayAlert("Error", "Please enter a valid email", "OK");
                    return;
                } else {
                    if(this.emailEntry.Text != this.confirmEmailEntry.Text) { // email and confirm email don't match
                        await DisplayAlert("Error", "Emails do not match", "OK");
                        return;
                    } else {
                        if(this.passwordEntry.Text != this.confirmPasswordEntry.Text) { // passwords don't match
                            await DisplayAlert("Error", "Passwords do not match", "OK");
                            return;
                        } else {
                            if (this.phoneNumberEntry.Text.Length < 10) { // phone number isn't valid 
                                await DisplayAlert("Error", "Please enter a valid phone number", "OK");
                            } else {
                                if (!termsOfServiceChecked) { // terms of service aren't checked

                                    await DisplayAlert("Error", "The Terms of Service must be accepted", "OK");
                                    return;
                                } else {
                                    var signUpAttempt = await signUp();

                                     if (signUpAttempt != null) { // successful sign up 
                                        if(signUpAttempt.Result == "Email address taken.") {
                                            await DisplayAlert("Error", "That email is already taken", "OK");
                                            return;
                                        }
                                        AccountSalt accountSalt = await retrieveAccountSalt(this.emailEntry.Text);
                                        System.Diagnostics.Debug.WriteLine("salt: " + accountSalt.result[0]);
                                        if(accountSalt != null && accountSalt.result.Count != 0) { 
                                        var loginAttempt = await login(this.emailEntry.Text, this.passwordEntry.Text, accountSalt);
                                            System.Diagnostics.Debug.WriteLine("logging in");
                                            if (loginAttempt != null && loginAttempt.Message != "Request failed, wrong password.") {
                                                System.Diagnostics.Debug.WriteLine("capturing login");
                                                captureLoginSession(loginAttempt);

                                             
                                            }
                                        } else {
                                            await DisplayAlert("Error", "There was an error logging in", "OK");
                                            return;
                                        }
                                   


                                     } else {
                                         await DisplayAlert("Error", "There was an error creating the account", "OK");
                                        return;
                                    } 
                                    
                                }
                            }
                        }
                    }
                }
            }
            //await Navigation.PopToRootAsync(); 
        }
        
        // validates an email 
        // returns true if the email is valid and false otherwise
        public Boolean validateEmail(string email) {
            try {
                MailAddress address = new MailAddress(email);
                return true;
            } catch(Exception e) {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return false;
            }
            
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
            if(weeklyUpdatesChecked) {
                weeklyUpdatesButton.Source = "checkboxSelected"; // change image to selected if checked
            } else {
                weeklyUpdatesButton.Source = "checkboxUnselected"; // change image to unselected if checked
            }

        }

        // handler for first name entry 
        private void firstNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry firstNameEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(firstNameEntry.Text)) { // if first name entry is filled 
                this.firstNameWarning.IsVisible = false; // hide warning 
                if(!String.IsNullOrEmpty(lastNameEntry.Text)) {
                    this.lastNameWarning.IsVisible = false;
                }
            }
            else {
                this.firstNameWarning.IsVisible = true; // display warning if unfilled
            }
        }

        private void lastNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry lastNameEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(lastNameEntry.Text)) { // if last name entry is filled 
                this.lastNameWarning.IsVisible = false; // hide warning 
            }
            else {
                this.lastNameWarning.IsVisible = true; // display warning if unfilled
            }
        }

        private void emailEntryUnfocused(object sender, FocusEventArgs e) {
            Entry emailEntry = (Entry)sender;
            if(!String.IsNullOrEmpty(emailEntry.Text)) {
                if(validateEmail(emailEntry.Text)) {
                    this.emailWarning.IsVisible = false;
                    if(!String.IsNullOrEmpty(this.confirmEmailEntry.Text) && emailEntry.Text == this.confirmEmailEntry.Text) {
                        this.confirmEmailWarning.IsVisible = false;
                    } else {
                        this.confirmEmailWarning.Text = "Emails do not match";
                        this.confirmEmailWarning.IsVisible = true;
                    }
                } else {
                    this.emailWarning.Text = "Email is not valid";
                    this.emailWarning.IsVisible = true;
                }
            } else {
                this.emailWarning.IsVisible = true;
            }

        }

        private void confirmEmailEntryUnfocused(object sender, FocusEventArgs e) {
            Entry confirmEmailEntry = (Entry)sender;
            if(!String.IsNullOrEmpty(this.emailEntry.Text) || !String.IsNullOrEmpty(confirmEmailEntry.Text)) {
                if(this.emailEntry.Text == confirmEmailEntry.Text) {
                    this.confirmEmailWarning.IsVisible = false;
                } else {
                    this.confirmEmailWarning.IsVisible = true;
                }
            } else {
                this.confirmEmailWarning.IsVisible = true;
            }
        }

        private void passwordEntryUnfocused(object sender, FocusEventArgs e) {
            Entry passwordEntry = (Entry)sender;
            if(!String.IsNullOrEmpty(passwordEntry.Text)) {
                this.passwordWarning.IsVisible = false;
                if (!String.IsNullOrEmpty(this.confirmPasswordEntry.Text) && passwordEntry.Text != this.confirmPasswordEntry.Text) {
                    this.confirmPasswordWarning.Text = "Passwords do not match";
                    this.confirmPasswordWarning.IsVisible = true;
                }
            } else {
                this.passwordWarning.IsVisible = true;
            }
        }

        private void confirmPasswordEntryUnfocused(object sender, FocusEventArgs e) {
            Entry confirmPasswordEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(this.passwordEntry.Text) || !String.IsNullOrEmpty(confirmPasswordEntry.Text)) {
                if (this.passwordEntry.Text == confirmPasswordEntry.Text) {
                    this.confirmPasswordWarning.IsVisible = false;

                }
                else {
                    this.confirmPasswordWarning.IsVisible = true;
                }
            }
            else {
                this.confirmPasswordWarning.IsVisible = true;
            }
        }

        private void phoneNumberEntryUnfocused(object sender, FocusEventArgs e) {
            Entry phoneNumberEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(phoneNumberEntry.Text) && phoneNumberEntry.Text.Length == 10) { // if phone number entry is filled completely
                this.phoneNumberWarning.IsVisible = false; // hide warning 
            }
            else {
                this.phoneNumberWarning.IsVisible = true; // display warning if unfilled
            }
        }

        // signs the user up based on the information filled in the entries
        // returns a SignUpResponse if successful and null if unsuccessful
        private async Task<SignUpResponse> signUp() {
            SignUpPost signUpContent = new SignUpPost { // SignUpPost object to send to database 
                Email = this.emailEntry.Text,
                FirstName = this.firstNameEntry.Text,
                LastName = this.lastNameEntry.Text,
                PhoneNumber = this.phoneNumberEntry.Text,
                WeeklyUpdates = this.weeklyUpdatesChecked.ToString(),
                Referral = this.referralPicker.SelectedItem.ToString(),
                Password = this.passwordEntry.Text

            };

            string signUpContentJson = JsonConvert.SerializeObject(signUpContent); // convert to json 
            var httpContent = new StringContent(signUpContentJson, Encoding.UTF8, "application/json"); // convert to string content

            try {
                var response = await client.PostAsync(signUpApi, httpContent); // send to database
                
                if(response.Content != null) { // successful post 
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var signUpResponse = JsonConvert.DeserializeObject<SignUpResponse>(responseContent);
                    return signUpResponse; // return the response from the api
                }
                return null;
            } catch(Exception e) {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return null;
            }
            
        }

        // uses account salt api to retrieve the user's account salt
        // account salt is used to find the user's hashed password
        public async Task<AccountSalt> retrieveAccountSalt(string userEmail) {
            try {
                var content = await client.GetStringAsync(accountSaltURL + userEmail); // get the requested account salt
                var accountSalt = JsonConvert.DeserializeObject<AccountSalt>(content);
                return accountSalt;
            }
            catch (Exception ex) {
                System.Diagnostics.Debug.WriteLine(ex.Message);

            }
            return null;
        }

        // logs the user into the app 
        // returns a LoginResponse if successful and null if unsuccessful 
        public async Task<LoginResponse> login(string userEmail, string userPassword, AccountSalt accountSalt) {
            const string deviceBrowserType = "Mobile";
            var deviceIpAddress = Dns.GetHostAddresses(Dns.GetHostName()).FirstOrDefault();
            if (deviceIpAddress != null) {
                try {

                    LoginPost loginPostContent = new LoginPost() { // object that contains ip address and browser type; will be converted into a json object 
                        ipAddress = deviceIpAddress.ToString(),
                        browserType = deviceBrowserType
                    };

                    string loginPostContentJson = JsonConvert.SerializeObject(loginPostContent); // make orderContent into json

                    var httpContent = new StringContent(loginPostContentJson, Encoding.UTF8, "application/json"); // encode orderContentJson into format to send to database


                    SHA512 sHA512 = new SHA512Managed();
                    byte[] data = sHA512.ComputeHash(Encoding.UTF8.GetBytes(userPassword + accountSalt.result[0].passwordSalt)); // take the password and account salt to generate hash
                    string hashedPassword = BitConverter.ToString(data).Replace("-", string.Empty).ToLower(); // convert hash to hex


                    var response = await client.PostAsync(loginURL + userEmail + "/" + hashedPassword, httpContent); // try to post to database


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

        // captures a login session and sends it to the local database
        public async void captureLoginSession(LoginResponse loginResponse) {

            var userSessionInformation = new UserLoginSession { // object to send into local database
                UserUid = loginResponse.Result.Result[0].UserUid,
                FirstName = loginResponse.Result.Result[0].FirstName,
                SessionId = loginResponse.LoginAttemptLog.SessionId,
                LoginId = loginResponse.LoginAttemptLog.LoginId,
                Email = loginResponse.Result.Result[0].UserEmail
            };
            await App.Database.SaveItemAsync(userSessionInformation); // send login session to local database
            App.setLoggedIn(true); // update the login status for the app
            System.Diagnostics.Debug.WriteLine("change main page");
            MainPage mainPage = (MainPage)Navigation.NavigationStack[0];
            mainPage.updateLoginButton(); // update login button 
            await Navigation.PopToRootAsync();
            await DisplayAlert("Success", "Your account was created", "OK");
        }

        
    }
}