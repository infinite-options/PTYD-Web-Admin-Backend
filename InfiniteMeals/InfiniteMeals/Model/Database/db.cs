using System;
namespace InfiniteMeals.Model.Database {
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    // classes to contain information about a JSON object
    // https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals



    public partial class Data { // access like class
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public Result Result { get; set; }

        [JsonProperty("resultelem")]
        public ResultElement[] ResultElem { get; set; }


    }

    public partial class Test {
        public List<Menu> MenuList { get; set; }
    }

    public partial class Result { // access like class
        [JsonProperty("MenuForWeek1")]
        public MenuForWeek1 MenuForWeek1 { get; set; }

        [JsonProperty("MenuForWeek2")]
        public MenuForWeek2 MenuForWeek2 { get; set; }

        [JsonProperty("MenuForWeek3")]
        public MenuForWeek3 MenuForWeek3 { get; set; }

        [JsonProperty("MenuForWeek4")]
        public MenuForWeek4 MenuForWeek4 { get; set; }

        [JsonProperty("MenuForWeek5")]
        public MenuForWeek5 MenuForWeek5 { get; set; }

        [JsonProperty("MenuForWeek6")]
        public MenuForWeek6 MenuForWeek6 { get; set; }

        [JsonProperty("result")]
        public ResultElement[] Res { get; set; }


    }

    public partial class MenuForWeek1 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek1AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek1AddonPrice { // access like class
        [JsonProperty("700-000093")]
        public string The700000093 { get; set; }

        [JsonProperty("700-000012")]
        public string The700000012 { get; set; }

        [JsonProperty("700-000008")]
        public string The700000008 { get; set; }

        [JsonProperty("700-000032")]
        public string The700000032 { get; set; }

        [JsonProperty("700-000027")]
        public string The700000027 { get; set; }

        [JsonProperty("700-000035")]
        public string The700000035 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000112")]
        public string The700000112 { get; set; }

        [JsonProperty("700-000029")]
        public string The700000029 { get; set; }

        [JsonProperty("700-000075")]
        public string The700000075 { get; set; }
    }

    public partial class Addons { // access like class
        [JsonProperty("Addons")]
        public SmoothiesClass AddonsAddons { get; set; }

        [JsonProperty("Weekly")]
        public SmoothiesClass Weekly { get; set; }

        [JsonProperty("Smoothies")]
        public SmoothiesClass Smoothies { get; set; }
    }

    public partial class SmoothiesClass { // access like class
        [JsonProperty("Category")]
        public string Category { get; set; }

        [JsonProperty("Menu")]
        public Menu[] Menu { get; set; }
    }

    public partial class Menu { // access like array
        [JsonProperty("meal_id")]
        public string MealId { get; set; }

        [JsonProperty("meal_name")]
        public string MealName { get; set; }

        [JsonProperty("menu_date")]
        public DateTimeOffset MenuDate { get; set; }

        [JsonProperty("menu_category")]
        public string MenuCategory { get; set; }

        [JsonProperty("menu_meal_id")]
        public string MenuMealId { get; set; }

        [JsonProperty("meal_desc")]
        public string MealDesc { get; set; }

        [JsonProperty("meal_category")]
        public MealCategory MealCategory { get; set; }

        [JsonProperty("meal_photo_url")]
        public Uri MealPhotoUrl { get; set; }

        [JsonProperty("extra_meal_price")]
        public string ExtraMealPrice { get; set; }

        [JsonProperty("meal_calories")]
        public long? MealCalories { get; set; }

        [JsonProperty("meal_protein")]
        public double? MealProtein { get; set; }

        [JsonProperty("meal_carbs")]
        public double? MealCarbs { get; set; }

        [JsonProperty("meal_fiber")]
        public double? MealFiber { get; set; }

        [JsonProperty("meal_sugar")]
        public double? MealSugar { get; set; }

        [JsonProperty("meal_fat")]
        public double? MealFat { get; set; }

        [JsonProperty("meal_sat")]
        public double? MealSat { get; set; }
    }

    public partial class Meals {
        [JsonProperty("Weekly")]
        public SmoothiesClass Weekly { get; set; }

        [JsonProperty("Seasonal")]
        public SmoothiesClass Seasonal { get; set; }

        [JsonProperty("Smoothies")]
        public SmoothiesClass Smoothies { get; set; }
    }

    public partial class MenuForWeek2 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek2AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek2AddonPrice { // access like class
        [JsonProperty("700-000019")]
        public string The700000019 { get; set; }

        [JsonProperty("700-000094")]
        public string The700000094 { get; set; }

        [JsonProperty("700-000009")]
        public string The700000009 { get; set; }

        [JsonProperty("700-000032")]
        public string The700000032 { get; set; }

        [JsonProperty("700-000027")]
        public string The700000027 { get; set; }

