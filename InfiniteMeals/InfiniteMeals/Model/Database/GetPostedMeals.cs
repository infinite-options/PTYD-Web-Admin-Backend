using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace InfiniteMeals.Model.Database
{
    public partial class GetPostedMeals
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public Result Result { get; set; }
    }

    public partial class Result
    {
        [JsonProperty("Meals")]
        public PostedMeals[] Meals { get; set; }

        [JsonProperty("Addons")]
        public Addon[] Addons { get; set; }
    }

    public partial class Addon
    {
        [JsonProperty("purchase_id")]
        public string PurchaseId { get; set; }

        [JsonProperty("week_affected")]
        public DateTimeOffset WeekAffected { get; set; }

        [JsonProperty("meal_selection")]
        public string MealSelection { get; set; }

        [JsonProperty("meals_selected")]
        public Dictionary<string, long> MealsSelected { get; set; }
    }

    public partial class PostedMeals
    {
        [JsonProperty("purchase_id")]
        public string PurchaseId { get; set; }

        [JsonProperty("week_affected")]
        public DateTimeOffset WeekAffected { get; set; }

        [JsonProperty("meal_selection")]
        public string MealSelection { get; set; }

        [JsonProperty("delivery_day")]
        public string DeliveryDay { get; set; }

        [JsonProperty("meals_selected")]
        public Dictionary<string, long> MealsSelected { get; set; }
    }
}
