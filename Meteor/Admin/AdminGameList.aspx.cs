using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Meteor.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

/**
 * @author: Jesse Baril - Austin Cameron
 * @date: June 24th, 2016
 * @version: 0.0.5 - Updated page
 */

namespace Meteor.Admin
{
    public partial class AdminGameList : System.Web.UI.Page
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

        /**
         *Gets the game to populate
         * @private
         * @method GetGames
         * @return {void}
         */
        protected void GetGames()
        {
            // Connect to EF
            using (TrackingConnection db = new TrackingConnection())
            {

                DateTime date1 = new DateTime();
                DateTime date2 = new DateTime();
                date1 = Convert.ToDateTime(TrackingWeekDropDown.SelectedValue);
                date2 = Convert.ToDateTime(TrackingWeekDropDown.Items[TrackingWeekDropDown.SelectedIndex + 1].Value);

                //query the Games table using EF and LINQ
                var Games = (from allGames in db.Games
                             where allGames.Created >= date1.Date
                             && allGames.Created < date2.Date
                             select allGames);

                //bind results to gridview
                GamesGridView.DataSource = Games.AsQueryable().ToList();
                GamesGridView.DataBind();
                TrackingDateLabel.Text = date1.ToString("MMMM dd, yyyy") + " To " + date2.ToString("MMMM dd, yyyy");
            }
        }

        /**
         * Init sorting
         * @private
         * @method TrackingWeekDropDown_SelectedIndexChanged
         * @return {void}
         */
        protected void TrackingWeekDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetGames();
        }

        /**
         * On Delete
         * @private
         * @method GamesGridView_RowDeleting
         * @return {void}
         */
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