using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.Login {

    // contains information received after sending a login post to the database
    // link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/email/password
    public partial class LoginResponse {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public LoginResponseResult Result { get; set; } // contains user uid  and first name

        [JsonProperty("auth_success")]
        public bool AuthSuccess { get; set; }

        [JsonProperty("login_attempt_log")]
        public LoginAttemptLog LoginAttemptLog { get; set; }
    }

    public partial class LoginAttemptLog { // contains session id and login id
        [JsonProperty("session_id")]
        public string SessionId { get; set; }

        [JsonProperty("login_id")]
        public string LoginId { get; set; }
    }

    public partial class LoginResponseResult {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("result")]
        public ResultElement[] Result { get; set; } // uid at index 0, first name at index 1
    }

    public partial class ResultElement {
        [JsonProperty("user_uid")]
        public string UserUid { get; set; }

        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("last_name")]
        public string LastName { get; set; }

        [JsonProperty("user_email")]
        public string UserEmail { get; set; }

        [JsonProperty("phone_number")]
        public string PhoneNumber { get; set; }

        [JsonProperty("create_date")]
        public DateTimeOffset CreateDate { get; set; }

        [JsonProperty("last_update")]
        public DateTimeOffset LastUpdate { get; set; }

        [JsonProperty("referral_source")]
        public string ReferralSource { get; set; }

        [JsonProperty("email_verify")]
        public long EmailVerify { get; set; }
    }
}
