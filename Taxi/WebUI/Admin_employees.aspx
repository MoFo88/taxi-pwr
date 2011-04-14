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
        <asp:Label ID="Label3" runat="server" Text="Adres / nr domu" 
            AssociatedControlID="House_nr"></asp:Label>
        <asp:TextBox ID="House_nr" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label13" runat="server" AssociatedControlID="Postal_code" 
            Text="Kod pocztowy"></asp:Label>
        <asp:TextBox ID="Postal_code" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" AssociatedControlID="City" Text="Miasto"></asp:Label>
        <asp:TextBox ID="City" runat="server"></asp:TextBox>
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
        <asp:Label ID="Label8" runat="server" AssociatedControlID="Button_add_employee" 
            Text="Akcje"></asp:Label>
        <asp:Button ID="Button_add_employee" runat="server" 
            onclick="Button_add_employee_Click" Text="Button" />

        <h2>Lista pracowników</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="name" ReadOnly="True" 
                    SortExpression="name" />
                <asp:BoundField DataField="surname" HeaderText="surname" ReadOnly="True" 
                    SortExpression="surname" />
                <asp:BoundField DataField="pesel" HeaderText="pesel" ReadOnly="True" 
                    SortExpression="pesel" />
                <asp:BoundField DataField="login" HeaderText="login" ReadOnly="True" 
                    SortExpression="login" />
                <asp:BoundField DataField="password" HeaderText="password" ReadOnly="True" 
                    SortExpression="password" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="DAL.TaxiDataClassesDataContext" EntityTypeName="" 
            Select="new (name, surname, pesel, login, password, Employee_type)" 
            TableName="Employees">
        </asp:LinqDataSource>
    

        </div>

</asp:Content>