        [JsonProperty("700-000035")]
        public string The700000035 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000113")]
        public string The700000113 { get; set; }

        [JsonProperty("700-000030")]
        public string The700000030 { get; set; }

        [JsonProperty("700-000076")]
        public string The700000076 { get; set; }
    }

    public partial class MenuForWeek3 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek3AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek3AddonPrice { // access like class
        [JsonProperty("700-000079")]
        public string The700000079 { get; set; }

        [JsonProperty("700-000073")]
        public string The700000073 { get; set; }

        [JsonProperty("700-000076")]
        public string The700000076 { get; set; }

        [JsonProperty("700-000032")]
        public string The700000032 { get; set; }

        [JsonProperty("700-000027")]
        public string The700000027 { get; set; }

        [JsonProperty("700-000035")]
        public string The700000035 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000114")]
        public string The700000114 { get; set; }

        [JsonProperty("700-000033")]
        public string The700000033 { get; set; }

        [JsonProperty("700-000077")]
        public string The700000077 { get; set; }
    }

    public partial class MenuForWeek4 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek4AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek4AddonPrice { // access like class
        [JsonProperty("700-000011")]
        public string The700000011 { get; set; }

        [JsonProperty("700-000021")]
        public string The700000021 { get; set; }

        [JsonProperty("700-000046")]
        public string The700000046 { get; set; }

        [JsonProperty("700-000082")]
        public string The700000082 { get; set; }

        [JsonProperty("700-000089")]
        public string The700000089 { get; set; }

        [JsonProperty("700-000035")]
        public string The700000035 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000115")]
        public string The700000115 { get; set; }

        [JsonProperty("700-000037")]
        public string The700000037 { get; set; }

        [JsonProperty("700-000078")]
        public string The700000078 { get; set; }
    }

    public partial class MenuForWeek5 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek5AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek5AddonPrice { // access like class
        [JsonProperty("700-000127")]
        public string The700000127 { get; set; }

        [JsonProperty("700-000078")]
        public string The700000078 { get; set; }

        [JsonProperty("700-000070")]
        public string The700000070 { get; set; }

        [JsonProperty("700-000082")]
        public string The700000082 { get; set; }

        [JsonProperty("700-000089")]
        public string The700000089 { get; set; }

        [JsonProperty("700-000035")]
        public string The700000035 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000116")]
        public string The700000116 { get; set; }

        [JsonProperty("700-000040")]
        public string The700000040 { get; set; }

        [JsonProperty("700-000079")]
        public string The700000079 { get; set; }
    }

    public partial class MenuForWeek6 { // access like class
        [JsonProperty("SaturdayDate")]
        public DateTimeOffset SaturdayDate { get; set; }

        [JsonProperty("SundayDate")]
        public DateTimeOffset SundayDate { get; set; }

        [JsonProperty("Sunday")]
        public string Sunday { get; set; }

        [JsonProperty("Monday")]
        public string Monday { get; set; }

        [JsonProperty("Meals")]
        public Meals Meals { get; set; }

        [JsonProperty("Addons")]
        public Addons Addons { get; set; }

        [JsonProperty("MealQuantities")]
        public Dictionary<string, long> MealQuantities { get; set; }

        [JsonProperty("AddonPrice")]
        public MenuForWeek6AddonPrice AddonPrice { get; set; }
    }

    public partial class MenuForWeek6AddonPrice { // access like class
        [JsonProperty("700-000108")]
        public string The700000108 { get; set; }

        [JsonProperty("700-000015")]
        public string The700000015 { get; set; }

        [JsonProperty("700-000126")]
        public string The700000126 { get; set; }

        [JsonProperty("700-000095")]
        public string The700000095 { get; set; }

        [JsonProperty("700-000012")]
        public string The700000012 { get; set; }

        [JsonProperty("700-000048")]
        public string The700000048 { get; set; }

        [JsonProperty("700-010001")]
        public string The700010001 { get; set; }

        [JsonProperty("700-010002")]
        public string The700010002 { get; set; }

        [JsonProperty("700-010003")]
        public string The700010003 { get; set; }

        [JsonProperty("700-000077")]
        public string The700000077 { get; set; }

        [JsonProperty("700-000114")]
        public string The700000114 { get; set; }

        [JsonProperty("700-000033")]
        public string The700000033 { get; set; }
    }

    public enum MealCategory { Breakfast, Entree, Salad, Smoothie, Soup };

    internal static class Converter {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                MealCategoryConverter.Singleton,
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }

    public partial class ResultElement
    {
        [JsonProperty("zipcode")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long Zipcode { get; set; }
    }

    internal class ParseStringConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(long) || t == typeof(long?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            long l;
            if (Int64.TryParse(value, out l))
            {
                return l;
            }
            throw new Exception("Cannot unmarshal type long");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (long)untypedValue;
            serializer.Serialize(writer, value.ToString());
            return;
        }

