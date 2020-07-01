﻿using System;
using System.Collections.Generic;
using System.Text;
using SQLite;

namespace PrepToYourDoor.Model.Database {
    public class UserLoginSession {

        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }

        public string UserUid { get; set; }

        public string FirstName { get; set; }

        public string SessionId { get; set; }

        public string LoginId { get; set; }

        public override string ToString() {
            return this.ID.ToString() + " " + this.UserUid + " " + this.FirstName + " " + this.SessionId + " " + this.LoginId;
        }
    }
}
