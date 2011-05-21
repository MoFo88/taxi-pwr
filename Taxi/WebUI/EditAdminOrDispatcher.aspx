<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditAdminOrDispatcher.aspx.cs" Inherits="EditAdminOrDispatcher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="main">
    <div class="maintop"></div>
    <div class="content">
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">Edycja Pracownika</h1>

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
            <asp:TextBox ID="tb_Surname" runat="server" ></asp:TextBox>
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

            <br />
            <asp:Label ID="lb_Submit" runat="server" AssociatedControlID="b_Submit" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Submit" runat="server" 
                Text="Zapisz zmiany" Width="127px" onclick="b_Submit_Click" />

            <br />
            <asp:Button ID="bt_Delete" runat="server" onclick="bt_Delete_Click" 
                Text="Usuń pracownika" />

        </asp:Panel>
        <br />

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>
</asp:Content>

