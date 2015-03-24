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
            if (Session["User"] == null && Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public static List<GamesWithImages> JoinGamesImage([QueryString("id")] int? ItemID)
        {
            GameStoreContext cxt = new GameStoreContext();
            List<GamesWithImages> listOfGI =    ( from game in cxt.Games
                                                join image in cxt.Images on game.GameID equals image.GameID 
                                                select new GamesWithImages{ currentGame = game, currentImage = image }).ToList();
            if (ItemID.HasValue && ItemID > 0)
            {
                listOfGI = listOfGI.Where(p => p.currentGame.GameID == ItemID).ToList();
            }
            return listOfGI;
        }

        protected void GamesList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BuyNow_Click(object sender, EventArgs e)
        {
            GameStoreContext cxt = new GameStoreContext();

            int userID = int.Parse(Session["UserID"].ToString());
            int newCartID;

            LineItem newLineItem = new LineItem();

            Button btn = (Button)sender;
            int gameID = int.Parse(btn.CommandArgument.ToString());

            var myEntity = (from user in cxt.Users
                            join cart in cxt.Carts on user.UserID equals cart.UserID
                            where user.UserID == userID
                            select new { CartID = cart.CartID }).ToList();
            
            newCartID = 0;
            foreach (var i in myEntity)
            {
                newCartID = i.CartID;
            }

            newLineItem.GameID = gameID;
            newLineItem.CartID = newCartID;
            newLineItem.Quantity = 1;

            cxt.LineItems.Add(newLineItem);
            cxt.SaveChanges();
        }
    }
}