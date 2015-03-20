using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class User
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string usrPassword { get; set; }
        public bool IsAdmin { get; set; }
    }
}