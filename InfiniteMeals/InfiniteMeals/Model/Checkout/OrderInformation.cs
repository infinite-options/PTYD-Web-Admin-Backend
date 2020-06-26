using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using InfiniteMeals.Model.Subscribe;

namespace InfiniteMeals.Model.Checkout {
    class OrderInformation: INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public ShippingInformation shippingInformation { get; set; } // contains first name, last name, phone number, address, zip code, city, and state

        public PaymentInformation paymentInformation { get; set; } // contains delivery instructions, card number, cardholder name, exp month, exp year, and cvv


        public OrderInformation() {
            this.shippingInformation = new ShippingInformation();
            this.paymentInformation = new PaymentInformation();
        }

        public OrderInformation(ShippingInformation shippingInformation, 
            PaymentInformation paymentInformation, SubscriptionPlan subscriptionPlan) {
            this.shippingInformation = shippingInformation;
            this.paymentInformation = paymentInformation;
        }
        public override string ToString() {
            return this.shippingInformation.ToString() + "\n" + this.paymentInformation.ToString();
        }

    }
}
