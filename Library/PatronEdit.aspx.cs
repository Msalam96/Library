using Library.Data;
using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class PatronEdit : System.Web.UI.Page
    {
        int patronID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out patronID))
            {
                Response.Redirect("~/PatronList.aspx");
            }

            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select LibraryCardNumber, FirstName, LastName,
                    Address, City, State, ZipCode, EmailAddress
                    from Patron
                    where ID = @ID
                ", new SqlParameter("@ID", patronID));

                if (dt.Rows.Count == 1)
                {
                    LibraryCardNumber.Text = dt.Rows[0].Field<string>("LibraryCardNumber");
                    FirstName.Text = dt.Rows[0].Field<string>("FirstName");
                    LastName.Text = dt.Rows[0].Field<string>("LastName");
                    Address.Text = dt.Rows[0].Field<string>("Address");
                    City.Text = dt.Rows[0].Field<string>("City");
                    State.Text = dt.Rows[0].Field<string>("State");
                    ZipCode.Text = dt.Rows[0].Field<string>("ZipCode");
                    EmailAddress.Text = dt.Rows[0].Field<string>("EmailAddress");
                }
                else
                {
                    Response.Redirect("~/PatronList.aspx");
                }
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PatronList.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string librarycardNumber = LibraryCardNumber.Text;
            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string address = Address.Text;
            string city = City.Text;
            string state = State.Text;
            string zip = ZipCode.Text;
            string email = EmailAddress.Text;

            DatabaseHelper.Update(@"
                update Patron set
                    LibraryCardNumber = @LibraryCardNumber,
                    FirstName = @FirstName,
                    LastName = @LastName,
                    Address = @Address,
                    City = @City,
                    State = @State,
                    ZipCode = @ZipCode,
                    EmailAddress = @EmailAddress
                where ID = @ID
            ",
                new SqlParameter("@LibraryCardNumber", librarycardNumber),
                new SqlParameter("@FirstName", firstName),
                new SqlParameter("@LastName", lastName),
                new SqlParameter("@Address", address),
                new SqlParameter("@City", city),
                new SqlParameter("@State", state),
                new SqlParameter("@ZipCode", zip),
                new SqlParameter("@EmailAddress", email),
                new SqlParameter("@ID", patronID));

            Response.Redirect("~/PatronList.aspx");
        }
    }
}