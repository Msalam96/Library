using Library.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class BookCopy : System.Web.UI.Page
    {
        int bookID = 0;
        int library_id = 0;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out bookID))
            {
                Response.Redirect("~/BookList.aspx");
            }

            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Book.Title, Book.ISBN, Author.FirstName + ' ' + Author.LastName as Name
                    from Book
                    inner join Author
                        on Author.ID = Book.Author_ID
                    where Book.ID = @ID
                ", new SqlParameter("@ID", bookID));

                if (dt.Rows.Count == 1)
                {
                    BookTitle.Text = dt.Rows[0].Field<string>("Title");
                    ISBN.Text = dt.Rows[0].Field<string>("ISBN");
                    Author.Text = dt.Rows[0].Field<string>("Name");
                    BookTitle.Enabled = false;
                    ISBN.Enabled = false;
                    Author.Enabled = false;
                }
                else
                {
                    Response.Redirect("~/BookList.aspx");
                }

                DataTable dt2 = DatabaseHelper.Retrieve(@"
                    select Library.LocationName, BookCopy.ID
                    from BookCopy
                    inner join Library
                        on Library.ID = BookCopy.LibraryID
                    where BookCopy.BookID = @ID 
                ", new SqlParameter("@ID", bookID));

                Libraries.DataSource = dt2.Rows;
                Libraries.DataBind();
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            library_id = int.Parse(LibraryList.SelectedValue);

            DatabaseHelper.Insert(@"
                insert into BookCopy (BookID, LibraryID, Available)
                values (@BookID, @LibraryID, @Available);
            ",
                new SqlParameter("@BookID", bookID),
                new SqlParameter("@LibraryID", library_id),
                new SqlParameter("@Available", 1));
  
            Response.Redirect(Request.RawUrl);

        }

        protected void Available_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            int id = int.Parse(button.CommandArgument);

            DatabaseHelper.Update(@"
                update BookCopy set
                    Available = @Available
                where ID = @ID
            ",
            new SqlParameter("@Available", 1),
            new SqlParameter("@ID", id));

        }

        protected void Unavailable_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            int id = int.Parse(button.CommandArgument);

            int bit = 0;
            DatabaseHelper.Update(@"
                update BookCopy set
                    Available = @Available
                where ID = @ID
            ",
                new SqlParameter("@Available", bit),
                new SqlParameter("@ID", id));
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
           

        }
    }
}
