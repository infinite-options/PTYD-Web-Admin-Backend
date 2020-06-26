

namespace InfiniteMeals.Model.Meals
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class MealSelectInformation
    {
        [JsonProperty("purchase_id")]
        public string PurchaseId { get; set; }

        [JsonProperty("week_affected")]
        public DateTimeOffset WeekAffected { get; set; }

        [JsonProperty("meal_quantities")]
        public Dictionary<string,int> MealQuantities { get; set; }

        [JsonProperty("delivery_day")]
        public string DeliveryDay { get; set; }

        [JsonProperty("default_selected")]
        public bool DefaultSelected { get; set; }

        [JsonProperty("is_addons")]
        public bool IsAddons { get; set; }
    }
}
