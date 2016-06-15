using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Meteor.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

// Jesse Baril & Austin Cameron

namespace Meteor
{
    public partial class GameList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If loading page for the first time, populate the department grid, if not don't repopulate
            if (!IsPostBack)
            {
                // Get the Department data
                this.GetGames();
            }
        }
        protected void GetGames()
        {
            // Connect to EF
            using (TrackingConnection db = new TrackingConnection())
            {
                // Query the departments table using EF and LINQ
                var Games = (from allGames in db.Games select allGames);

                // Bind results to gridview
                GamesGridView.DataSource = Games.AsQueryable().ToList();
                GamesGridView.DataBind();
            }
        }

        protected void GamesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Store which row was clicked
            int selectedRow = e.RowIndex;

            // Get the selected DepartmentID using the grids datakey collection
            int GameID = Convert.ToInt32(GamesGridView.DataKeys[selectedRow].Values["GameID"]);

            // Use ef to find the selelcted Department and delete it
            using (TrackingConnection db = new TrackingConnection())
            {
                // Create object of the department class and store the query string inside of it
                Game deletedGame = (from gameRecords in db.Games
                                                where gameRecords.GameID == GameID
                                                select gameRecords).FirstOrDefault();

                // Remove the selected department from the db
                db.Games.Remove(deletedGame);

                // Save db changes
                db.SaveChanges();

                // Refresh gridview
                this.GetGames();

            }
        }
    }
}