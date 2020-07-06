using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Model.Subscribe {

    // stores the values received from GET request to aws
    // api link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/plans
    public class MealPlanInformation {
        public string message { get; set; }
        public MealPlanInformationResult result { get; set; } // contains all the meal plans
    }
    public class MealPlanInformationResult { 
        public MealPlans MealPlans { get; set; }
        public FiveMealPaymentPlans FiveMealPaymentPlans { get; set; }
        public TenMealPaymentPlans TenMealPaymentPlans { get; set; }
        public FifteenMealPaymentPlans FifteenMealPaymentPlans { get; set; }
        public TwentyMealPaymentPlans TwentyMealPaymentPlans { get; set; }
    }

    public class MealPlans {
        public string message { get; set; }
        public int code { get; set; }
        public IList<MealPlansResult> result { get; set; }
        public string sql { get; set; }
    }

    public class MealPlansResult {
        public string meal_plan_id { get; set; }
        public string meal_plan_desc { get; set; }
        public string payment_frequency { get; set; }
        public string photo_URL { get; set; }
        public string plan_headline { get; set; }
        public string plan_footer { get; set; }
        public int num_meals { get; set; }
        public double meal_weekly_price { get; set; }
        public double meal_plan_price { get; set; }
        public double meal_plan_price_per_meal { get; set; }
        public string RouteOnclick { get; set; }
    }



    public class FiveMealPaymentPlans {
        public string message { get; set; }
        public int code { get; set; }
        public IList<Result> result { get; set; }
        public string sql { get; set; }
    }

    public class Result {
        public string meal_plan_id { get; set; }
        public string meal_plan_desc { get; set; }
        public string payment_frequency { get; set; }
        public string photo_URL { get; set; }
        public int num_meals { get; set; }
        public double meal_weekly_price { get; set; }
        public double meal_plan_price { get; set; }
        public double meal_plan_price_per_meal { get; set; }
    }

    public class TenMealPaymentPlans {
        public string message { get; set; }
        public int code { get; set; }
        public IList<Result> result { get; set; }
        public string sql { get; set; }
    }

    public class FifteenMealPaymentPlans {
        public string message { get; set; }
        public int code { get; set; }
        public IList<Result> result { get; set; }
        public string sql { get; set; }
    }

    public class TwentyMealPaymentPlans {
        public string message { get; set; }
        public int code { get; set; }
        public IList<Result> result { get; set; }
        public string sql { get; set; }
    }





}
