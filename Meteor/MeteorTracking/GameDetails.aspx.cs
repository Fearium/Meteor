using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Using statements required for EF DB acess
using Meteor.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

// Jesse Baril & Austin Cameron

namespace Meteor
{
    public partial class GameDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetGame();
            }
        }

        protected void GetGame()
        {
            // Populate the form with existing data from the database
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            // Connect to the EF DB
            using (TrackingConnection db = new TrackingConnection())
            {
                // Populate a department object instance with the GametID from the URL Parameter
                Game updatedGame = (from Game in db.Games
                                    where Game.GameID == GameID
                                    select Game).FirstOrDefault();

                // Map the Game properties to the form controls
                if (updatedGame != null)
                {
                    Player1TextBox.Text = updatedGame.Player1;
                    Player2TextBox.Text = updatedGame.Player2;
                    SpectatorsTextBox.Text = updatedGame.Spectators.ToString();
                    DescriptionTextArea.Text = updatedGame.Description;
                    WinningPlayerTextBox.Text = updatedGame.WinningPlayer;
                    DuelDateTextBox.Text = updatedGame.Created.ToString();
                }
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // Use EF to connect to the server
            using (TrackingConnection db = new TrackingConnection())
            {
                // Use the Student model to create a new student object and save a new record
                Game newGame = new Game();

                int GameID = 0;

                if (Request.QueryString.Count > 0) // URL has a DepartmentID in it
                {
                    // Get the id from the URL
                    GameID = Convert.ToInt32(Request.QueryString["GameID"]);

                    // Get the current student from EF DB
                    newGame = (from Game in db.Games
                               where Game.GameID == GameID
                               select Game).FirstOrDefault();
                }

                // Add data to the new student record
                newGame.GameName = "HearthStone Duel";
                newGame.Player1 = Player1TextBox.Text;
                newGame.Player2 = Player2TextBox.Text;
                newGame.Spectators = Convert.ToInt32(SpectatorsTextBox.Text);
                newGame.Description = DescriptionTextArea.Text;
                newGame.WinningPlayer = WinningPlayerTextBox.Text;
                newGame.Created = Convert.ToDateTime(DuelDateTextBox.Text);

                // Use LINQ to ADO.NET to add or insert new student into the database
                if (GameID == 0)
                {
                    db.Games.Add(newGame);
                }

                // Save our changes
                db.SaveChanges();

                // Redirect back to the updated students page
                Response.Redirect("~/GameList.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Redirect back to Students Page
            Response.Redirect("~/GameList.aspx");
        }
    }
}