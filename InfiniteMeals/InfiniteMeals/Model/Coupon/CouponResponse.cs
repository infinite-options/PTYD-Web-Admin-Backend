using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.Coupon {

    // contains info retrieved from calling coupon api
    // link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/coupon?coupon_id=couponid&email=useremail
    public class CouponResponse {

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public CouponResult Result { get; set; }
    }

    public class CouponResult {
        [JsonProperty("coupon_id")]
        public string CouponID { get; set; }

        [JsonProperty("active")]
        public string Active { get; set; }

        [JsonProperty("discount_percent")]
        public double DiscountPercent { get; set; }

        [JsonProperty("discount_amount")]
        public double DiscountAmount { get; set; }

        [JsonProperty("discount_shipping")]
        public double DiscountShipping { get; set; }

        [JsonProperty("expire_date")]
        public string ExpirationDate { get; set; }

        [JsonProperty("limits")]
        public int Limit { get; set; }

        [JsonProperty("notes")]
        public string Notes { get; set; }

        [JsonProperty("num_used")]
        public int NumUsed { get; set; }

        [JsonProperty("recurring")]
        public string Recurring { get; set; }

        [JsonProperty("email")]
        public string Email { get; set; }
    }
}
