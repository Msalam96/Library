<%@ Page Title="Edit Library" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibraryEdit.aspx.cs" Inherits="Library.LibraryEdit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Edit Library</h2>

    <fieldset>

        <div>
            <asp:label id="LocationNameLabel" runat="server" associatedcontrolid="LocationName" text="Location Name: " />
            <asp:textbox id="LocationName" runat="server" />
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

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>
    <div>
        <asp:button id="Cancel" runat="server" text="Cancel" onclick="Cancel_Click" />
    </div>

</asp:Content>
