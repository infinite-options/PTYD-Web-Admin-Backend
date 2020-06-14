using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace InfiniteMeals.Model.Subscribe {
    class SubscriptionPlan : INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };

        public MealPlan mealPlan { get; set; }
        public PaymentOption paymentOption { get; set; }

        public SubscriptionPlan() {
            this.mealPlan = MealPlan.Unknown;
            this.paymentOption = PaymentOption.Unknown;
        }

        public SubscriptionPlan(MealPlan mealPlan, PaymentOption paymentOption) {
            this.mealPlan = mealPlan;
            this.paymentOption = paymentOption;
        }

        public override string ToString() {
            return this.mealPlan.ToString() + " " + this.paymentOption.ToString();
        }
    }
}
