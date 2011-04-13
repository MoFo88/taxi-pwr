<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Admin_employees.aspx.cs" Inherits="admin_drivers" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div>
    
    <h2>Dodaj nowe zgłoszenie</h2>

            <asp:Label ID="Label1" runat="server" Text="Nazwisko klienta" 
            AssociatedControlID="Client_name"></asp:Label>
            <asp:TextBox ID="Client_name" runat="server"></asp:TextBox>

            <br />

            <asp:Label ID="Label2" runat="server" Text="Miejsce startowe" 
            AssociatedControlID="Startpoint_name"></asp:Label>



        <asp:TextBox ID="Startpoint_name" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" AssociatedControlID="Course_date" 
            Text="Data"></asp:Label>
        <asp:TextBox ID="Course_date" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" AssociatedControlID="Client_phone" 
            Text="Nr telefonu"></asp:Label>
        <asp:TextBox ID="Client_phone" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" AssociatedControlID="Button_dodaj" 
            Text="Akcje"></asp:Label>
        <asp:Button ID="Button_dodaj" runat="server" Text="Button" />
        <br />



    <h2>Lista zgłoszeń</h2>

        </div>

</asp:Content>
