using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GameStore.Models
{
    public class GameStoreContext : DbContext
    {
        public GameStoreContext()
            : base("GMCGames")
        {
        }
        
        public DbSet<Game> Games { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<User> Users { get; set; }
    }
}