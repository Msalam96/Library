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
    public partial class CheckoutList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DatabaseHelper.Retrieve(@"
                    select PatronCheckout.ID, PatronCheckout.PatronID, PatronCheckout.BookCopyID, PatronCheckout.LibrarianID, PatronCheckout.CheckedOutOn,
                    Librarian.LastName + ', ' + Librarian.FirstName as LibrarianName,
                    Patron.LastName + ',' + Patron.FirstName as PatronName,
                    BookCopy.BookID, BookCopy.LibraryID,
                    Book.Title, Library.LocationName
                    from PatronCheckout
                    inner join Librarian
                        on Librarian.ID = PatronCheckout.LibrarianID
                    inner join Patron
                        on Patron.ID = PatronCheckout.PatronID
                    inner join BookCopy
                        on BookCopy.ID = PatronCheckout.BookCopyID
                    inner join Book
                        on Book.ID = BookCopy.BookID
                    inner join Library
                        on Library.ID = BookCopy.LibraryID
                ");

            Checkouts.DataSource = dt.Rows;
            Checkouts.DataBind();
        }
    }
}