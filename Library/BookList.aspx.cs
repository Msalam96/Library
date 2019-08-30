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
    public partial class BookList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Book.ID, Book.Title, Book.ISBN, Book.Author_ID,
                    Author.LastName + ', ' + Author.FirstName as Name
                    from Book
                    inner join Author
                        on Author.ID = Book.Author_ID
                    order by Title
                ");

                Books.DataSource = dt.Rows;
                Books.DataBind();
            }
        }
    }
}