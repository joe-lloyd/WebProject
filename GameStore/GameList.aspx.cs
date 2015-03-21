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
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        //public IQueryable<Game> GetGames([QueryString("id")] int? ItemID)
        //{
        //    var _db = new GameStore.Models.GameStoreContext();
        //    IQueryable<Game> query = _db.Games;
        //    if (ItemID.HasValue && ItemID > 0)
        //    {
        //        query = query.Where(p => p.GameID == ItemID);
        //    }
        //    return query;
        //}

        public static List<GamesWithImages> JoinGamesImage([QueryString("id")] int? ItemID)
        {
            GameStoreContext cxt = new GameStoreContext();
            List<GamesWithImages> listOfGI = ( from game in cxt.Games
                        join image in cxt.Images on game.GameID equals image.GameID 
                       select new GamesWithImages{ currentGame = game, currentImage = image }).ToList();
            if (ItemID.HasValue && ItemID > 0)
            {
                listOfGI = listOfGI.Where(p => p.currentGame.GameID == ItemID).ToList();
            }
            return listOfGI;
        }
    }
}