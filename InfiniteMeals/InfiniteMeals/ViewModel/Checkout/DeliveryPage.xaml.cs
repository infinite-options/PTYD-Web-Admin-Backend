using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin.Forms.Maps;
using Xamarin.Essentials;

using System.Net;
using InfiniteMeals.Model.Subscribe;
using InfiniteMeals.Model.Checkout;
using Newtonsoft.Json;
using InfiniteMeals.Model.Database;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]

    // first step in checkout process
    // prompts user to enter delivery information
    public partial class DeliveryPage : ContentPage {
        private string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/";
        private static string userID;

        public DeliveryPage() {
            InitializeComponent();
            preloadDeliveryInfo();
        }

        // Preloads Existing Entries to Text Fields
        private void preloadDeliveryInfo()
        {
            WebClient client = new WebClient();
            // Get user zipcodes
            var table = App.Database.GetLastItem();
            userID = table.UserUid;
            var userInfo = client.DownloadString(acctUrl + userID);
            var userInfoObj = JsonConvert.DeserializeObject<UserInformation>(userInfo);

            this.firstNameEntry.Text = userInfoObj.Result[0].DeliveryFirstName;
            this.lastNameEntry.Text = userInfoObj.Result[0].DeliveryLastName;
            // Phone
            string entirePhone = (string) userInfoObj.Result[0].DeliveryPhone.ToString();
            this.firstPhoneNumberEntry.Text = entirePhone.Substring(0, 3);
            this.middlePhoneNumberEntry.Text = entirePhone.Substring(3, 5);
            this.lastPhoneNumberEntry.Text = entirePhone.Substring(6);
            this.addressOneEntry.Text = userInfoObj.Result[0].DeliveryAddress;
            this.zipCodeEntry.Text = userInfoObj.Result[0].DeliveryZip.ToString();
            this.cityEntry.Text = userInfoObj.Result[0].DeliveryCity;
            this.stateEntry.Text = userInfoObj.Result[0].DeliveryState;

            if (String.IsNullOrEmpty(firstNameEntry.Text))
            {
                this.firstNameWarning.IsVisible = true; // show warning if first name entry is empty
            }
            if (String.IsNullOrEmpty(lastNameEntry.Text))
            {
                this.lastNameWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(firstPhoneNumberEntry.Text))
            {
                this.phoneNumberWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(middlePhoneNumberEntry.Text))
            {
                this.phoneNumberWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(lastPhoneNumberEntry.Text))
            {
                this.phoneNumberWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(addressOneEntry.Text))
            {
                this.addressWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(zipCodeEntry.Text))
            {
                this.zipCodeWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(cityEntry.Text))
            {
                this.cityWarning.IsVisible = true; // show warning if last name entry is empty
            }
            if (String.IsNullOrEmpty(stateEntry.Text))
            {
                this.stateWarning.IsVisible = true; // show warning if last name entry is empty
            }
        }


        // clicked continue button event handler
        private async void ContinueToPaymentClicked(object sender, EventArgs e) {

            if(firstNameWarning.IsVisible.Equals(true) || lastNameWarning.IsVisible.Equals(true) ||
                phoneNumberWarning.IsVisible.Equals(true) || addressWarning.IsVisible.Equals(true) ||
                zipCodeWarning.IsVisible.Equals(true) || cityWarning.IsVisible.Equals(true) ||
                stateWarning.IsVisible.Equals(true))
            {
                await DisplayAlert("Error: Empty Field(s)", "Please fill all fields", "OK");
            }

            else if (String.IsNullOrEmpty(this.firstNameEntry.Text) || String.IsNullOrEmpty(this.lastNameEntry.Text) || String.IsNullOrEmpty(this.addressOneEntry.Text) || String.IsNullOrEmpty(this.zipCodeEntry.Text) ||
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

                // send user's entered info to usps to validate
                try {

                    XDocument requestDoc = new XDocument(new XElement("AddressValidateRequest", new XAttribute("USERID", "400INFIN1745"), new XElement("Revision", "1"), new XElement("Address", new XAttribute("ID", "0"), new XElement("Address1", addressOneEntry.Text + " " + addressTwoEntry.Text), new XElement("Address2", ""), new XElement("City", cityEntry.Text),
                        new XElement("State", stateEntry.Text), new XElement("Zip5", zipCodeEntry.Text), new XElement("Zip4", ""))));

                    var url = "http://production.shippingapis.com/ShippingAPI.dll?API=Verify&XML=" + requestDoc;
                    Console.WriteLine(url);
                    var client = new WebClient();
                    var response = client.DownloadString(url);

                    var xdoc = XDocument.Parse(response.ToString());
                    System.Diagnostics.Debug.WriteLine(xdoc.ToString());
                    foreach (XElement element in xdoc.Descendants("Address")) {
                        if (GetXMLElement(element, "Error").Equals("")) {
                            if (GetXMLElement(element, "DPVConfirmation").Equals("Y")) // Best case
                            {
                                // Get longitude and latitide because we can make a deliver here. Move on to next page.
                                // Console.WriteLine("The address you entered is valid and deliverable by USPS. We are going to get its latitude & longitude");
                                //getAddressLatitudeLongitude(GetXMLElement(element, "Address2").ToString());
                                ShippingInformation shipInfo = new ShippingInformation {
                                    firstName = this.firstNameEntry.Text,
                                    lastName = this.lastNameEntry.Text,
                                    phoneNumber = this.firstPhoneNumberEntry.Text + this.middlePhoneNumberEntry.Text + this.lastPhoneNumberEntry.Text,
                                    addressOne = GetXMLElement(element, "Address2").ToString(),
                                    addressTwo = this.addressTwoEntry.Text,
                                    zipCode = GetXMLElement(element, "Zip5").ToString(),
                                    city = GetXMLElement(element, "City").ToString(),
                                    state = GetXMLElement(element, "State").ToString(),
                                    subscriptionPlan = (SubscriptionPlan)this.BindingContext

                                };

                                var paymentPage = new PaymentPage(); 
                                paymentPage.BindingContext = shipInfo; // bind the payment page with shipping info

                                await Navigation.PushAsync(paymentPage);
                            }
                            else if (GetXMLElement(element, "DPVConfirmation").Equals("D")) {
                                addressIsMissingInformation();
                            }
                            else {
                                addressNotValid();
                            }


                        }
                        else {   // USPS sents an error saying address not found in there records. In other words, this address is not valid because it does not exits.
                            Console.WriteLine("Error: The address you entered was not found");
                            addressNotFound();
                        }

                    }

                } catch (WebException exception) { // handles webexception 
                    await DisplayAlert("Error", exception.Message, "OK");
                }

            } 
        }

        // function to show warning if first name entry is empty
        private void firstNameEntryUnfocused(object sender, FocusEventArgs e) {
            Entry firstNameEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(firstNameEntry.Text)) {
                this.firstNameWarning.IsVisible = true; // show warning if first name entry is empty
            }
            else if (!String.IsNullOrEmpty(firstNameEntry.Text) && this.firstNameWarning.IsVisible == true) {
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
                && !String.IsNullOrEmpty(this.lastPhoneNumberEntry.Text) && this.phoneNumberWarning.IsVisible == true) {
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
            }
            else if (!String.IsNullOrEmpty(zipCodeEntry.Text) && zipCodeEntry.Text.Length < 5) {
                this.zipCodeWarning.Text = "Enter a valid zip code";
                this.zipCodeWarning.IsVisible = true;
            }
            else if (!String.IsNullOrEmpty(zipCodeEntry.Text) && zipCodeEntry.Text.Length == 5 && this.zipCodeWarning.IsVisible == true) {
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
            }
            else if (!String.IsNullOrEmpty(stateEntry.Text) && stateEntry.Text.Length < 2) {
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
            if (!String.IsNullOrEmpty(firstPhoneNumberEntry.Text) && firstPhoneNumberEntry.Text.Length == 3) {
                this.middlePhoneNumberEntry.Focus();
            }
        }

        // function to automatically go from middle phone number entry to last phone number entry when filled
        private void middlePhoneNumberEntryTextChanged(object sender, TextChangedEventArgs e) {
            Entry middlePhoneNumberEntry = (Entry)sender;
            if (!String.IsNullOrEmpty(middlePhoneNumberEntry.Text) && middlePhoneNumberEntry.Text.Length == 3) {
                this.lastPhoneNumberEntry.Focus();
            }

        }

        public static string GetXMLElement(XElement element, string name) {
            var el = element.Element(name);
            if (el != null) { return el.Value; }
            return "";
        }
        public static string GetXMLAttribute(XElement element, string name) {
            var el = element.Attribute(name);
            if (el != null) {
                return el.Value;
            }
            return "";
        }

        private async void getAddressLatitudeLongitude(string address) {
            Geocoder geoCoder = new Geocoder();
            Console.WriteLine(address);
            IEnumerable<Position> approximateLocations = await geoCoder.GetPositionsForAddressAsync(address);
            Position position = approximateLocations.FirstOrDefault();
            string coordinates = $"{position.Latitude}, {position.Longitude}";
            Console.WriteLine(coordinates);
            //await DisplayAlert("Coordinates", coordinates, "OK");


        }
        private async void addressNotValid() {
            await DisplayAlert("Alert!", "Error: Address is not valid.", "Ok");
        }

        private async void addressIsMissingInformation() {
            await DisplayAlert("Alert!", "Error: Address is missing information like 'Apartment number'.", "Ok");
        }

        private async void addressNotFound() {
            await DisplayAlert("Alert!", "Error:  The address you entered was not found.", "Ok");
        }

    }
}