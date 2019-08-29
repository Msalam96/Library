<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>WELCOME TO THE LIBRARY DATABASE</h1>
    </div>

     <ul>
        <li><asp:hyperlink runat="server" navigateurl="~/AuthorsList.aspx">Authors</asp:hyperlink></li>
        <li><asp:hyperlink runat="server" navigateurl="~/BookList.aspx">Books</asp:hyperlink></li>
        <li><asp:hyperlink runat="server" navigateurl="~/LibraryList.aspx">Libraries</asp:hyperlink></li>
         <li><asp:hyperlink runat="server" navigateurl="~/PatronList.aspx">Patrons</asp:hyperlink></li>
     </ul>

    </form>
</body>
</html>
