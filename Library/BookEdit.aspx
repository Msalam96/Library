<%@ Page Title="Edit Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookEdit.aspx.cs" Inherits="Library.BookEdit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

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
        
</fieldset>

    

<div>
    <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
</div>

</asp:Content>
