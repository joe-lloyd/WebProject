using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class LineItem
    {
        public int LineItemID { get; set; }
        public int GameID { get; set; }
        public int CartID { get; set; }
        public int Amount { get; set; }
    }
}