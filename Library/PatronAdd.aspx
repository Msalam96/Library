<%@ Page Title="Add Patron" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatronAdd.aspx.cs" Inherits="Library.PatronAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Add Patron</h2>

    <fieldset>

        <div>
            <asp:label id="LibraryCardNumberLabel" runat="server" associatedcontrolid="LibraryCardNumber" text="Library Card #: " />
            <asp:textbox id="LibraryCardNumber" runat="server" />
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

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>

</asp:Content>
