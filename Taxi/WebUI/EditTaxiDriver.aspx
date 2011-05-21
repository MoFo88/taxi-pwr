<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditTaxiDriver.aspx.cs" Inherits="EditTaxiDriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="main">
    <div class="maintop"></div>
    <div class="content">
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">Edycja Taksówkarza</h1>

        <asp:Panel ID="p_AddForm" runat="server">

            <asp:Label ID="lb_Name" runat="server" AssociatedControlID="tb_Name" 
                Text="Imię"></asp:Label>
            <asp:TextBox ID="tb_Name" runat="server" style="margin-left: 0px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbName" runat="server" 
                ControlToValidate="tb_Name" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Surname" runat="server" Text="Nazwisko" 
                AssociatedControlID="tb_Surname"></asp:Label>
            <asp:TextBox ID="tb_Surname" runat="server" AutoPostBack=true></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbSurname" 
                runat="server" ControlToValidate="tb_Surname" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label6" runat="server" AssociatedControlID="tb_Login" 
                Text="Login"></asp:Label>
            <asp:TextBox ID="tb_Login" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Pesel" runat="server" Text="PESEL" 
                AssociatedControlID="tb_Pesel"></asp:Label>
            <asp:TextBox ID="tb_Pesel" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbPESEL" runat="server" 
                ControlToValidate="tb_Pesel" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorPesel" 
                runat="server" ControlToValidate="tb_Pesel" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lb_Street" runat="server" Text="Ulica" 
                AssociatedControlID="tb_Street"></asp:Label>
            <asp:TextBox ID="tb_Street" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbStreet" runat="server" 
                ControlToValidate="tb_Street" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_House_nr" runat="server" Text="Nr domu" 
                AssociatedControlID="tb_House_nr"></asp:Label>
            <asp:TextBox ID="tb_House_nr" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbAddress" 
                runat="server" ControlToValidate="tb_House_nr" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorHouseNr" 
                runat="server" ControlToValidate="tb_House_nr" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" Font-Italic="False" 
                ForeColor="Red" ValidationExpression="\d+([/]\d+)?"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lb_Postal_code" runat="server" AssociatedControlID="tb_Postal_code" 
                Text="Kod pocztowy"></asp:Label>
            <asp:TextBox ID="tb_Postal_code" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbPostalCode" 
                runat="server" ControlToValidate="tb_Postal_code" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPostcode" 
                runat="server" ControlToValidate="tb_Postal_code" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                ValidationExpression="\d{2}[-]\d{3}"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lb_City" runat="server" AssociatedControlID="tb_City" 
                Text="Miasto"></asp:Label>
            <asp:TextBox ID="tb_City" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_City" runat="server" 
                ControlToValidate="tb_City" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label5" runat="server" AssociatedControlID="tb_Telephone" 
                Text="Telefon"></asp:Label>
            <asp:TextBox ID="tb_Telephone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelephone" runat="server" 
                ControlToValidate="tb_Telephone" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorTelephone" 
                runat="server" ControlToValidate="tb_Telephone" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                ValidationExpression="\d+"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lb_E_mail" runat="server" Text="E-mail" 
                AssociatedControlID="tb_E_mail"></asp:Label>
            <asp:TextBox ID="tb_E_mail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" 
                runat="server" ControlToValidate="tb_E_mail" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />

            <asp:Panel ID="p_DriverInfo" runat="server">

            <asp:Label ID="lb_Licence_number" runat="server" Text="Nr licencji" 
                AssociatedControlID="tb_Licence_number"></asp:Label>
            <asp:TextBox ID="tb_Licence_number" runat="server"></asp:TextBox>
    

            <br />
            <asp:Label ID="lb_Registration_number" runat="server" 
                AssociatedControlID="tb_Registration_number" Text="Nr rejestracyjny"></asp:Label>
            <asp:TextBox ID="tb_Registration_number" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Taxi_number" runat="server" AssociatedControlID="tb_Taxi_number" 
                Text="Numer taksówki"></asp:Label>
            <asp:TextBox ID="tb_Taxi_number" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Car_model" runat="server" AssociatedControlID="ddl_Car_model" 
                Text="Typ samochodu"></asp:Label>
            <asp:DropDownList ID="ddl_Car_model" runat="server">
            </asp:DropDownList>
    
                <br />
                <asp:Label ID="Label1" runat="server" AssociatedControlID="tb_CarBrand" 
                    Text="Marka samochodu"></asp:Label>
                <asp:TextBox ID="tb_CarBrand" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" AssociatedControlID="tb_CarModel" 
                    Text="Model samochodu"></asp:Label>
                <asp:TextBox ID="tb_CarModel" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" AssociatedControlID="tb_ProductionYear" 
                    Text="Rok produkcji"></asp:Label>
                <asp:TextBox ID="tb_ProductionYear" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorProductionYear" 
                    runat="server" ControlToValidate="tb_ProductionYear" 
                    ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                    ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label4" runat="server" AssociatedControlID="tb_SeatPlaces" 
                    Text="Liczba miejsc"></asp:Label>
                <asp:TextBox ID="tb_SeatPlaces" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidatorSeatPlaces" runat="server" 
                    ControlToValidate="tb_ProductionYear" ErrorMessage="Zakres od 1 do 25" 
                    Font-Bold="True" ForeColor="Red" MaximumValue="25" MinimumValue="1"></asp:RangeValidator>
    
            </asp:Panel>

            <br />
            <asp:Label ID="lb_Submit" runat="server" AssociatedControlID="b_Submit" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Submit" runat="server" 
                Text="Zapisz zmiany" Width="127px" onclick="b_Submit_Click" /><br />
            <asp:Button ID="bt_Delete" runat="server"
                Text="Usuń pracownia" onclick="bt_Delete_Click" />

        </asp:Panel>
        <br />

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>
</asp:Content>

