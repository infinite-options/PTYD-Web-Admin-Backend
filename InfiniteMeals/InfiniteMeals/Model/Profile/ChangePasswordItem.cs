using System;
using System.Collections.Generic;
using System.Text;

using Newtonsoft.Json;

namespace InfiniteMeals.Model.Profile {

    // object to send to database when user wants to change his/her password
    // api link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/changepassword
    public class ChangePasswordItem {

        [JsonProperty("ID")]
        public string ID { get; set; }

        [JsonProperty("old")]
        public string oldPassword { get; set; }

        [JsonProperty("new")]
        public string newPassword { get; set; }
    }
}
