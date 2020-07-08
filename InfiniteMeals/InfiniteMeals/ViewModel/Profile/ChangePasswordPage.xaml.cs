using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Profile;
using InfiniteMeals.Model.Database;
using System.Net.Http;

namespace InfiniteMeals.ViewModel.Profile {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ChangePasswordPage : ContentPage {

        public HttpClient client = new HttpClient(); // client to handle api requests
        public const string changePasswordApi = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/changepassword"; // api to change password 
        public ChangePasswordPage() {
            InitializeComponent();
        }

        // handles when the confirm changes button is clicked
        private async void ConfirmChangesClicked(object sender, EventArgs e) {
            if(!String.IsNullOrEmpty(this.oldPassword.Text) && !String.IsNullOrEmpty(this.newPassword.Text) && !String.IsNullOrEmpty(this.confirmNewPassword.Text) &&
                this.newPassword.Text == this.confirmNewPassword.Text) { // checks that all fields are filled out and that the new passwords match
                StringContent changePasswordHTTPContent = generateHTTPContent();
                var statusCode = await changePassword(changePasswordHTTPContent);
                if(statusCode == HttpStatusCode.OK) { // change password successful
                    await Navigation.PopAsync();
                    await DisplayAlert("Success", "Your password was changed", "OK");
                } else {
                    await DisplayAlert("Error", "Your password wasn't able to be changed", "OK");
                }
            } else if(!String.IsNullOrEmpty(this.newPassword.Text) && !String.IsNullOrEmpty(this.confirmNewPassword.Text) && this.newPassword.Text != this.confirmNewPassword.Text) { // checks that new passwords match
                await DisplayAlert("Error", "The new passwords don't match", "OK");
            } else { 
                await DisplayAlert("Error", "Please fill out all fields", "OK");
            }
        }

        // posts to the change password api
        // returns HttpStatusCode.OK if successful
        private async Task<HttpStatusCode> changePassword(StringContent httpContent) {
            var response = await client.PostAsync(changePasswordApi, httpContent); // attempt to post to the api
            return response.StatusCode;
        }

        // generates the string content to post to the change password api
        private StringContent generateHTTPContent() {
            UserLoginSession currentUserInfo = (UserLoginSession)this.BindingContext;
            var changePasswordItem = new ChangePasswordItem { // generate the change password item
                ID = currentUserInfo.UserUid,
                oldPassword = this.oldPassword.Text,
                newPassword = this.newPassword.Text
            };
            var changePasswordJson = JsonConvert.SerializeObject(changePasswordItem);
            var httpContent = new StringContent(changePasswordJson, Encoding.UTF8, "application/json");
            return httpContent;

        }
    }
}