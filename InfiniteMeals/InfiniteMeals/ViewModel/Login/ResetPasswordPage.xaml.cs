using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using InfiniteMeals.ViewModel.Profile;
using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.ViewModel.Login {
    [XamlCompilation(XamlCompilationOptions.Compile)]

    // page that handles when user wants to reset password
    public partial class ResetPasswordPage : ContentPage {

        const string changePasswordApi = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/resetpassword?email="; // api to change password; email required at end
        HttpClient client = new HttpClient(); // client to handle requests
        
        public ResetPasswordPage() {
            InitializeComponent();
        }

        // handles when the submit button is clicked
        private async void SubmitClicked(object sender, EventArgs e) {
            if(!String.IsNullOrEmpty(this.email.Text)) { // makes sure that the field is filled
                var response = await client.GetStringAsync(changePasswordApi + this.email.Text);
                ResetPasswordResult result = JsonConvert.DeserializeObject<ResetPasswordResult>(response);
                if(result.Message == "Invalid Email Address") { // email is not in database or has invalid format
                    await DisplayAlert("Error", "The email you entered is invalid", "OK");
                } else { // success, temporary password sent
                    await DisplayAlert("Success", "Please check your email for a temporary password", "OK");
                    await Navigation.PopAsync();
                    await Navigation.PopAsync(); // navigate back to home page
                }
            } else {
                await DisplayAlert("Error", "Please fill in the field", "OK");
            }
        }

    }

    // json format to receive result of reset password api 
    public class ResetPasswordResult { 
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public Result Result { get; set; }
    }

    public class Result {
        [JsonProperty("user_uid")]
        public string UserUid { get; set; }
    }
}