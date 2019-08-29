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
    public partial class LibraryAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string locationName = LocationName.Text;
            string address = Address.Text;
            string city = City.Text;
            string state = State.Text;
            string zip = ZipCode.Text;

            int? id = DatabaseHelper.Insert(@"
                insert into Library (LocationName, Address, City, State, ZipCode)
                values (@LocationName, @Address, @City, @State, @ZipCode);
            ",
                new SqlParameter("@LocationName", locationName),
                new SqlParameter("@Address", address),
                new SqlParameter("@City", city),
                new SqlParameter("@State", state),
                new SqlParameter("@ZipCode", zip));

            Response.Redirect("~/LibraryList.aspx");
        }
    }
}