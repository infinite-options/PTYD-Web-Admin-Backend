using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.Login {

    /* contains information to send to the login api
       link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/
       full link is https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/email/password
       email is user's email, password is hashed password */

    class LoginPost {

        [JsonProperty("ip_address")]
        public string ipAddress { get; set; }

        [JsonProperty("browser_type")]
        public string browserType { get; set; }
    }
}
