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
    public partial class BookEdit : System.Web.UI.Page
    {
        int bookID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out bookID))
            {
                Response.Redirect("~/BookList.aspx");
            }

            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Title, ISBN
                    from Book
                    where ID = @ID
                ", new SqlParameter("@ID", bookID));

                if (dt.Rows.Count == 1)
                {
                    BookTitle.Text = dt.Rows[0].Field<string>("Title");
                    ISBN.Text = dt.Rows[0].Field<string>("ISBN");
                }
                else
                {
                    Response.Redirect("~/BookList.aspx");
                }

               

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string title = BookTitle.Text;
            string isbn = ISBN.Text;
            int author_id = int.Parse(AuthorList.SelectedValue);

         
            DatabaseHelper.Update(@"
                update Book set
                    Title = @Title,
                    ISBN = @ISBN,
                    Author_ID = @Author_ID
                where ID = @ID
            ",
                new SqlParameter("@Title", title),
                new SqlParameter("@ISBN", isbn),
                new SqlParameter("@ID", bookID),
                new SqlParameter("@Author_ID", author_id));

            Response.Redirect("~/BookList.aspx");
            //Response.Redirect("~/AuthorsList.aspx");
        }


        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BookList.aspx");
        }

        
    }

}