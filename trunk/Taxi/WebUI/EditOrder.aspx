<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditOrder.aspx.cs" Inherits="EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBeforeForm" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="main">
    <div class="maintop"></div>
    <div class="content">
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">Edycja kursu</h1>

        <asp:Panel ID="p_AddForm" runat="server">

            <asp:Label ID="lb_clientNameAndSurname" runat="server" AssociatedControlID="tb_clientNameAndSurname" 
                Text="Klient"></asp:Label>
            <asp:TextBox ID="tb_clientNameAndSurname" runat="server" style="margin-left: 0px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbName" runat="server" 
                ControlToValidate="tb_clientNameAndSurname" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Date" runat="server" Text="Data" 
                AssociatedControlID="tb_date"></asp:Label>
            <asp:TextBox ID="tb_Date" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbDate" 
                runat="server" ControlToValidate="tb_Date" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label6" runat="server" AssociatedControlID="tb_Destination" 
                Text="Miejsce"></asp:Label>
            <asp:TextBox ID="tb_Destination" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbDestination" 
                runat="server" ControlToValidate="tb_Destination" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Phone" runat="server" Text="Telefon" 
                AssociatedControlID="tb_Phone"></asp:Label>
            <asp:TextBox ID="tb_Phone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbPhone" runat="server" 
                ControlToValidate="tb_Phone" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorPesel" 
                runat="server" ControlToValidate="tb_Phone" 
                ErrorMessage="Niepoprawny format danych" Font-Bold="True" ForeColor="Red" 
                ValidationExpression="(\d{9})|(\d{7})"></asp:RegularExpressionValidator>
            <br />
        </asp:Panel>
        
        <asp:Panel ID="pl_Actions" runat="server">
            <br />
            <asp:Label ID="lb_Submit" runat="server" AssociatedControlID="b_Submit" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Submit" runat="server" 
                Text="Zapisz zmiany" Width="127px" onclick="b_Submit_Click" /><br />
            <asp:Button ID="bt_Delete" runat="server"
                Text="Usuń kurs" onclick="bt_Delete_Click" />
        </asp:Panel>
        <br />

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>
</asp:Content>

