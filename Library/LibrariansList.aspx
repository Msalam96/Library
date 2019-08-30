<%@ Page Title="Librarians" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrariansList.aspx.cs" Inherits="Library.LibrariansList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Librarians</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/LibrarianAdd.aspx">Add New Librarian</asp:hyperlink>
        </div>

        <asp:repeater id="Librarians" runat="server" itemtype="DataRow">
            <headertemplate>
                <table>
                    <tr>
                        <th>Employee Number</th>
                        <th>Library Name</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Zip Code</th>
                        <th>Email Address</th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<int>("EmployeeNumber") %></td>
                    <td><%# Item.Field<string>("LocationName") %></td>
                    <td><%# Item.Field<string>("FirstName") %></td>
                    <td><%# Item.Field<string>("LastName") %></td>
                    <td><%# Item.Field<string>("Address") %></td>
                    <td><%# Item.Field<string>("City") %></td>
                    <td><%# Item.Field<string>("State") %></td>
                    <td><%# Item.Field<string>("ZipCode") %></td>
                    <td><%# Item.Field<string>("EmailAddress") %></td>
<%--                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/PatronEdit.aspx?ID={Item.Field<int>("ID")}" %>' text="Edit" /></td>--%>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>

   

</asp:Content>
