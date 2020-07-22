using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Model.Subscribe {

    // enum to store values of payment options
    public enum PaymentOption {
        Week,
        TwoWeek,
        FourWeek,
        Unknown
    }

    // contains a method to parse a payment option to a string
    static class PaymentOptionExtension {
        public static string paymentOptionToString(PaymentOption paymentOption) {
            switch (paymentOption) {
                case PaymentOption.Week:
                    return "Weekly Subscription";
                case PaymentOption.TwoWeek:
                    return "2 Week Pre-Pay Subscription";
                case PaymentOption.FourWeek:
                    return "4 Week Pre-Pay Subscription";
                default:
                    return "No payment option";
            }
        }
    }
}
