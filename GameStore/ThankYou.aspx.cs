using GameStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null && Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public static List<GamesWithImages> JoinGamesImage([QueryString("id")] int? ItemID)
        {
            GameStoreContext cxt = new GameStoreContext();
            List<GamesWithImages> listOfGI = (from game in cxt.Games
                                              join image in cxt.Images on game.GameID equals image.GameID
                                              select new GamesWithImages { currentGame = game, currentImage = image }).ToList();
            if (ItemID.HasValue && ItemID > 0)
            {
                listOfGI = listOfGI.Where(p => p.currentGame.GameID == ItemID).ToList();
            }
            return listOfGI;
        }
    }
}