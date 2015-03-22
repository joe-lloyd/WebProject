using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class UsersCartItems
    {
        public User currentUser { get; set; }
        public Cart currentCart { get; set; }
        public LineItem currentLineItems { get; set; }
        public Game currentGames { get; set; }
        public Image currentImg { get; set; }
    }
}