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
    public partial class LibrarianAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int employeeNumber = int.Parse(EmployeeNumber.Text);
            int libary_ID = int.Parse(LibraryList.SelectedValue);

            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string address = Address.Text;
            string city = City.Text;
            string state = State.Text;
            string zip = ZipCode.Text;
            string email = EmailAddress.Text;

            int? id = DatabaseHelper.Insert(@"
                insert into Librarian (EmployeeNumber, LibraryID, FirstName, LastName, Address, City, State, ZipCode, EmailAddress)
                values (@EmployeeNumber, @LibraryID, @FirstName, @LastName, @Address, @City, @State, @ZipCode, @EmailAddress);
            ",
                new SqlParameter("@EmployeeNumber", employeeNumber),
                new SqlParameter("@LibraryID", libary_ID),
                new SqlParameter("@FirstName", firstName),
                new SqlParameter("@LastName", lastName),
                new SqlParameter("@Address", address),
                new SqlParameter("@City", city),
                new SqlParameter("@State", state),
                new SqlParameter("@ZipCode", zip),
                new SqlParameter("@EmailAddress", email));

            Response.Redirect("~/LibrariansList.aspx");
        }

    }
}