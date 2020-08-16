using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.Login {
    public partial class SocialAccountResponse {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("result")]
        public SocialAccountResponseResult Result { get; set; }

    }

    public partial class SocialAccountResponseResult {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("code")]
        public long Code { get; set; }

        [JsonProperty("result")]
        public SocialResultElement[] Result { get; set; }
    }

    public partial class SocialResultElement {
        [JsonProperty("user_uid")]
        public string UserUid { get; set; }

        [JsonProperty("user_email")]
        public string UserEmail { get; set; }

        [JsonProperty("user_social_media")]
        public string UserSocialMedia { get; set; }

        [JsonProperty("user_access_token")]
        public string UserAccessToken { get; set; }

        [JsonProperty("user_refresh_token")]
        public string UserRefreshToken { get; set; }
    }
}
