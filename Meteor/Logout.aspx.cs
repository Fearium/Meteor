﻿using System;
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
 * @author: Jesse Baril - Austin Cameron
 * @date: June 24th, 2016
 * @version: 0.0.5 - Updated page
 */

namespace Meteor
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Store session info and authentication methods in the authenticationManager object
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            // Perform SignOut
            authenticationManager.SignOut();

            // Redirect to the Default page
            Response.Redirect("~/Login.aspx");
        }
    }
}