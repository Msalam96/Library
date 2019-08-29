﻿using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class PatronList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select ID, LibraryCardNumber, FirstName, LastName, 
                    Address, City, State, Zipcode, EmailAddress
                    from Patron
                    order by LastName
                ");

                Patrons.DataSource = dt.Rows;
                Patrons.DataBind();
            }
        }
    }
}