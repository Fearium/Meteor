using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Required for EF DB Access
using Meteor.Models;
using System.Web.ModelBinding;


/**
 * @author: Jesse Baril - Austin Cameron
 * @date: June 24th, 2016
 * @version: 0.0.5 - Updated page
 */

namespace Meteor.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetUsers();
            }
        }

        /**
         * Gets the user to populate fields
         * relating to the current page
         * 
         * @private
         * @method GetUsers
         * @return {void}
         */
        protected void GetUsers()
        {
            using (UserConnection db = new UserConnection())
            {
                var Users = (from users in db.AspNetUsers
                             select users);
                UsersGridView.DataSource = Users.ToList();
                UsersGridView.DataBind();
            }
        }

        /**
         * On Delete
         * relating to the current page
         * 
         * @private
         * @method UsersGridView_RowDeleting
         * @return {void}
         */
        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int selectedRow = e.RowIndex;

            string UserID = UsersGridView.DataKeys[selectedRow].Values["Id"].ToString();

            using (UserConnection db = new UserConnection())
            {
                AspNetUser deletedUser = (from users in db.AspNetUsers
                                          where users.Id == UserID
                                          select users).FirstOrDefault();

                db.AspNetUsers.Remove(deletedUser);
                db.SaveChanges();
            }

            // Refresh the grid
            this.GetUsers();
        }
    }
}