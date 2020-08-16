using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.SignUp {
    public class SocialMediaSignUpFailResponse {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public string Result { get; set; }

        [JsonProperty("code")]
        public long Code { get; set; }
    }
}
