using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.Meals;
using Amazon.Runtime.Internal.Util;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Summary : ContentPage {
        public Summary() {
            
            InitializeComponent();

 
        }

        private async void ConfirmClicked(object sender, EventArgs e) {
            MainPage mainPage = new MainPage();
            NavigationPage.SetHasBackButton(mainPage, false);
            await Navigation.PushAsync(mainPage);
            await DisplayAlert("Payment Confirmed", "Go to menu to select your meals!", "OK");
        }
    }
}