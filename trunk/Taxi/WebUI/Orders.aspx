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
        <asp:Button ID="Button_dodaj" runat="server" Text="Button" 
            onclick="Button_dodaj_Click" />
        <br />



    <h2>Lista zgłoszeń</h2>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="taxidriver_id" HeaderText="taxidriver_id" 
                        ReadOnly="True" SortExpression="taxidriver_id" />
                    <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" 
                        SortExpression="date" />
                    <asp:BoundField DataField="startpoint_name" HeaderText="startpoint_name" 
                        ReadOnly="True" SortExpression="startpoint_name" />
                    <asp:BoundField DataField="course_status_id" HeaderText="course_status_id" 
                        ReadOnly="True" SortExpression="course_status_id" />
                    <asp:BoundField DataField="course_date" HeaderText="course_date" 
                        ReadOnly="True" SortExpression="course_date" />
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
                Select="new (taxidriver_id, date, startpoint_name, course_status_id, course_date, Course_status)" 
                TableName="Courses">
            </asp:LinqDataSource>
        </p>

        </div>

</asp:Content>
