<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Admin_employees.aspx.cs" Inherits="admin_drivers" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript">
    function hideFieldSets() {
        $('#MainContent_p_LoginInfo').addClass('hiddenFieldSet');
        $('#MainContent_p_DriverInfo').addClass('hiddenFieldSet');
    };
    $(document).ready(function () {
        hideFieldSets();
        $('#MainContent_p_UserType').buttonset();
        $('input[type=submit]').button();
        $('input[type=radio]').change(function () {
            hideFieldSets();
            switch ($(this).val()) {
                case 'admin':
                    $('#MainContent_p_LoginInfo').removeClass('hiddenFieldSet');
                    return;
                case 'dispositor':
                    $('#MainContent_p_LoginInfo').removeClass('hiddenFieldSet');
                    return;
                case 'driver':
                    $('#MainContent_p_DriverInfo').removeClass('hiddenFieldSet');
                    return;
            };
        });
    });
</script>


</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<div class="main">
    <div class="maintop"></div>
    <div class="content">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">DODAWANIE/EDYCJA pracownika</h1>

        <asp:Panel ID="p_AddForm" runat="server">

        <asp:Panel ID="p_UserType" runat="server">

            <asp:Label ID="lb_UserType" runat="server" AssociatedControlID="rbl_UserType" 
                Text="Typ użytkownika"></asp:Label>
            <asp:RadioButtonList ID="rbl_UserType" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Value="admin">Administrator</asp:ListItem>
                <asp:ListItem Value="dispositor">Dyspozytor</asp:ListItem>
                <asp:ListItem Value="driver">Taksówkarz</asp:ListItem>
            </asp:RadioButtonList>

        </asp:Panel>

            <asp:Label ID="lb_Name" runat="server" AssociatedControlID="tb_Name" 
                Text="Imię"></asp:Label>
            <asp:TextBox ID="tb_Name" runat="server" style="margin-left: 0px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbName" runat="server" 
                ControlToValidate="tb_Name" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Surname" runat="server" Text="Nazwisko" 
                AssociatedControlID="tb_Surname"></asp:Label>
            <asp:TextBox ID="tb_Surname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbSurname" 
                runat="server" ControlToValidate="tb_Surname" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Pesel" runat="server" Text="PESEL" 
                AssociatedControlID="tb_Pesel"></asp:Label>
            <asp:TextBox ID="tb_Pesel" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbPESEL" runat="server" 
                ControlToValidate="tb_Pesel" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Street" runat="server" Text="Ulica" 
                AssociatedControlID="tb_Street"></asp:Label>
            <asp:TextBox ID="tb_Street" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_House_nr" runat="server" Text="Nr domu" 
                AssociatedControlID="tb_House_nr"></asp:Label>
            <asp:TextBox ID="tb_House_nr" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbAddress" 
                runat="server" ControlToValidate="tb_House_nr" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_Postal_code" runat="server" AssociatedControlID="tb_Postal_code" 
                Text="Kod pocztowy"></asp:Label>
            <asp:TextBox ID="tb_Postal_code" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_tbPostalCode" 
                runat="server" ControlToValidate="tb_Postal_code" ErrorMessage="Wymagane pole" 
                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_City" runat="server" AssociatedControlID="tb_City" 
                Text="Miasto"></asp:Label>
            <asp:TextBox ID="tb_City" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_City" runat="server" 
                ControlToValidate="tb_City" ErrorMessage="Wymagane pole" Font-Bold="True" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lb_E_mail" runat="server" Text="E-mail" 
                AssociatedControlID="tb_E_mail"></asp:Label>
            <asp:TextBox ID="tb_E_mail" runat="server"></asp:TextBox>
            <br />

            <asp:Panel ID="p_LoginInfo" runat="server">

            <asp:Label ID="lb_Login" runat="server" Text="Login" 
                AssociatedControlID="tb_Login"></asp:Label>
            <asp:TextBox ID="tb_Login" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Password" runat="server" Text="Hasło" 
                AssociatedControlID="tb_Password"></asp:Label>
            <asp:TextBox ID="tb_Password" runat="server"></asp:TextBox>
            <br />

            </asp:Panel>

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
                Text="Model samochodu"></asp:Label>
            <asp:DropDownList ID="ddl_Car_model" runat="server">
            </asp:DropDownList>
    
            </asp:Panel>

            <br />
            <asp:Label ID="lb_Add" runat="server" AssociatedControlID="b_Add" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Submit" runat="server" 
                onclick="b_Add_Click" Text="Dodaj/Zmień" />

        </asp:Panel>
        <br />

        <asp:Panel ID="p_EmployeesList" runat="server">
            <h2>
                Lista pracowników</h2>
            <asp:GridView ID="gv_Employees" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="ds_Employees" ForeColor="#333333" 
                GridLines="None" AllowSorting="True" 
                onselectedindexchanged="gv_Employees_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="position_name" HeaderText="position_name" 
                        SortExpression="position_name" />
                    <asp:BoundField DataField="licence_number" HeaderText="licence_number" 
                        SortExpression="licence_number" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="surname" HeaderText="surname" 
                        SortExpression="surname" />
                    <asp:BoundField DataField="employee_type_id" HeaderText="employee_type_id" 
                        SortExpression="employee_type_id" />
                    <asp:BoundField DataField="telephone" HeaderText="telephone" 
                        SortExpression="telephone" />
                    <asp:ButtonField CommandName="Delete" Text="del" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" 
                        DataNavigateUrlFormatString="Admin_employees.aspx?edit={0}" Text="edit" />
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

    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>
    

            <asp:ObjectDataSource ID="ds_Employees" runat="server" 
                SelectMethod="GetAllTaxiDrivers" TypeName="BLL.Repository">
            </asp:ObjectDataSource>
    
        </asp:Panel>

        </div>

    </div>
    <div class="mainbottom"></div>
</div>


</asp:Content>
