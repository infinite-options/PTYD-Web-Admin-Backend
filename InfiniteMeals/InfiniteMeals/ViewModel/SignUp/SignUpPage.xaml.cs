using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.ViewModel.SignUp {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignUpPage : ContentPage {
        public SignUpPage() {
            
            InitializeComponent();
        }

        private async void ClickedSignUp(object sender, EventArgs e) {
            
            await Navigation.PushAsync(new MainPage());
        }
        
        public Boolean validateEmail(string email) {
            try {
                MailAddress address = new MailAddress(email);
                return true;
            } catch(Exception e) {
                System.Diagnostics.Debug.WriteLine(e.Message);
                return false;
            }
            
        }
    }
}