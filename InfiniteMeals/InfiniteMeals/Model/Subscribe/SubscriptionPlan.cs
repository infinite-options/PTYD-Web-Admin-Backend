using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Runtime.ConstrainedExecution;

namespace InfiniteMeals.Model.Subscribe {

    // contains information about a subscription plan (meal plan and payment option)
    public class SubscriptionPlan : INotifyPropertyChanged {

        public event PropertyChangedEventHandler PropertyChanged = delegate { };


        public MealPlan mealPlan { get; set; }
        public PaymentOption paymentOption { get; set; }

        public string id { get; set; } // id of the subscription plan, based on meal plan and payment option

        public double cost { get; set; }


        public SubscriptionPlan() {
            this.mealPlan = MealPlan.Unknown;
            this.paymentOption = PaymentOption.Unknown;
            this.id = "";
            this.cost = 0;
            
        }

        public SubscriptionPlan(MealPlan mealPlan, PaymentOption paymentOption) {
            this.mealPlan = mealPlan;
            this.paymentOption = paymentOption;
            this.cost = 0;
            initializeID(mealPlan, paymentOption);
        }

        // assigns id based on meal plan and payment option
        public void initializeID(MealPlan mealPlan, PaymentOption paymentOption) {
            switch(mealPlan) {
                case MealPlan.FiveMeals:
                    switch(paymentOption) {
                        case PaymentOption.Week:
                            this.id = "800-000001";
                            break;
                        case PaymentOption.TwoWeek:
                            this.id = "???"; // missing in api
                            break;
                        case PaymentOption.FourWeek:
                            this.id = "800-000002";
                            break;
                        default:
                            this.id = "0";
                            break;
                    }
                    break;

                case MealPlan.TenMeals:
                    switch (paymentOption) {
                        case PaymentOption.Week:
                            this.id = "800-000003";
                            break;
                        case PaymentOption.TwoWeek:
                            this.id = "800-000004";
                            break;
                        case PaymentOption.FourWeek:
                            this.id = "800-000005";
                            break;
                        default:
                            this.id = "0";
                            break;
                    }
                    break;

                case MealPlan.FifteenMeals:
                    switch (paymentOption) {
                        case PaymentOption.Week:
                            this.id = "800-000006";
                            break;
                        case PaymentOption.TwoWeek:
                            this.id = "800-000007";
                            break;
                        case PaymentOption.FourWeek:
                            this.id = "800-000008";
                            break;
                        default:
                            this.id = "0";
                            break;
                    }
                    break;


                case MealPlan.TwentyMeals:
                    switch (paymentOption) {
                        case PaymentOption.Week:
                            this.id = "800-000009";
                            break;
                        case PaymentOption.TwoWeek:
                            this.id = "800-000010";
                            break;
                        case PaymentOption.FourWeek:
                            this.id = "800-000011";
                            break;
                        default:
                            this.id = "0";
                            break;
                    }
                    break;



                default:
                    this.id = "0";
                    break;
            }
        }

        public override string ToString() {
            return this.mealPlan.ToString() + " " + this.paymentOption.ToString();
        }
    }
}
