using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Model.Subscribe {
    public enum PaymentOption {
        Week,
        TwoWeek,
        FourWeek,
        Unknown
    }

    static class PaymentOptionExtension {
        public static string paymentOptionToString(PaymentOption paymentOption) {
            switch (paymentOption) {
                case PaymentOption.Week:
                    return "Weekly Subscription";
                case PaymentOption.TwoWeek:
                    return "2 week Pre-Pay Subscription";
                case PaymentOption.FourWeek:
                    return "4 week Pre-Pay Subscription";
                default:
                    return "No payment option";
            }
        }
    }
}
