<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookCopy.aspx.cs" Inherits="Library.BookCopy" %>
<%@ import namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Book Directory</h1>
        <fieldset>
            <div>
            <asp:label id="TitleLabel" runat="server" associatedcontrolid="BookTitle" text="Title: " />
            <asp:textbox id="BookTitle" runat="server" />
            </div>

            <div>
                <asp:label id="ISBNLabel" runat="server" associatedcontrolid="ISBN" text="ISBN: " />
                <asp:textbox id="ISBN" runat="server" />
            </div>

            <div>
                <asp:label id="AuthorLabel" runat="server" associatedcontrolid="Author" text="Author: " />
                <asp:textbox id="Author" runat="server" />
            </div>
        </fieldset>

        <fieldset>
            <h2>Copies</h2>
             <div>
                <asp:DropDownList id="LibraryList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Library" DataTextField="LocationName" DataValueField="ID" >
                    <asp:ListItem Value="" Text="Select a Library" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="Library" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [LocationName] FROM [Library] ORDER BY [LocationName]"></asp:SqlDataSource>
                <asp:Button ID="Add" Text="Add" onclick="Add_Click" runat="server" />
             </div>
            <div>
                <asp:repeater id="Libraries" runat="server" itemtype="DataRow">
                    <headertemplate>
                        <table>
                            <tr>
                                <th>Library</th>
                                <th></th>
                                <th>&nbsp;</th>
                            </tr>
                    </headertemplate>
                    <itemtemplate>
                        <tr>
                            <td><%# Item.Field<string>("LocationName") %></td>
                            <td><asp:button ID="Available" Text="Available" OnClick="Available_Click" CommandArgument='<%#Item.Field<int>("ID") %>' runat="server"/></td>
                            <td><asp:button ID="Unavailable" Text="Unavailable" OnClick="Unavailable_Click" CommandArgument='<%#Item.Field<int>("ID") %>' runat="server"/></td>
<%--                            <td><asp:hyperlink runat="server" navigateurl='<%# $"~/AuthorEdit.aspx?ID={Item.Field<int>("Id")}" %>' text="Edit" /></td>--%>
                        </tr>
                    </itemtemplate>
                    <footertemplate>
                        </table>
                    </footertemplate>
                </asp:repeater>
            </div>

        </fieldset>
   
    </form>
</body>
</html>
