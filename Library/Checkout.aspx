<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Library.Checkout" %>
<%@ import namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Checkout</h2>

    <fieldset>

        <div class="form-group row">
            <asp:DropDownList id="LibrarianList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Librarian" DataTextField="Name" DataValueField="ID">
                <asp:ListItem Value="" Text="Select a Librarian" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="Librarian" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [FirstName] + ' ' + [LastName] as Name FROM [Librarian] ORDER BY [LastName]"></asp:SqlDataSource>
        </div>

        <div class="form-group row">
            <asp:DropDownList id="PatronList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Patron" DataTextField="Name" DataValueField="ID">
                <asp:ListItem Value="" Text="Select a Patron" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="Patron" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [FirstName] + ' ' + [LastName] as Name FROM [Patron] ORDER BY [LastName]"></asp:SqlDataSource>
        </div>

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>

    </div>
    </form>
</body>
</html>
