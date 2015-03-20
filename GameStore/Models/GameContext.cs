using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class GameContext : DbContext
    {
        public GameContext()
            : base("GMCGames")
        {
        }
        
        public DbSet<Game> Games { get; set; }
        public DbSet<ImageModel> Images { get; set; }
    }
}