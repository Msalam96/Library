<%@ Page Title="Add Librarian" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrarianAdd.aspx.cs" Inherits="Library.LibrarianAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Add Librarian</h2>

    <fieldset>

        <div>
            <asp:label id="EmployeeNumberLabel" runat="server" associatedcontrolid="EmployeeNumber" text="Employee #: " />
            <asp:textbox id="EmployeeNumber" runat="server" />
        </div>

        <div>
            <asp:label id="FirstNameLabel" runat="server" associatedcontrolid="FirstName" text="First Name: " />
            <asp:textbox id="FirstName" runat="server" />
        </div>

        <div>
            <asp:label id="LastNameLabel" runat="server" associatedcontrolid="LastName" text="Last Name: " />
            <asp:textbox id="LastName" runat="server" />

        </div>
        <div>
            <asp:label id="AddressLabel" runat="server" associatedcontrolid="Address" text="Address: " />
            <asp:textbox id="Address" runat="server" />
        </div>

        <div>
            <asp:label id="CityLabel" runat="server" associatedcontrolid="City" text="City: " />
            <asp:textbox id="City" runat="server" />
        </div>

        <div>
            <asp:label id="StateLabel" runat="server" associatedcontrolid="State" text="State: " />
            <asp:textbox id="State" runat="server" />
        </div>

        <div>
            <asp:label id="ZipCodeLabel" runat="server" associatedcontrolid="ZipCode" text="Zip Code: " />
            <asp:textbox id="ZipCode" runat="server" />
        </div>

        <div>
            <asp:label id="EmailAddressLabel" runat="server" associatedcontrolid="EmailAddress" text="Email Address: " />
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
