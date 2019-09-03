<%@ Page Title="Patron" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatronList.aspx.cs" Inherits="Library.PatronList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Patrons</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/PatronAdd.aspx">Add New Patron</asp:hyperlink>
        </div>

        <asp:repeater id="Patrons" runat="server" itemtype="DataRow">
            <headertemplate>
                <table class="table table-hover table-striped table-dark">
                    <tr>
                        <th scope="col">Library Card Number</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
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
                    <td><%# Item.Field<string>("LibraryCardNumber") %></td>
                    <td><%# Item.Field<string>("FirstName") %></td>
                    <td><%# Item.Field<string>("LastName") %></td>
                    <td><%# Item.Field<string>("Address") %></td>
                    <td><%# Item.Field<string>("City") %></td>
                    <td><%# Item.Field<string>("State") %></td>
                    <td><%# Item.Field<string>("ZipCode") %></td>
                    <td><%# Item.Field<string>("EmailAddress") %></td>
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/PatronEdit.aspx?ID={Item.Field<int>("ID")}" %>' text="Edit" /></td>
                </tr>
            </itemtemplate>
            <footertemplate>
                </table>
            </footertemplate>
        </asp:repeater>


</asp:Content>
