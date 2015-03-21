using GameStore.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Game> GetGameDetails([QueryString("id")] int? ItemID)
        {
            var _db = new GameStore.Models.GameStoreContext();
            //Gets full list of games
            IQueryable<Game> query = _db.Games;
            //If the query string gives an ID run this
            if (ItemID.HasValue && ItemID > 0)
            {
                //query is only for one game
                query = query.Where(p => p.GameID == ItemID);
            }
            return query;
        }

        protected void btnDeleteGame_Click(object sender, EventArgs e)
        {
            int inputGameID;
            inputGameID = int.Parse(txtGameID.Text);

            GameStoreContext cxt = new GameStoreContext();
            Game GameToDelete = cxt.Games.First(x => x.GameID.Equals(inputGameID));
            cxt.Games.Remove(GameToDelete);
            cxt.SaveChanges();
        }

        protected void btnUpdateGame_Click(object sender, EventArgs e)
        {
            int inputGameID;
            inputGameID = int.Parse(txtGameID.Text);

            GameStoreContext cxt = new GameStoreContext();
            Game GameToUpdate = cxt.Games.First(x => x.GameID.Equals(inputGameID));
            GameToUpdate.Title = txtTitle.Text;
            GameToUpdate.Rating = cboRating.SelectedValue;
            GameToUpdate.ReleaseDate = Convert.ToDateTime(txtReleaseDate.Text);
            GameToUpdate.Price = decimal.Parse(txtPrice.Text);
            GameToUpdate.Description = txtDescription.Text;
            GameToUpdate.Genre = cboGenre.SelectedValue;
            cxt.SaveChanges();
        }

        protected void btnAddGame_Click(object sender, EventArgs e)
        {
            Game newGame = new Game();
            Models.Image gameImg = new Models.Image();

            string filename = Path.GetFileName(ImageUpload.FileName);
            string newFilename = Guid.NewGuid().ToString() + "-" + filename;

            newGame.Title = txtTitle.Text;
            newGame.Rating = cboRating.SelectedValue.ToString();
            newGame.Genre = cboGenre.SelectedValue.ToString();
            newGame.Description = txtDescription.Text;
            newGame.Price = decimal.Parse(txtPrice.Text);
            newGame.ReleaseDate = Convert.ToDateTime(txtReleaseDate.Text);

            GameStoreContext gameCxt = new GameStoreContext();

            gameCxt.Games.Add(newGame);
            gameCxt.SaveChanges();

            int id = newGame.GameID;

            gameImg.Description = "";
            gameImg.GameID = id;
            gameImg.Name = newFilename;

            ImageUpload.SaveAs(Server.MapPath("~/GameImages/") + newFilename);

            gameCxt.Images.Add(gameImg);
            gameCxt.SaveChanges();
        }
    }
}