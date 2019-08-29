using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class LibrariansList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Librarian.ID, Librarian.LibraryID, Librarian.EmployeeNumber, 
                    Librarian.FirstName, Librarian.LastName, 
                    Librarian.Address, Librarian.City, Librarian.State, Librarian.Zipcode, Librarian.EmailAddress,
                    Library.LocationName
                    from Librarian
                    inner join Library 
                    on Library.ID = Librarian.LibraryID
                    order by LastName
                ");

                Librarians.DataSource = dt.Rows;
                Librarians.DataBind();
            }
        }
    }
}