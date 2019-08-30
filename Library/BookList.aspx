<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="Library.BookList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Book</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/BookAdd.aspx">Add New Book</asp:hyperlink>
        </div>

        <asp:repeater id="Books" runat="server" itemtype="DataRow">
            <headertemplate>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>ISBN</th>
                        <th>Author Name</th>
                        <th></th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("Title") %></td>
                    <td><%# Item.Field<string>("ISBN") %></td>
                    <td><%# Item.Field<string>("Name") %></td>
<%--                    <td><%# Item.Field<string>("LastName") %></td>--%>
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/BookEdit.aspx?ID={Item.Field<int>("ID")}" %>' text="Edit" /></td>
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/BookCopy.aspx?ID={Item.Field<int>("ID")}" %>' text="Copies" /></td>
<%--                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/AuthorEdit.aspx?ID={Item.Field<int>("Id")}" %>' text="Edit" /></td>--%>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>


</asp:Content>
