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

    <div>
        <asp:hyperlink runat="server" NavigateUrl="~/AuthorsList.aspx" Text="Authors"></asp:hyperlink>
    </div>
    
    <div>
        <asp:hyperlink runat="server" NavigateUrl="~/BookList.aspx" Text="Books"></asp:hyperlink>
    </div>
        
    <div>
        <asp:hyperlink runat="server" NavigateUrl="~/LibraryList.aspx" Text="Library"></asp:hyperlink>
    </div>

    </form>
</body>
</html>
