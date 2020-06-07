using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Delivery : ContentPage {
        
        public Delivery() {
            InitializeComponent();
        }

        // clicked continue button event handler
        private async void ContinueToPaymentClicked(object sender, EventArgs e) {
            if (String.IsNullOrEmpty(this.firstNameEntry.Text) || String.IsNullOrEmpty(this.lastNameEntry.Text) || String.IsNullOrEmpty(this.addressOneEntry.Text) || String.IsNullOrEmpty(this.zipCodeEntry.Text) ||
               String.IsNullOrEmpty(this.cityEntry.Text) || String.IsNullOrEmpty(this.stateEntry.Text)) { // checks that all fields are filled out
                await DisplayAlert("Error: Empty Field(s)", "Please fill all fields", "OK");
            }
            else if (this.firstPhoneNumberEntry.Text.Length < 3 || this.middlePhoneNumberEntry.Text.Length < 3 || this.lastPhoneNumberEntry.Text.Length < 4) { // checks if the phone number is valid (10 digits)
                await DisplayAlert("Error: Invalid Phone Number", "Please enter a valid phone number", "OK");
            }
            else if (this.zipCodeEntry.Text.Length < 5) { // checks if the zip code is valid (5 digits)
                await DisplayAlert("Error: Invalid Zip Code", "Please enter a valid zip code", "OK");
            }
            else if (this.stateEntry.Text.Length != 2) { // checks if the state is valid (2 characters)
                await DisplayAlert("Error: Invalid State", "Please enter a valid state", "OK");
            }
            else { // go to payment page if all fields are valid
                ShippingInformation shipInfo = new ShippingInformation {
                    firstName = this.firstNameEntry.Text,
                    lastName = this.lastNameEntry.Text,
                    phoneNumber = this.firstPhoneNumberEntry.Text + this.middlePhoneNumberEntry.Text + this.lastPhoneNumberEntry.Text,
                    addressOne = this.addressOneEntry.Text,
                    addressTwo = this.addressTwoEntry.Text,
                    zipCode = this.zipCodeEntry.Text,
                    city = this.cityEntry.Text,
                    state = this.stateEntry.Text
                    
                };
                System.Diagnostics.Debug.WriteLine(shipInfo.firstName);
                System.Diagnostics.Debug.WriteLine(shipInfo.lastName);
                System.Diagnostics.Debug.WriteLine(shipInfo.phoneNumber);
                System.Diagnostics.Debug.WriteLine(shipInfo.addressOne);
                System.Diagnostics.Debug.WriteLine(shipInfo.addressTwo);
                System.Diagnostics.Debug.WriteLine(shipInfo.zipCode);
                System.Diagnostics.Debug.WriteLine(shipInfo.city);
                System.Diagnostics.Debug.WriteLine(shipInfo.state);
                var paymentPage = new Payment();
                paymentPage.BindingContext = shipInfo;
                
                await Navigation.PushAsync(paymentPage);
            }
        }

        // function to show warning if first name entry is empty
        private void firstNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry firstNameEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(firstNameEntry.Text)) {
                this.firstNameWarning.IsVisible = true; // show warning if first name entry is empty
            } else if(!String.IsNullOrEmpty(firstNameEntry.Text) && this.firstNameWarning.IsVisible == true) {
                this.firstNameWarning.IsVisible = false; // hide warning if first name entry is filled
            }
        }

        // function to show warning if last name entry is empty
        private void lastNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry lastNameEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(lastNameEntry.Text)) {
                this.lastNameWarning.IsVisible = true; // show warning if last name entry is empty
            }
            else if (!String.IsNullOrEmpty(lastNameEntry.Text) && this.lastNameWarning.IsVisible == true) {
                this.lastNameWarning.IsVisible = false; // hide warning if last name entry is filled
            }
        }

        // function to show warning if phone number entry is empty
        private void phoneNumberEntryUnfocused(object sender, FocusEventArgs e) {
            Entry phoneNumberEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(phoneNumberEntry.Text)) {
                this.phoneNumberWarning.IsVisible = true; // show warning if phone number entry is empty
            }
            else if (!String.IsNullOrEmpty(this.firstPhoneNumberEntry.Text) && !String.IsNullOrEmpty(this.middlePhoneNumberEntry.Text) 
                && !String.IsNullOrEmpty(this.lastPhoneNumberEntry.Text) && this.phoneNumberWarning.IsVisible == true)  {
                this.phoneNumberWarning.IsVisible = false; // hide warning if all entries are filled
            }
        }

        // function to show warning if address entry is empty
        private void addressEntryUnfocused(object sender, FocusEventArgs e) {
            Entry addressEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(addressEntry.Text)) {
                this.addressWarning.IsVisible = true; // show warning if address number entry is empty
            }
            else if (!String.IsNullOrEmpty(addressEntry.Text) && this.addressWarning.IsVisible == true) {
                this.addressWarning.IsVisible = false; // hide warning if address entry is filled
            }
        }

        // function to show warning if zip code entry is empty or invalid
        private void zipCodeEntryUnfocused(object sender, FocusEventArgs e) {
            Entry zipCodeEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(zipCodeEntry.Text)) {
                this.zipCodeWarning.IsVisible = true; // show warning if zip code entry is empty
            } else if(!String.IsNullOrEmpty(zipCodeEntry.Text) && zipCodeEntry.Text.Length < 5) {
                this.zipCodeWarning.Text = "Enter a valid zip code";
                this.zipCodeWarning.IsVisible = true;
            }
            else if (!String.IsNullOrEmpty(zipCodeEntry.Text) && zipCodeEntry.Text.Length == 5 &&  this.zipCodeWarning.IsVisible == true) {
                this.zipCodeWarning.IsVisible = false; // hide warning if zip code entry is filled
            }
        }

        // function to show warning if city entry is empty
        private void cityEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cityEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cityEntry.Text)) {
                this.cityWarning.IsVisible = true; // show warning if city entry is empty
            }
            else if (!String.IsNullOrEmpty(cityEntry.Text) && this.cityWarning.IsVisible == true) {
                this.cityWarning.IsVisible = false; // hide warning if city entry is empty
            }
        }

        // function to show warning if state entry is empty or invalid
        private void stateEntryUnfocused(object sender, FocusEventArgs e) {
            Entry stateEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(stateEntry.Text)) {
                this.stateWarning.IsVisible = true; // show warning if state entry is empty
            } else if(!String.IsNullOrEmpty(stateEntry.Text) && stateEntry.Text.Length < 2) {
                this.stateWarning.Text = "Enter a valid state";
                this.stateWarning.IsVisible = true;
            }   
            else if (!String.IsNullOrEmpty(stateEntry.Text) && stateEntry.Text.Length == 2 && this.stateWarning.IsVisible == true) {
                this.stateWarning.IsVisible = false; // hide warning if state entry is filled
            } 
        }

        // function to automatically go from first phone number entry to middle phone number entry when filled
        private void firstPhoneNumberEntryTextChanged(object sender, TextChangedEventArgs e) {
            Entry firstPhoneNumberEntry = (Entry)sender; // cast sender as entry
            if(!String.IsNullOrEmpty(firstPhoneNumberEntry.Text) && firstPhoneNumberEntry.Text.Length == 3) { 
                firstPhoneNumberEntry.Unfocus();
                this.middlePhoneNumberEntry.Focus(); 
            }
        }

        // function to automatically go from middle phone number entry to last phone number entry when filled
        private void middlePhoneNumberEntryTextChanged(object sender, TextChangedEventArgs e) {
            Entry middlePhoneNumberEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(middlePhoneNumberEntry.Text) && middlePhoneNumberEntry.Text.Length == 3) {
                middlePhoneNumberEntry.Unfocus();
                this.lastPhoneNumberEntry.Focus();
            }
        }
    }
}