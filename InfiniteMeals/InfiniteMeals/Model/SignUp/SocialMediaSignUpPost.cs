using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace InfiniteMeals.Model.SignUp {
    public class SocialMediaSignUpPost {
        /**
         * 	"Email": "seanquach3443@yahoo.com",
  	"FirstName": "Sean",
  	"LastName": "Quach",
  	"PhoneNumber": "4086146428",
  	"WeeklyUpdates": "false",
  	"Referral": "Social Media",
  	"SocialMedia": "TestYahoo",
  	"AccessToken": "Test",
  	"RefreshToken": "Test"
         */

        [JsonProperty("Email")]
        public string Email { get; set; }

        [JsonProperty("FirstName")]
        public string FirstName { get; set; }

        [JsonProperty("LastName")]
        public string LastName { get; set; }

        [JsonProperty("PhoneNumber")]
        public string PhoneNumber { get; set; }

        [JsonProperty("WeeklyUpdates")]
        public string WeeklyUpdates { get; set; }

        [JsonProperty("Referral")]
        public string Referral { get; set; }

        [JsonProperty("SocialMedia")]
        public string SocialMedia { get; set; }

        [JsonProperty("AccessToken")]
        public string AccessToken { get; set; }

        [JsonProperty("RefreshToken")]
        public string RefreshToken { get; set; }
    }
}
