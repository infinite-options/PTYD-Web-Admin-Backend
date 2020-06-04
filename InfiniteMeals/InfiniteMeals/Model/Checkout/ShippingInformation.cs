using System;
using System.Collections.Generic;
using System.Text;

using System.ComponentModel;

namespace InfiniteMeals.Model.Checkout {
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

        public ShippingInformation() {
            this.firstName = "";
            this.lastName = "";
            this.phoneNumber = "";
            this.addressOne = "";
            this.addressTwo = "";
            this.zipCode = "";
            this.city = "";
            this.state = "";
        }

        public ShippingInformation(string firstName, string lastName, 
            string phoneNumber, string addressOne, string addressTwo, string zipCode, string city, string state) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.phoneNumber = phoneNumber;
            this.addressOne = addressOne;
            this.addressTwo = addressTwo;
            this.zipCode = zipCode;
            this.city = city;
            this.state = state;
        }
    }
}
