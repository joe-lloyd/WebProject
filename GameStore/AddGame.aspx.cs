using GameStore.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStore
{
    public partial class AddGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtDescription.Text = "";
            //txtPrice.Text = "";
            //txtReleaseDate.Text = "";
            //txtTitle.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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