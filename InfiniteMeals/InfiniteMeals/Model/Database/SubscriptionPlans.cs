using System;
namespace InfiniteMeals.Model.Database
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class SubscriptionPlans
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public SubscriptionPlansResult Result { get; set; }
    }

    public partial class SubscriptionPlansResult
    {
        [JsonProperty("MealPlans")]
        public Plans MealPlans { get; set; }

        [JsonProperty("FiveMealPaymentPlans")]
        public Plans FiveMealPaymentPlans { get; set; }

        [JsonProperty("TenMealPaymentPlans")]
        public Plans TenMealPaymentPlans { get; set; }

        [JsonProperty("FifteenMealPaymentPlans")]
        public Plans FifteenMealPaymentPlans { get; set; }

        [JsonProperty("TwentyMealPaymentPlans")]
        public Plans TwentyMealPaymentPlans { get; set; }
    }

    public partial class Plans
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("result")]
        public ResultElement[] Result { get; set; }
    }

    public partial class ResultElement
    {
        [JsonProperty("meal_plan_id")]
        public string MealPlanId { get; set; }

        [JsonProperty("meal_plan_desc")]
        public string MealPlanDesc { get; set; }

        [JsonProperty("payment_frequency")]
        public string PaymentFrequency { get; set; }

        [JsonProperty("photo_URL")]
        public Uri PhotoUrl { get; set; }

        [JsonProperty("num_meals")]
        public long NumMeals { get; set; }

        [JsonProperty("meal_weekly_price")]
        public double MealWeeklyPrice { get; set; }

        [JsonProperty("meal_plan_price")]
        public double MealPlanPrice { get; set; }

        [JsonProperty("meal_plan_price_per_meal")]
        public double MealPlanPricePerMeal { get; set; }

        [JsonProperty("meal_shipping")]
        public long? MealShipping { get; set; }

        [JsonProperty("plan_headline", NullValueHandling = NullValueHandling.Ignore)]
        public string PlanHeadline { get; set; }

        [JsonProperty("plan_footer", NullValueHandling = NullValueHandling.Ignore)]
        public string PlanFooter { get; set; }

        [JsonProperty("RouteOnclick", NullValueHandling = NullValueHandling.Ignore)]
        public string RouteOnclick { get; set; }
    }
}
