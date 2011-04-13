<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Admin_employees.aspx.cs" Inherits="admin_drivers" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div>
    
    <h2>Dodaj nowego pracownika</h2>

        <asp:Label ID="Label_name" runat="server" AssociatedControlID="Name" 
            Text="Imię"></asp:Label>
        <asp:TextBox ID="Name" runat="server" style="margin-left: 0px"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Nazwisko" 
            AssociatedControlID="Surname"></asp:Label>
        <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="PESEL" AssociatedControlID="Pesel"></asp:Label>
        <asp:TextBox ID="Pesel" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Adres" AssociatedControlID="Adres"></asp:Label>
        <asp:TextBox ID="Adres" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="E-mail" 
            AssociatedControlID="E_mail"></asp:Label>
        <asp:TextBox ID="E_mail" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Login" AssociatedControlID="Login"></asp:Label>
        <asp:TextBox ID="Login" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Hasło" 
            AssociatedControlID="Password"></asp:Label>
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label9" runat="server" AssociatedControlID="Employee_type" 
            Text="Typ pracownika"></asp:Label>
        <asp:DropDownList ID="Employee_type" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Nr licencji" 
            AssociatedControlID="Licence_number"></asp:Label>
        <asp:TextBox ID="Licence_number" runat="server"></asp:TextBox>
    

        <br />
        <asp:Label ID="Label10" runat="server" 
            AssociatedControlID="Registration_number" Text="Nr rejestracyjny"></asp:Label>
        <asp:TextBox ID="Registration_number" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label11" runat="server" AssociatedControlID="Taxi_number" 
            Text="Numer taksówki"></asp:Label>
        <asp:TextBox ID="Taxi_number" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label12" runat="server" AssociatedControlID="Car_model" 
            Text="Model samochodu"></asp:Label>
        <asp:DropDownList ID="Car_model" runat="server">
        </asp:DropDownList>
    

        <br />
        <asp:Label ID="Label8" runat="server" AssociatedControlID="Button_add" 
            Text="Akcje"></asp:Label>
        <asp:Button ID="Button_add" runat="server" Text="Dodaj" />

        <h2>Lista pracowników</h2>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    

        </div>

</asp:Content>
