<%@ Page Title="CheckOutList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckoutList.aspx.cs" Inherits="Library.CheckoutList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Checked Out Books</h2>

        <asp:repeater id="Checkouts" runat="server" itemtype="DataRow">
            <headertemplate>
                <table class="table table-hover table-striped table-dark">
                    <tr>
                        <th class="col">Librarian</th>
                        <th class="col">Patron</th>
                        <th class="col">Book Title</th>
                        <th class="col">Library Location</th>
                        <th class="col">Check Out Date</th>
                        <th></th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("LibrarianName") %></td>
                    <td><%# Item.Field<string>("PatronName") %></td>
                    <td><%# Item.Field<string>("Title") %></td>
                    <td><%# Item.Field<string>("LocationName") %></td>
                    <td><%# Item.Field<DateTime>("CheckedOutOn") %></td>
<%--                    <td><%# Item.Field<string>("LastName") %></td>--%>

<%--                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/AuthorEdit.aspx?ID={Item.Field<int>("Id")}" %>' text="Edit" /></td>--%>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>


</asp:Content>
