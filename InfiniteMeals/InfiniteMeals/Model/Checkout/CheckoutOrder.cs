using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Model.Checkout {

    // class to contain information to send to the database about the user's purchase
    // api link: "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/checkout" 
    class CheckoutOrder {


        [JsonProperty("cc_num")]
        public string ccNum { get; set; }

        [JsonProperty("cc_cvv")]
        public string ccCVV { get; set; }

        [JsonProperty("billing_zip")]
        public string billingZip { get; set; }

        [JsonProperty("delivery_first_name")]
        public string deliveryFirstName { get; set; }

        [JsonProperty("delivery_last_name")]
        public string deliveryLastName { get; set; }

        [JsonProperty("delivery_email")]
        public string deliveryEmail { get; set; }

        [JsonProperty("delivery_phone")]
        public string deliveryPhone { get; set; }

        [JsonProperty("delivery_address")]
        public string deliveryAddress { get; set; }

        [JsonProperty("delivery_address_unit")]
        public string deliveryAddressUnit { get; set; }

        [JsonProperty("delivery_city")]
        public string deliveryCity { get; set; }

        [JsonProperty("delivery_state")]
        public string deliveryState { get; set; }

        [JsonProperty("delivery_zip")]
        public string deliveryZip { get; set; }

        [JsonProperty("delivery_region")]
        public string deliveryRegion { get; set; }

        [JsonProperty("delivery_instructions")]
        public string deliveryInstructions { get; set; }

        [JsonProperty("cc_exp_month")]
        public string ccExpMonth { get; set; }

        [JsonProperty("cc_exp_year")]
        public string ccExpYear { get; set; }

        [JsonProperty("salt")] // hashed password 
        public string salt { get; set; }

        [JsonProperty("is_gift")]
        public string isGift { get; set; }

        [JsonProperty("user_uid")]
        public string userUId { get; set; }

        [JsonProperty("item")]
        public string item { get; set; }

        [JsonProperty("coupon_id")]
        public string couponId { get; set; }

        [JsonProperty("total_charge")]
        public double totalCharge { get; set; }

        [JsonProperty("total_discount")]
        public double totalDiscount { get; set; }
        
    } 
    
}
