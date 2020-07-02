using System;


using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;
using InfiniteMeals.Utilities.Converters;
using InfiniteMeals.Model.Subscribe;


namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Payment : ContentPage {
        public Payment() {
            InitializeComponent();

            
        }

        private async void ContinueToSummaryClicked(object sender, EventArgs e) {
            if(String.IsNullOrEmpty(this.deliveryInstructionsEditor.Text) || String.IsNullOrEmpty(this.cardNumberEntry.Text) || String.IsNullOrEmpty(this.cardholderNameEntry.Text)
                || String.IsNullOrEmpty(this.expirationMonthEntry.Text) || 
                String.IsNullOrEmpty(this.expirationYearEntry.Text) || String.IsNullOrEmpty(this.cvvEntry.Text)) {
                await DisplayAlert("Error: Empty Field(s)", "Please fill all fields", "OK");
            } else {
                OrderInformation orderInfo = new OrderInformation {
                shippingInformation = (ShippingInformation)this.BindingContext,
                paymentInformation = new PaymentInformation(this.deliveryInstructionsEditor.Text, "XXXXXXXXXXXX" + this.cardNumberEntry.Text.Substring(cardNumberEntry.Text.Length - 4),
                    this.cardholderNameEntry.Text, this.expirationMonthEntry.Text, this.expirationYearEntry.Text, this.cvvEntry.Text)
                };

                Summary summaryPage = new Summary();
                summaryPage.BindingContext = orderInfo;
                ShippingInformation shippingInfo = (ShippingInformation)this.BindingContext;
                Label mealPlan = (Label)summaryPage.FindByName("mealPlan");
                Label paymentOption = (Label)summaryPage.FindByName("paymentOption");
                Label lastFourDigits = (Label)summaryPage.FindByName("lastFourDigits");
                Label totalCost = (Label)summaryPage.FindByName("totalCost");
                mealPlan.Text = MealPlanExtension.mealPlanToString(shippingInfo.subscriptionPlan.mealPlan);
                paymentOption.Text = PaymentOptionExtension.paymentOptionToString(shippingInfo.subscriptionPlan.paymentOption);
                lastFourDigits.Text = "XXXXXXXXXXXX" + this.cardNumberEntry.Text.Substring(cardNumberEntry.Text.Length - 4);
                totalCost.Text = "$" + (shippingInfo.subscriptionPlan.cost + 25.00).ToString();

                await Navigation.PushAsync(summaryPage);
            }
        }

        private void deliveryInstructionsEditorUnfocused(object sender, FocusEventArgs e) {
            Editor deliveryInstructionsEditor = (Editor)sender; // case sender as editor
            if (String.IsNullOrEmpty(deliveryInstructionsEditor.Text)) {
                this.deliveryInstructionsWarning.IsVisible = true; // show warning if delivery instructions is empty
            } else if(!String.IsNullOrEmpty(deliveryInstructionsEditor.Text) && this.deliveryInstructionsWarning.IsVisible) {
                this.deliveryInstructionsWarning.IsVisible = false; //
            }
        }
        private void cardNumberEntryUnfocused(object sender, FocusEventArgs e) {
            Entry cardNumberEntry = (Entry)sender; // cast sender as entry
            if (String.IsNullOrEmpty(cardNumberEntry.Text)) {
                this.cardNumberMessage.IsVisible = true; // show warning if card number entry is empty
            } else if (!String.IsNullOrEmpty(cardNumberEntry.Text)) {
                if(CardParser.validateCard(long.Parse(cardNumberEntry.Text)) == CardType.Unknown) {
                    if(!this.cardNumberMessage.IsVisible) {
                        this.cardNumberMessage.Text = "Invalid card";
                        this.cardNumberMessage.IsVisible = true;
                    }
                } else {
                    this.cardNumberMessage.Text = CardParser.validateCard(long.Parse(cardNumberEntry.Text)).ToString();
                    this.cardNumberMessage.IsVisible = true;
                }
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
            } else if(!String.IsNullOrEmpty(expirationDateEntry.Text) && expirationDateEntry.Text.Length < 2) {
                this.expirationDateWarning.Text = "Enter a valid date";
                this.expirationDateWarning.IsVisible = true;
            }
            else if (!(String.IsNullOrEmpty(this.expirationMonthEntry.Text)) && !(String.IsNullOrEmpty(this.expirationYearEntry.Text))
                && this.expirationMonthEntry.Text.Length == 2 && this.expirationYearEntry.Text.Length == 2 && this.expirationDateWarning.IsVisible == true) {
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