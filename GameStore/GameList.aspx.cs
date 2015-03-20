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
    }
}