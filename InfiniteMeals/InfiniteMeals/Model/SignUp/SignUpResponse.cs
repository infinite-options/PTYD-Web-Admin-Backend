using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.SignUp {
    public class SignUpResponse {

        // response from api when user signs up
        // link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/signup

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("code")]
        public long Code { get; set; }
        
        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("user_uid")]
        public string UserUId { get; set; }

        [JsonProperty("result")]
        public string Result { get; set; }
    }
}
