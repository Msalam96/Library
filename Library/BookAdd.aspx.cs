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
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Lib2020"].ConnectionString;

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

            string title = BookTitle.Text;
            string isbn = ISBN.Text;
  
            int? id = DatabaseHelper.Insert(@"
                insert into Book (Title, Author_ID, ISBN)
                values (@Title, @Author_ID, @ISBN);
            ",
                new SqlParameter("@Title", title),
                new SqlParameter("@ISBN", isbn),
                new SqlParameter("@Author_ID", author_id));

            Response.Redirect("~/BookList.aspx");
        }
    }
}