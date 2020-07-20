using System;
using System.Collections.Generic;
using System.Text;
using SQLite;

namespace InfiniteMeals.Model.Database {

    // contains information about a user's session 
    // information is received from sending a POST request to aws
    // link: https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/account/<string:accId>
    public class UserLoginSession {

        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }

        public string UserUid { get; set; }

        public string FirstName { get; set; }

        public string SessionId { get; set; }

        public string LoginId { get; set; }

        public string Email { get; set; }

        public override string ToString() {
            return this.ID.ToString() + " " + this.UserUid + " " + this.FirstName + " " + this.SessionId + " " + this.LoginId + " " + this.Email;
        }
    }
}
