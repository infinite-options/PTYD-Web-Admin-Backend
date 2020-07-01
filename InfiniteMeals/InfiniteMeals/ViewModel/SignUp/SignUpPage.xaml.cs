using System;
using System.Collections.Generic;
using System.Linq;
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
        
        private async void ClickedSignIn(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignIn.SignIn());
        } 
    }
}