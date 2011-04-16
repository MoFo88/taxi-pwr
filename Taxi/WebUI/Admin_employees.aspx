<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Admin_employees.aspx.cs" Inherits="admin_drivers" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div>
    
    <h2>Dodaj nowego pracownika</h2>

        <asp:Panel ID="p_AddForm" runat="server">

            <asp:Label ID="lb_Name" runat="server" AssociatedControlID="tb_Name" 
                Text="Imię"></asp:Label>
            <asp:TextBox ID="tb_Name" runat="server" style="margin-left: 0px"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Surname" runat="server" Text="Nazwisko" 
                AssociatedControlID="tb_Surname"></asp:Label>
            <asp:TextBox ID="tb_Surname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Pesel" runat="server" Text="PESEL" 
                AssociatedControlID="tb_Pesel"></asp:Label>
            <asp:TextBox ID="tb_Pesel" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_House_nr" runat="server" Text="Adres / nr domu" 
                AssociatedControlID="tb_House_nr"></asp:Label>
            <asp:TextBox ID="tb_House_nr" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Postal_code" runat="server" AssociatedControlID="tb_Postal_code" 
                Text="Kod pocztowy"></asp:Label>
            <asp:TextBox ID="tb_Postal_code" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_City" runat="server" AssociatedControlID="tb_City" 
                Text="Miasto"></asp:Label>
            <asp:TextBox ID="tb_City" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_E_mail" runat="server" Text="E-mail" 
                AssociatedControlID="tb_E_mail"></asp:Label>
            <asp:TextBox ID="tb_E_mail" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Login" runat="server" Text="Login" 
                AssociatedControlID="tb_Login"></asp:Label>
            <asp:TextBox ID="tb_Login" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Password" runat="server" Text="Hasło" 
                AssociatedControlID="tb_Password"></asp:Label>
            <asp:TextBox ID="tb_Password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Employee_type" runat="server" AssociatedControlID="ddl_Employee_type" 
                Text="Typ pracownika"></asp:Label>
            <asp:DropDownList ID="ddl_Employee_type" runat="server">
            </asp:DropDownList>
            <br />
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
    

            <br />
            <asp:Label ID="lb_Add" runat="server" AssociatedControlID="b_Add" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Add" runat="server" 
                onclick="b_Add_Click" Text="Button" />

        </asp:Panel>
        <br />

        <asp:Panel ID="p_EmployeesList" runat="server">
            <h2>
                Lista pracowników</h2>
            <asp:GridView ID="gv_Employees" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" 
                GridLines="None" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="taxi_id" HeaderText="taxi_id" 
                        SortExpression="taxi_id" />
                    <asp:BoundField DataField="position_name" HeaderText="position_name" 
                        SortExpression="position_name" />
                    <asp:BoundField DataField="position_lon" HeaderText="position_lon" 
                        SortExpression="position_lon" />
                    <asp:BoundField DataField="driver_status_id" HeaderText="driver_status_id" 
                        SortExpression="driver_status_id" />
                    <asp:BoundField DataField="position_lat" HeaderText="position_lat" 
                        SortExpression="position_lat" />
                    <asp:BoundField DataField="licence_number" HeaderText="licence_number" 
                        SortExpression="licence_number" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="surname" HeaderText="surname" 
                        SortExpression="surname" />
                    <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
                    <asp:BoundField DataField="house_nr" HeaderText="house_nr" 
                        SortExpression="house_nr" />
                    <asp:BoundField DataField="postal_code" HeaderText="postal_code" 
                        SortExpression="postal_code" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="e_mail" HeaderText="e_mail" 
                        SortExpression="e_mail" />
                    <asp:BoundField DataField="employee_type_id" HeaderText="employee_type_id" 
                        SortExpression="employee_type_id" />
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                    <asp:BoundField DataField="password" HeaderText="password" 
                        SortExpression="password" />
                    <asp:BoundField DataField="salt" HeaderText="salt" SortExpression="salt" />
                    <asp:BoundField DataField="telephone" HeaderText="telephone" 
                        SortExpression="telephone" />
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
    

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="GetAllTaxiDrivers" TypeName="BLL.Repository">
            </asp:ObjectDataSource>
    
        </asp:Panel>

        </div>

</asp:Content>
