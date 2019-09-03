<%@ Page Title="Librarians" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrariansList.aspx.cs" Inherits="Library.LibrariansList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Librarians</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/LibrarianAdd.aspx">Add New Librarian</asp:hyperlink>
        </div>

        <asp:repeater id="Librarians" runat="server" itemtype="DataRow">
            <headertemplate>
                <table class="table table-hover table-striped table-dark">
                    <tr>
                        <th scope="col">Employee Number</th>
                        <th scope="col">Library Name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</t>
                        <th scope="col">Address</th>
                        <th scope="col">City</th>
                        <th scope="col">State</th>
                        <th scope="col">Zip Code</th>
                        <th scope="col">Email Address</th>
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
