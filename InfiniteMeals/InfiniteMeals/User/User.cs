using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.User
{
    public class User
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }

        public User() { }
        public User(String Username, string Password)
        {
            this.username = Username;

            this.password = Password;
        }

        public bool Authenticate(String Username, String Password)
        {
            if(this.username.Equals(Username) && this.password.Equals(Password)){
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
