using Library.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Library
{
    public partial class BookAdd : System.Web.UI.Page
    {
        int? bookID = null;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["Lib2020"].ConnectionString;

            //int? ID = null;

            //int? author_id = null;
            //string lastName = AuthorList.SelectedValue;

            //DataTable dt = DatabaseHelper.Retrieve(@"
            //        select ID
            //        from Author
            //        where LastName = @LastName
            //    ", new SqlParameter("@LastName", lastName));

            //author_id = dt.Rows[0].Field<int>("Author_ID");

            int author_id = int.Parse(AuthorList.SelectedValue);
            //int library_id = int.Parse(LibraryList.SelectedValue);

            string title = BookTitle.Text;
            string isbn = ISBN.Text;
  
            bookID = DatabaseHelper.Insert(@"
                insert into Book (Title, Author_ID, ISBN)
                values (@Title, @Author_ID, @ISBN);
            ",
                new SqlParameter("@Title", title),
                new SqlParameter("@ISBN", isbn),
                new SqlParameter("@Author_ID", author_id));

            //if(Available.Text == "Available")
            //{
            //    available = 1;
            //}

            LibraryList.Visible = true;
            AddLibrary.Visible = true;
            //Response.Redirect("~/BookList.aspx");
        }

        protected void AddLibrary_Click(object sender, EventArgs e)
        {
            int library_id = int.Parse(LibraryList.SelectedValue);

            int? id = DatabaseHelper.Insert(@"
                insert into BookCopy (BookID, LibraryID, Available)
                values (@BookID, @LibraryID, @Available);
            ",
                new SqlParameter("@BookID", bookID),
                new SqlParameter("@LibraryID", library_id),
                new SqlParameter("@Available", 1));

            //DataTable dt = DatabaseHelper.Retrieve(@"
            //        select BookCopy.ID, Library.LocationName, Library.ID
            //        from BookCopy
            //        inner join Library
            //            on BookCopy.LibraryID = Library.ID
            //        order by Library.LocationName
            //    ");

            //Libraries.DataSource = dt.Rows;
            //Libraries.DataBind();

        }
    }
}