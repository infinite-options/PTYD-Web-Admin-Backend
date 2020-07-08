using System;
using System.Collections.Generic;
using System.Text;

using Newtonsoft.Json;

namespace InfiniteMeals.Model.Profile {
    class ChangePasswordItem {

        [JsonProperty("ID")]
        public string ID { get; set; }

        [JsonProperty("old")]
        public string oldPassword { get; set; }

        [JsonProperty("new")]
        public string newPassword { get; set; }
    }
}
