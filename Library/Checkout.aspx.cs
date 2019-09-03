using Library.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class Checkout : System.Web.UI.Page
    {
        int bookCopyID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out bookCopyID))
            {
                Response.Redirect("~/BookList.aspx");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int patronID = int.Parse(PatronList.SelectedValue);
            int librarianID = int.Parse(LibrarianList.SelectedValue);

            DateTime checkoutDate = DateTime.Now;
            var date = checkoutDate.Date;

            DatabaseHelper.Insert(@"
                insert into PatronCheckout (LibrarianID, PatronID, BookCopyID, CheckedOutOn)
                values (@LibrarianID, @PatronID, @BookCopyID, @CheckedOutOn);
            ",
                new SqlParameter("@LibrarianID", librarianID),
                new SqlParameter("@PatronID", patronID),
                new SqlParameter("@BookCopyID", bookCopyID),
                new SqlParameter("CheckedOutOn", date));

            Response.Redirect("~/BookList.aspx");
        }


    }
}