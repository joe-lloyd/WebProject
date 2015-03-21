using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GameStore.Models;
using System.Web.ModelBinding;

namespace GameStore
{
    public partial class GameList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Game> GetGames([QueryString("id")] int? ItemID)
        {
            var _db = new GameStore.Models.GameStoreContext();
            IQueryable<Game> query = _db.Games;
            if (ItemID.HasValue && ItemID > 0)
            {
                query = query.Where(p => p.GameID == ItemID);
            }
            return query;
        }

        public static List<GamesWithImages> JoinGamesImage()
        {
            GameStoreContext cxt = new GameStoreContext();

        //    List<Game> games = new List<Game>();
        //    List<GameStore.Models.Image> images = new List<GameStore.Models.Image>();

        //    var query = from game in games
        //                join image in images on game.GameID equals image.GameID into gj
        //                select new { games, Images = gj };

        List<GamesWithImages> listOfGI = ( from game in cxt.Games
                        join image in cxt.Images on game.GameID equals image.GameID 
                       select new GamesWithImages{ currentGame = game, currentImage = image }).ToList();

        //    List<T> gameImages = new List<T>();
        //    gameImages = (List<T>)query;
           return listOfGI;
        }
    }
}