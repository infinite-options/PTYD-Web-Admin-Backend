using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.ViewModel.Checkout {

    // class that contains information about an account's salt (password)
    public class AccountSaltResult {
        [JsonProperty("password_salt")]
        public string passwordSalt { get; set; }
    }

    public class AccountSalt {
        [JsonProperty("message")]
        public string message { get; set; }
        [JsonProperty("result")]
        public IList<AccountSaltResult> result { get; set; }
    }
}
