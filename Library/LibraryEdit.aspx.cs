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
    public partial class LibraryEdit : System.Web.UI.Page
    {
        int libraryID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out libraryID))
            {
                Response.Redirect("~/LibraryList.aspx");
            }

            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select LocationName, Address, City, State, ZipCode
                    from Library
                    where ID = @ID
                ", new SqlParameter("@ID", libraryID));

                if (dt.Rows.Count == 1)
                {
                    LocationName.Text = dt.Rows[0].Field<string>("LocationName");
                    Address.Text = dt.Rows[0].Field<string>("Address");
                    City.Text = dt.Rows[0].Field<string>("City");
                    State.Text = dt.Rows[0].Field<string>("State");
                    ZipCode.Text = dt.Rows[0].Field<string>("ZipCode");
                }
                else
                {
                    Response.Redirect("~/LibraryList.aspx");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string locationName = LocationName.Text;
            string address = Address.Text;
            string city = City.Text;
            string state = State.Text;
            string zip = ZipCode.Text;

            DatabaseHelper.Update(@"
                update Library set
                    LocationName = @LocationName,
                    Address = @Address,
                    City = @City,
                    State = @State,
                    ZipCode = @ZipCode
                where ID = @ID
            ",
                new SqlParameter("@LocationName", locationName),
                new SqlParameter("@Address", address),
                new SqlParameter("@City", city),
                new SqlParameter("@State", state),
                new SqlParameter("@ZipCode", zip),
                new SqlParameter("@ID", libraryID));

            Response.Redirect("~/LibraryList.aspx");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AuthorsList.aspx");
        }
    }
}
