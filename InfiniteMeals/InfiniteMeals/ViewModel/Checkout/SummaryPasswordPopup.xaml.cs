using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Rg.Plugins.Popup.Services;
using InfiniteMeals.ViewModel.Checkout;
using System.Net;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SummaryPasswordPopup {
        public SummaryPasswordPopup() {
            InitializeComponent();
        }

        private async void CancelClicked(object sender, EventArgs e) {
            await Navigation.PopAsync();
        }

        private async void ConfirmClicked(object sender, EventArgs e) {
            SummaryPage summaryPage = (SummaryPage)this.BindingContext;
            Entry confirmPasswordEntry = (Entry)this.passwordEntry;

            if (!String.IsNullOrEmpty(confirmPasswordEntry.Text)) {
                summaryPage.password = confirmPasswordEntry.Text;
                System.Diagnostics.Debug.WriteLine("password entered");
                if (await summaryPage.checkout() == HttpStatusCode.BadRequest) { // problem with api call
                    await Navigation.PopAsync();
                    await DisplayAlert("Error", "Purchase was not able to be completed", "OK");
                }
                else { // successful checkout, take user to home page
                    System.Diagnostics.Debug.WriteLine("successful checkout");
                    await Navigation.PopToRootAsync();
                    await DisplayAlert("Payment Confirmed", "Go to menu to select your meals!", "OK"); // display a confirmation

                }
            } 




        }
    }
}