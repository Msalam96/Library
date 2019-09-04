<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibaryList.aspx.cs" Inherits="Library.LibraryList" %>
<%@ import namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Libraries</h2>

        <div>
            <asp:hyperlink runat="server" navigateurl="~/LibraryAdd.aspx">Add New Library</asp:hyperlink>
        </div>

        <asp:repeater id="Libraries" runat="server" itemtype="DataRow">
            <headertemplate>        
                <table class="table table-hover table-striped table-dark">                    
                    <tr>
                        <th scope="col">Location</th>
                        <th scope="col">Address</th>
                        <th scope="col">City</th>
                        <th scope="col">State</th>
                        <th scope="col">Zip Code</th>
                        <th>&nbsp;</th>
                    </tr>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td><%# Item.Field<string>("LocationName") %></td>
                    <td><%# Item.Field<string>("Address") %></td>
                    <td><%# Item.Field<string>("City") %></td>
                    <td><%# Item.Field<string>("State") %></td>
                    <td><%# Item.Field<string>("ZipCode") %></td>
                    <td><asp:hyperlink runat="server" navigateurl='<%# $"~/LibraryEdit.aspx?ID={Item.Field<int>("ID")}" %>' text="Edit" /></td>
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
