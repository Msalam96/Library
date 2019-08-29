<%@ Page Title="Patron" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatronList.aspx.cs" Inherits="Library.PatronList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Patrons</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/PatronAdd.aspx">Add New Patron</asp:hyperlink>
        </div>

        <asp:repeater id="Patrons" runat="server" itemtype="DataRow">
            <headertemplate>
                <table>
                    <tr>
                        <th>Library Card Number</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip Code</th>
                        <th>Address</th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("LibraryCardNumber") %></td>
                    <td><%# Item.Field<string>("FirstName") %></td>
                    <td><%# Item.Field<string>("LastName") %></td>
                    <td><%# Item.Field<string>("Address") %></td>
                    <td><%# Item.Field<string>("City") %></td>
                    <td><%# Item.Field<string>("State") %></td>
                    <td><%# Item.Field<string>("ZipCode") %></td>
                    <td><%# Item.Field<string>("EmailAddress") %></td>
                    <%--<td><asp:hyperlink runat="server" navigateurl='<%# $"~/LibraryEdit.aspx?ID={Item.Field<int>("ID")}" %>' text="Edit" /></td>--%>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/Default.aspx">Return To Home Page</asp:hyperlink>
        </div>

</asp:Content>
