using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using InfiniteMeals.Model.Subscribe;


namespace InfiniteMeals.Model.Checkout {

    // contains information about user's payment during checkout
    class PaymentInformation : INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public string deliveryInstructions { get; set; }
        public string cardNumber { get; set; }
        public string cardHolderName { get; set; }
        public string expirationMonth { get; set; }
        public string expirationYear { get; set; }
        public string cvv { get; set; }

        // no args ctor
        public PaymentInformation() {
            this.deliveryInstructions = "";
            this.cardNumber = "";
            this.cardHolderName = "";
            this.expirationMonth = "";
            this.expirationYear = "";
            this.cvv = "";
        }

        public PaymentInformation(string deliveryInstructions, string cardNumber, string cardHolderName, 
            string expirationMonth, string expirationYear, string cvv) {
            this.deliveryInstructions = deliveryInstructions;
            this.cardNumber = cardNumber;
            this.cardHolderName = cardHolderName;
            this.expirationMonth = expirationMonth;
            this.expirationYear = expirationYear;
            this.cvv = cvv;
        }

        public override string ToString() {
            return this.deliveryInstructions + "\n" + this.cardNumber + "\n" + this.cardHolderName + "\n" + 
                this.expirationMonth + "\n" + this.expirationYear + "\n" + this.cvv;
        }

    }
}
