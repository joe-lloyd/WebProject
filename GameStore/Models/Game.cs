using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace GameStore.Models
{
    public class Game
    {
        public int GameID { get; set; }
        public string Title { get; set; }
        public string Genre { get; set; }
        public string Description { get; set; }
        public string Rating { get; set; }
        public decimal Price { get; set; }
        public DateTime ReleaseDate { get; set; }
    }
}