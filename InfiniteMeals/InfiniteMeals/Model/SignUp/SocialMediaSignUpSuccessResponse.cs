using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.SignUp {
    public partial class SocialMediaSignUpSuccessResponse {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public Result Result { get; set; }
    }

    public partial class Result {
        [JsonProperty("user_uid")]
        public string UserUid { get; set; }
    }
}
