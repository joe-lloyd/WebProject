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
        public int tottalItems;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null && Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                GetTotalMoney();
            }
        }

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

            tottalItems = listOfEverythingInAUsersCart.Count();

            return listOfEverythingInAUsersCart;
            
        }

        public void TestCartValue()
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

            tottalItems = listOfEverythingInAUsersCart.Count();
        }

        public void GetTotalMoney()
        {
            decimal cost = 0;
            int userID = int.Parse(Session["UserID"].ToString());

            GameStoreContext cxt = new GameStoreContext();


            var moneys= (from user in cxt.Users
                        join cart in cxt.Carts on user.UserID equals cart.UserID
                        join lineItem in cxt.LineItems on cart.CartID equals lineItem.CartID
                        join game in cxt.Games on lineItem.GameID equals game.GameID
                        join img in cxt.Images on game.GameID equals img.GameID
                        where user.UserID == userID
                        select (game.Price));

            foreach (var x in moneys)
            {
                cost += x;
            }
            lblTotal.Text = "€" + cost;
        }

        protected void Buy_Click(object sender, EventArgs e)
        {
            GameStoreContext cxt = new GameStoreContext();

            int userID = int.Parse(Session["UserID"].ToString());

            var query = (from user in cxt.Users
                        join cart in cxt.Carts on user.UserID equals cart.UserID
                        join lineItem in cxt.LineItems on cart.CartID equals lineItem.CartID
                        join game in cxt.Games on lineItem.GameID equals game.GameID
                        join img in cxt.Images on game.GameID equals img.GameID
                        where user.UserID == userID
                        select (lineItem));

            foreach (var item in query)
            {
                cxt.LineItems.Remove(item);
            }
            cxt.SaveChanges();
            Response.Redirect("ThankYou.aspx");
        }
    }
}