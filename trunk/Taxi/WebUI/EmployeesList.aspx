<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="EmployeesList.aspx.cs" Inherits="employeeList" %>


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
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">DODAWANIE/EDYCJA pracownika</h1>

        <br />

        <asp:Panel ID="p_EmployeesList" runat="server">
            <h2>
                Lista pracowników</h2>
            <asp:GridView ID="gv_Employees" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="ds_Employees" ForeColor="#333333" 
                GridLines="None" AllowSorting="True" DataKeyNames="id"
                onselectedindexchanged="gv_Employees_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="Imie" />
                    <asp:BoundField DataField="surname" HeaderText="Nazwisko" 
                        SortExpression="surname" />
                    <asp:BoundField DataField="employee_type_id" HeaderText="Typ" 
                        SortExpression="employee_type_id" />                    
                    <asp:BoundField DataField="pesel" HeaderText="PESEL" 
                        SortExpression="pesel" />
                    <asp:CommandField HeaderText="Wybierz" ShowSelectButton="True" />
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
                SelectMethod="GetAllEmployees" TypeName="BLL.Repository">
            </asp:ObjectDataSource>
    
        </asp:Panel>

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>


</asp:Content>
