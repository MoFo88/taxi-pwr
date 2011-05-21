<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DeleteEmployee.aspx.cs" Inherits="DeleteEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="main">
    <div class="maintop"></div>
    <div class="content">
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">Potwierdzenie usunięcia</h1>

        <asp:Panel ID="p_AddForm" runat="server">
        <h2>Czy na pewno usunąć poniższego pracownika ?</h2>
            <p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="lb_name" Text="Imie"></asp:Label>
                <asp:Label ID="lb_name" runat="server" Text="Label"></asp:Label><br />             
                <asp:Label ID="Label2" runat="server" AssociatedControlID="lb_surname" Text="Nazwisko"></asp:Label>
                <asp:Label ID="lb_surname" runat="server" Text="Label"></asp:Label><br />               
                <asp:Label ID="Label4" runat="server" AssociatedControlID="lb_PESEL" Text="PESEL"></asp:Label>
                <asp:Label ID="lb_PESEL" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label6" runat="server" AssociatedControlID="lb_address" Text="Adres"></asp:Label>
                <asp:Label ID="lb_address" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label8" runat="server" AssociatedControlID="lb_city" Text="Miasto"></asp:Label>
                <asp:Label ID="lb_city" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label10" runat="server" AssociatedControlID="lb_phone" Text="Telefon"></asp:Label>
                <asp:Label ID="lb_phone" runat="server" Text="Label"></asp:Label><br />
            </p>
        </asp:Panel>
            <asp:Button ID="bt_Delete" runat="server" Text="Usuń" 
                onclick="bt_Delete_Click" /><br />
            <asp:Button ID="bt_Return" runat="server" Text="Powróć" 
                onclick="bt_Return_Click" />
        <br />

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>
</asp:Content>

