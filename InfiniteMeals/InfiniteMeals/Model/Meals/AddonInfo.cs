namespace InfiniteMeals.Model.Database
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class AddonInfo
    {
        [JsonProperty("purchase_id")]
        public string PurchaseId { get; set; }

        [JsonProperty("week_affected")]
        public string WeekAffected { get; set; }

        [JsonProperty("addon_quantities")]
        public Dictionary<string,int> AddonQuantities { get; set; }

        [JsonProperty("is_addons")]
        public bool IsAddons { get; set; }
    }
}
