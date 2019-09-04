<%@ Page Title="Add Librarian" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrarianAdd.aspx.cs" Inherits="Library.LibrarianAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Add Librarian</h2>

    <fieldset>

        <div class="form-group row">
            <asp:label id="EmployeeNumberLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="EmployeeNumber" text="Employee #: " />
            <asp:textbox id="EmployeeNumber" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="FirstNameLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="FirstName" text="First Name: " />
            <asp:textbox id="FirstName" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="LastNameLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="LastName" text="Last Name: " />
            <asp:textbox id="LastName" runat="server" />

        </div>
        <div class="form-group row">
            <asp:label id="AddressLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="Address" text="Address: " />
            <asp:textbox id="Address" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="CityLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="City" text="City: " />
            <asp:textbox id="City" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="StateLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="State" text="State: " />
            <asp:textbox id="State" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="ZipCodeLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="ZipCode" text="Zip Code: " />
            <asp:textbox id="ZipCode" runat="server" />
        </div>

        <div class="form-group row">
            <asp:label id="EmailAddressLabel" class="col-sm-2 col-form-label" runat="server" associatedcontrolid="EmailAddress" text="Email Address: " />
            <asp:textbox id="EmailAddress" runat="server" />
        </div>

        <div>
            <asp:DropDownList id="LibraryList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Library" DataTextField="LocationName" DataValueField="ID" >
                <asp:ListItem Value="" Text="Select a Library" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="Library" runat="server" ConnectionString="<%$ ConnectionStrings:Lib2020ConnectionString %>" SelectCommand="SELECT [ID], [LocationName] FROM [Library] ORDER BY [LocationName]"></asp:SqlDataSource>
        </div>

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>

</asp:Content>
