<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Orders.aspx.cs" Inherits="Orders" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div>
    
    <h2>Dodaj nowe zgłoszenie</h2>

        <asp:Panel ID="Panel1" runat="server">

            <asp:Label ID="lb_Client_name" runat="server" Text="Nazwisko klienta" 
            AssociatedControlID="tb_Client_name"></asp:Label>
            <asp:TextBox ID="tb_Client_name" runat="server"></asp:TextBox>

            <br />

            <asp:Label ID="lb_Startpoint_name" runat="server" Text="Miejsce startowe" 
            AssociatedControlID="tb_Startpoint_name"></asp:Label>



            <asp:TextBox ID="tb_Startpoint_name" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Course_date" runat="server" AssociatedControlID="tb_Course_date" 
                Text="Data"></asp:Label>
            <asp:TextBox ID="tb_Course_date" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Client_phone" runat="server" AssociatedControlID="tb_Client_phone" 
                Text="Nr telefonu"></asp:Label>
            <asp:TextBox ID="tb_Client_phone" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_Add" runat="server" AssociatedControlID="b_Add" 
                Text="Akcje"></asp:Label>
            <asp:Button ID="b_Add" runat="server" onclick="b_Add_Click" 
                Text="Dodaj" />
            <br />

        </asp:Panel>
        <br />



    <h2>Lista zgłoszeń     <p>
            <asp:GridView ID="gd_Orders" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" 
                GridLines="None" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="taxidriver_id" HeaderText="taxidriver_id" 
                        ReadOnly="True" SortExpression="taxidriver_id" />
                    <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" 
                        SortExpression="date" />
                    <asp:BoundField DataField="startpoint_name" HeaderText="startpoint_name" 
                        ReadOnly="True" SortExpression="startpoint_name" />
                    <asp:BoundField DataField="course_date" HeaderText="course_date" 
                        ReadOnly="True" SortExpression="course_date" />
                    <asp:BoundField DataField="client_phone" HeaderText="client_phone" 
                        ReadOnly="True" SortExpression="client_phone" />
                    <asp:BoundField DataField="client_name" HeaderText="client_name" 
                        ReadOnly="True" SortExpression="client_name" />
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
                Select="new (taxidriver_id, date, startpoint_name, course_date, Course_status, client_phone, client_name)" 
                TableName="Courses">
            </asp:LinqDataSource>
        </p>

        </div>

</asp:Content>
