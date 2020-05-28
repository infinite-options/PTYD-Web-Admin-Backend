using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.LoginToken
{
    class Token
    {
        public int id { get; set; }
        public string accessToken { get; set; }
        public string errorDescription { get; set; }
        public DateTime expireDate { get; set; }

        public Token() { }
    }
}
