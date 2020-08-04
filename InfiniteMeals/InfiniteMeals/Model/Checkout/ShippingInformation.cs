using System;
using System.Collections.Generic;
using System.Text;

using System.ComponentModel;
using InfiniteMeals.Model.Subscribe;

namespace InfiniteMeals.Model.Checkout {

    // contains information about user's order during shipping
    class ShippingInformation: INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public string firstName { get; set; } 
        public string lastName { get; set; }
        public string phoneNumber { get; set; }
        public string addressOne { get; set; }
        public string addressTwo { get; set; }
        public string zipCode { get; set; }
        public string city { get; set; }
        public string state { get; set; }

        public SubscriptionPlan subscriptionPlan { get; set; } // subscription plan contains info about meal plan and payment option

        // no args ctor
        public ShippingInformation() {
            this.firstName = "";
            this.lastName = "";
            this.phoneNumber = "";
            this.addressOne = "";
            this.addressTwo = "";
            this.zipCode = "";
            this.city = "";
            this.state = "";
            this.subscriptionPlan = new SubscriptionPlan();
        }

        public ShippingInformation(string firstName, string lastName, 
            string phoneNumber, string addressOne, string addressTwo, 
            string zipCode, string city, string state, SubscriptionPlan subscriptionPlan) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.phoneNumber = phoneNumber;
            this.addressOne = addressOne;
            this.addressTwo = addressTwo;
            this.zipCode = zipCode;
            this.city = city;
            this.state = state;
            this.subscriptionPlan = subscriptionPlan;
        }

        public override string ToString() {
            return this.firstName + "\n" + this.lastName + "\n" + this.phoneNumber + "\n" + this.addressOne + "\n" + 
                this.addressTwo + "\n" + this.zipCode + "\n" + this.city + "\n" + this.state;
        }
    }
}
