using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Model.Subscribe {
    enum PaymentOption {
        Week,
        TwoWeek,
        FourWeek,
        Unknown
    }

    static class PaymentOptionExtension {
        public static string paymentOptionToString(PaymentOption paymentOption) {
            switch (paymentOption) {
                case PaymentOption.Week:
                    return "Weekly payment";
                case PaymentOption.TwoWeek:
                    return "2 week pre-pay";
                case PaymentOption.FourWeek:
                    return "4 week pre-pay";
                default:
                    return "No payment option";
            }
        }
    }
}
