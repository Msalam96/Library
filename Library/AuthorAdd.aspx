<%@ Page Title="Add Author" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorAdd.aspx.cs" Inherits="Library.AuthorAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Add Author</h2>

    <fieldset>

        <div class="form-group row">
            <asp:label id="FirstNameLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="FirstName" text="First Name: " />
            <asp:textbox id="FirstName" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="LastNameLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="LastName" text="Last Name: " />
            <asp:textbox id="LastName" runat="server" />
        </div>

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>

</asp:Content>
