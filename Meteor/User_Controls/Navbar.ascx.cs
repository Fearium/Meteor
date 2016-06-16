using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            SetActivePage();
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
            }
        }
    }
}