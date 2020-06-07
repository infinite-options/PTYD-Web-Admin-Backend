using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Utilities.Converters;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Payment : ContentPage {
        public Payment() {
            InitializeComponent();

            
        }

        private async void ContinueToSummaryClicked(object sender, EventArgs e) {
            if(String.IsNullOrEmpty(this.cardNumberEntry.Text) || String.IsNullOrEmpty(this.cardholderNameEntry.Text)
                || String.IsNullOrEmpty(this.expirationDateEntry.Text) || String.IsNullOrEmpty(this.cvvEntry.Text)) {
                await DisplayAlert("Error: Empty Field(s)", "Please fill all fields", "OK");
            }
        }
        private void cardNumberEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cardNumberEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cardNumberEntry.Text)) {
                this.cardNumberMessage.IsVisible = true; // show warning if card number entry is empty
            } else if (!String.IsNullOrEmpty(cardNumberEntry.Text) && CardParser.validateCard(long.Parse(cardNumberEntry.Text)) == CardType.Unknown) {
                this.cardNumberMessage.Text = "Invalid Card Warning";
                this.cardNumberMessage.IsVisible = true; // show a warning if card number is invalid
            } else if (!String.IsNullOrEmpty(cardNumberEntry.Text) && CardParser.validateCard(long.Parse(cardNumberEntry.Text)) != CardType.Unknown
                && this.cardNumberMessage.IsVisible == true) {
                this.cardNumberMessage.Text = CardParser.validateCard(long.Parse(cardNumberEntry.Text)).ToString(); // show bank if card is valid
                this.cardNumberMessage.IsVisible = true;
            }
        }

        private void cardholderNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cardholderNameEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cardholderNameEntry.Text)) {
                this.cardholderNameWarning.IsVisible = true; // show warning if cardholder entry is empty
            }
            else if (!String.IsNullOrEmpty(cardholderNameEntry.Text) && this.cardholderNameWarning.IsVisible == true) {
                this.cardholderNameWarning.IsVisible = false; // hide warning if cardholder entry is filled
            }
        }

        private void expirationDateEntryUnfocused(object sender, FocusEventArgs e) {
            Entry expirationDateEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(expirationDateEntry.Text)) {
                this.expirationDateWarning.IsVisible = true; // show warning if expiration date entry is empty
            }
            else if (!String.IsNullOrEmpty(expirationDateEntry.Text) && this.expirationDateWarning.IsVisible == true) {
                this.expirationDateWarning.IsVisible = false; // hide warning if expiration date entry is filled
            }
        }

        private void cvvEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cvvEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cvvEntry.Text)) {
                this.cvvWarning.IsVisible = true; // show warning if cvv entry is empty
            } else if(!String.IsNullOrEmpty(cvvEntry.Text) && cvvEntry.Text.Length < 3) {
                this.cvvWarning.Text = "Please enter a valid CVV";
                this.cvvWarning.IsVisible = true;
            }
            else if (!String.IsNullOrEmpty(cvvEntry.Text) && cvvEntry.Text.Length == 3 && this.cvvWarning.IsVisible == true) {
                this.cvvWarning.IsVisible = false; // hide warning if cvv entry is filled
            }
        }
    }

}