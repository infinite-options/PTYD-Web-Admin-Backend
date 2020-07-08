using System;


using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Utilities.Converters;
using InfiniteMeals.Model.Subscribe;


namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]

    // second step in checkout process
    // prompts user to fill out delivery instructions and payment info
    public partial class PaymentPage : ContentPage {
        public PaymentPage() {
            InitializeComponent();

            
        }

        // event handler for clicking continue to summary button
        private async void ContinueToSummaryClicked(object sender, EventArgs e) {
            if(String.IsNullOrEmpty(this.deliveryInstructionsEditor.Text) || String.IsNullOrEmpty(this.cardNumberEntry.Text) || String.IsNullOrEmpty(this.cardholderNameEntry.Text)
                || String.IsNullOrEmpty(this.expirationMonthEntry.Text) || 
                String.IsNullOrEmpty(this.expirationYearEntry.Text) || String.IsNullOrEmpty(this.cvvEntry.Text)) { // checks if all fields have been filled out
                await DisplayAlert("Error: Empty Field(s)", "Please fill all fields", "OK");
            } else if(this.cardNumberMessage.Text == "Invalid") {
                await DisplayAlert("Error: Invalid Card", "Please enter a valid card", "OK");
            } else {
                OrderInformation orderInfo = new OrderInformation { // create order info that contains shipping and payment info
                shippingInformation = (ShippingInformation)this.BindingContext,
                paymentInformation = new PaymentInformation(this.deliveryInstructionsEditor.Text, this.cardNumberEntry.Text,
                    this.cardholderNameEntry.Text, this.expirationMonthEntry.Text, this.expirationYearEntry.Text, this.cvvEntry.Text)
                };

                SummaryPage summaryPage = new SummaryPage();
                summaryPage.BindingContext = orderInfo;
                ShippingInformation shippingInfo = (ShippingInformation)this.BindingContext;
                Label mealPlan = (Label)summaryPage.FindByName("mealPlan");
                Label paymentOption = (Label)summaryPage.FindByName("paymentOption");
                Label lastFourDigits = (Label)summaryPage.FindByName("lastFourDigits");
                Label totalCost = (Label)summaryPage.FindByName("totalCost");
                mealPlan.Text = MealPlanExtension.mealPlanToString(shippingInfo.subscriptionPlan.mealPlan);
                paymentOption.Text = PaymentOptionExtension.paymentOptionToString(shippingInfo.subscriptionPlan.paymentOption);
                lastFourDigits.Text = "XXXXXXXXXXXX" + this.cardNumberEntry.Text.Substring(cardNumberEntry.Text.Length - 4);
                totalCost.Text = "$" + String.Format("{0:0.00}",(shippingInfo.subscriptionPlan.cost + 25.00).ToString()); // set total cost text

                await Navigation.PushAsync(summaryPage);
            }
        }

        // checks if the delivery instructions was filled out
        private void deliveryInstructionsEditorUnfocused(object sender, FocusEventArgs e) {
            Editor deliveryInstructionsEditor = (Editor)sender; // case sender as editor
            if (String.IsNullOrEmpty(deliveryInstructionsEditor.Text)) {
                this.deliveryInstructionsWarning.IsVisible = true; // show warning if delivery instructions is empty
            } else if(!String.IsNullOrEmpty(deliveryInstructionsEditor.Text) && this.deliveryInstructionsWarning.IsVisible) {
                this.deliveryInstructionsWarning.IsVisible = false; 
            }
        }

        // checks if card number entry was filled out and if card is valid
        private void cardNumberEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cardNumberEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cardNumberEntry.Text)) {
                this.cardNumberMessage.IsVisible = true; // show warning if card number entry is empty
            } else if (!String.IsNullOrEmpty(cardNumberEntry.Text)) { // card number entry not empty 
                this.cardNumberMessage.Text = CardParser.validateCard(long.Parse(cardNumberEntry.Text)).ToString(); // show what kind of card it is
                this.cardNumberMessage.IsVisible = true;
            }
        }

        // checks if cardholder name entry was filled 
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
            if (String.IsNullOrEmpty(expirationMonthEntry.Text) || String.IsNullOrEmpty(expirationYearEntry.Text)) {
                this.expirationDateWarning.IsVisible = true; // show warning if expiration date entry is empty
            } else if(!String.IsNullOrEmpty(expirationMonthEntry.Text) && !String.IsNullOrEmpty(expirationYearEntry.Text) && expirationMonthEntry.Text.Length < 2 && expirationYearEntry.Text.Length < 4) {
                this.expirationDateWarning.Text = "Enter a valid date";
                this.expirationDateWarning.IsVisible = true;
            }
            else if (!(String.IsNullOrEmpty(this.expirationMonthEntry.Text)) && !(String.IsNullOrEmpty(this.expirationYearEntry.Text))
                && this.expirationMonthEntry.Text.Length == 2 && this.expirationYearEntry.Text.Length == 4 && this.expirationDateWarning.IsVisible == true) {
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

        // function to automatically go from expiration month to expiration year when filled
        private void expirationMonthEntryTextChanged(object sender, TextChangedEventArgs e) {
            Entry expirationMonthEntry = (Entry)sender;
            if(!String.IsNullOrEmpty(expirationMonthEntry.Text) && expirationMonthEntry.Text.Length == 2) {
                this.expirationYearEntry.Focus();
            }
        }
    }

}