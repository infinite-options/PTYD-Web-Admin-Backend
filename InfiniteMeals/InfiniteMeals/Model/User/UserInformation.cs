using System;
namespace InfiniteMeals.Model.Database
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class UserInformation
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public ResultUser[] Result { get; set; }
    }

    public partial class ResultUser
    {
        [JsonProperty("payment_id")]
        public string PaymentId { get; set; }

        [JsonProperty("buyer_id")]
        public string BuyerId { get; set; }

        [JsonProperty("coupon_id")]
        public string CouponId { get; set; }

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
        public string CcExpDate { get; set; }

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