        public static readonly ParseStringConverter Singleton = new ParseStringConverter();
    }


    internal class MealCategoryConverter : JsonConverter {
        public override bool CanConvert(Type t) => t == typeof(MealCategory) || t == typeof(MealCategory?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer) {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value) {
                case "Breakfast":
                    return MealCategory.Breakfast;
                case "Entree":
                    return MealCategory.Entree;
                case "Salad":
                    return MealCategory.Salad;
                case "Smoothie":
                    return MealCategory.Smoothie;
                case "Soup":
                    return MealCategory.Soup;
            }
            throw new Exception("Cannot unmarshal type MealCategory");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer) {
            if (untypedValue == null) {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (MealCategory)untypedValue;
            switch (value) {
                case MealCategory.Breakfast:
                    serializer.Serialize(writer, "Breakfast");
                    return;
                case MealCategory.Entree:
                    serializer.Serialize(writer, "Entree");
                    return;
                case MealCategory.Salad:
                    serializer.Serialize(writer, "Salad");
                    return;
                case MealCategory.Smoothie:
                    serializer.Serialize(writer, "Smoothie");
                    return;
                case MealCategory.Soup:
                    serializer.Serialize(writer, "Soup");
                    return;
            }
            throw new Exception("Cannot marshal type MealCategory");
        }

        public static readonly MealCategoryConverter Singleton = new MealCategoryConverter();
    }

    public partial class UserInfo
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public Result[] Result { get; set; }
    }

    public partial class Result
    {
        [JsonProperty("payment_id")]
        public string PaymentId { get; set; }

        [JsonProperty("buyer_id")]
        public string BuyerId { get; set; }

        [JsonProperty("coupon_id")]
        public object CouponId { get; set; }

        [JsonProperty("gift")]
        public string Gift { get; set; }

        [JsonProperty("amount_due")]
        public double AmountDue { get; set; }

        [JsonProperty("amount_paid")]
        public string AmountPaid { get; set; }

        [JsonProperty("purchase_id")]
        public string PurchaseId { get; set; }

        [JsonProperty("last_payment_time_stamp")]
        public DateTimeOffset LastPaymentTimeStamp { get; set; }

        [JsonProperty("payment_type")]
        public string PaymentType { get; set; }

        [JsonProperty("cc_num")]
        public string CcNum { get; set; }

        [JsonProperty("cc_exp_date")]
        public DateTimeOffset CcExpDate { get; set; }

        [JsonProperty("cc_cvv")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long CcCvv { get; set; }

        [JsonProperty("billing_zip")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long BillingZip { get; set; }

        [JsonProperty("meal_plan_id")]
        public string MealPlanId { get; set; }

        [JsonProperty("MaximumMeals")]
        public long MaximumMeals { get; set; }

        [JsonProperty("meal_plan_desc")]
        public string MealPlanDesc { get; set; }

        [JsonProperty("meal_plan_price")]
        public double MealPlanPrice { get; set; }

        [JsonProperty("payment_frequency")]
        public string PaymentFrequency { get; set; }

        [JsonProperty("start_date")]
        public DateTimeOffset StartDate { get; set; }

        [JsonProperty("delivery_first_name")]
        public string DeliveryFirstName { get; set; }

        [JsonProperty("delivery_last_name")]
        public string DeliveryLastName { get; set; }

        [JsonProperty("delivery_email")]
        public string DeliveryEmail { get; set; }

        [JsonProperty("delivery_phone")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long DeliveryPhone { get; set; }

        [JsonProperty("delivery_address")]
        public string DeliveryAddress { get; set; }

        [JsonProperty("delivery_address_unit")]
        public string DeliveryAddressUnit { get; set; }

        [JsonProperty("delivery_city")]
        public string DeliveryCity { get; set; }

        [JsonProperty("delivery_state")]
        public string DeliveryState { get; set; }

        [JsonProperty("delivery_zip")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long DeliveryZip { get; set; }

        [JsonProperty("delivery_region")]
        public string DeliveryRegion { get; set; }

        [JsonProperty("delivery_instructions")]
        public string DeliveryInstructions { get; set; }

        [JsonProperty("paid_weeks_remaining")]
        public long PaidWeeksRemaining { get; set; }

        [JsonProperty("next_charge_date")]
        public DateTimeOffset NextChargeDate { get; set; }

        [JsonProperty("total_charge")]
        public long TotalCharge { get; set; }

        [JsonProperty("amount_due_before_addon")]
        public string AmountDueBeforeAddon { get; set; }

        [JsonProperty("week_affected")]
        public object WeekAffected { get; set; }

        [JsonProperty("next_addon_charge_date")]
        public DateTimeOffset NextAddonChargeDate { get; set; }

        [JsonProperty("monday_available")]
        public bool MondayAvailable { get; set; }
    }
}