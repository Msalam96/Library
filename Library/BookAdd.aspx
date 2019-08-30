<%@ Page Title="Add Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookAdd.aspx.cs" Inherits="Library.BookAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<%@ import namespace="System.Data" %>

    <h2>Add Book</h2>

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
            <asp:DropDownList id="AuthorList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Author" DataTextField="Name" DataValueField="ID" >
                <asp:ListItem Value="" Text="Select an Author" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="Author" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [FirstName] + ' ' + [LastName] as Name FROM [Author] ORDER BY [LastName]"></asp:SqlDataSource>
        </div>

        <div>
            <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
        </div>

        <h3>Copies of Book</h3>

        <fieldset>
            <div>
                <asp:DropDownList id="LibraryList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Library" DataTextField="LocationName" DataValueField="ID" Visible="false">
                    <asp:ListItem Value="" Text="Select a Library" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="Library" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [LocationName] FROM [Library] ORDER BY [LocationName]"></asp:SqlDataSource>
                <asp:Button ID="AddLibrary" runat="server" text="Add" OnClick="AddLibrary_Click" Visible="false"/>
                <asp:repeater id="Libraries" runat="server" itemtype="DataRow">
                    <headertemplate>
                        <table>
                            <tr>
                                <th>Library Name</th>
                                <th>&nbsp;</th>
                            </tr>
                    </headertemplate>
                    <itemtemplate>
                        <tr>
                            <td><%# Item.Field<string>("LocationName") %></td>
                        </tr>
                    </itemtemplate>
                    <footertemplate>
                        </table>
                    </footertemplate>
        </asp:repeater>
            </div>
        </fieldset>
        
    </fieldset>

</asp:Content>
