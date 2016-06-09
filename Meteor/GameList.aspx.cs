using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Using statements that are required to connect to EF DB
using Meteor.Models;
using System.Web.ModelBinding;

namespace Meteor
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If loading the page for the first time, populate the student grid
            if (!IsPostBack)
            {
                // Get the student data
                this.GetStudents();
            }
        }

        /**
         * <summary>
         * This method gets the student data from the DB
         * </summary>
         * 
         * @method GetStudents
         * @returns {void}
         */

        protected void GetStudents()
        {
            // Connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // Query the Students Table using EF and LINQ
                var Students = (from allStudents in db.Students
                                select allStudents);

                // Bind the result to the GridView
                StudentsGridView.DataSource = Students.ToList();
                StudentsGridView.DataBind();
            }
        }
    }
}