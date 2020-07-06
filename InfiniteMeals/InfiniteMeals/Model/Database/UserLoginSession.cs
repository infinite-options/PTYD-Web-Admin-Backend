using System;
using System.Collections.Generic;
using System.Text;
using SQLite;

namespace PrepToYourDoor.Model.Database {

    // contains information about a user's session 
    // information is received from sending a POST request to aws
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
