using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Required for Identity and OWIN Security
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

/**
 * @author: Jesse Baril & Austin Cameron
 * @date: June 14th, 2016
 * @version: 0.0.5
 */

namespace Meteor
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    MeteorTrackingPlaceHolder.Visible = true;
                    PublicPlaceHolder.Visible = false;
                    UserPlaceHolder.Visible = false;

                    if (HttpContext.Current.User.Identity.GetUserName() == "admin")
                    {
                        UserPlaceHolder.Visible = true;
                    }
                }
                else
                {
                    MeteorTrackingPlaceHolder.Visible = false;
                    PublicPlaceHolder.Visible = true;
                    UserPlaceHolder.Visible = false;
                }
                SetActivePage();
            }
        }

        /**
         * This method adds a css class of "active" to list items
         * relating to the current page
         * 
         * @private
         * @method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Home":
                    home.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
                case "Games":
                    games.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
                case "Register":
                    register.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
                case "Contact":
                    contact.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
                case "Users":
                    users.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
                case "Logout":
                    logout.Attributes.Add("class", "menu__link menu__link--is-active");
                    break;
            }
        }
    }
}