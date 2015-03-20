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
    }
}