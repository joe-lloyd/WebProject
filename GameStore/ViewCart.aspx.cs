using GameStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


           
        }

        //if (ItemID.HasValue && ItemID > 0)
        //    {
        //        listOfGI = listOfGI.Where(p => p.currentGame.GameID == ItemID).ToList();
        //    }

        public List<UsersCartItems> ItemsInCart([QueryString("id")] int? ItemID)
        {
            List<UsersCartItems> listOfEverythingInAUsersCart = new List<UsersCartItems>();

            int userID = int.Parse(Session["UserID"].ToString());

                GameStoreContext cxt = new GameStoreContext();

                listOfEverythingInAUsersCart = (from user in cxt.Users 
                                                join cart in cxt.Carts on user.UserID equals cart.UserID
                                                join lineItem in cxt.LineItems on cart.CartID equals lineItem.CartID
                                                join game in cxt.Games on lineItem.GameID equals game.GameID
                                                join img in cxt.Images on game.GameID equals img.GameID
                                                where user.UserID == userID
                                                select new UsersCartItems { currentUser = user, currentCart = cart, currentLineItems = lineItem, currentGames = game, currentImg = img }).ToList();
            
                return listOfEverythingInAUsersCart;
            
        }
    }
}