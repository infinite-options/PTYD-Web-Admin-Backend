using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using InfiniteMeals.Model.Subscribe;

namespace InfiniteMeals.Model.Checkout {
    class OrderInformation: INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public ShippingInformation shippingInformation { get; set; }

        public PaymentInformation paymentInformation { get; set; }


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
