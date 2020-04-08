using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.User
{
    public class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public User() { }
        public User(String Username, string Password)
        {
            this.Username = Username;

            this.Password = Password;
        }

        public bool Authenticate(String Username, String Password)
        {
            if(this.Username.Equals(Username) && this.Password.Equals(Password)){
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
