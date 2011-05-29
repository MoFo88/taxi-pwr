<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrdersDone.aspx.cs" Inherits="OrdersDone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="main">
    <div class="maintop"></div>
    <div class="content">
    <div class="content2">
        <br class="clear noheight" />

        <div>
    
    <h1 id="h1_Title">Zrealizowane kursy</h1>

        <br />

        <asp:Panel ID="p_Orders" runat="server">
            <asp:GridView ID="gv_Orders" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="ds_Orders" ForeColor="#333333" 
                GridLines="None" AllowSorting="True" DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="course_date" HeaderText="Data" SortExpression="course_date" />
                    <asp:BoundField DataField="startpoint_name" HeaderText="Miejsce" SortExpression="startpoint_name" />
                    <asp:BoundField DataField="client_name" HeaderText="Klient" SortExpression="client_name" />
                    <asp:BoundField DataField="client_phone" HeaderText="Telefon" SortExpression="client_phone" />                  
                    <asp:BoundField DataField="dispatcher" HeaderText="Przyjął" SortExpression="dispatcher" />                   
                    <asp:BoundField DataField="driver" HeaderText="Taksówkarz" SortExpression="driver" />
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
    

            <asp:ObjectDataSource ID="ds_Orders" runat="server" 
                SelectMethod="getDoneOrdersView" TypeName="BLL.Repository">
            </asp:ObjectDataSource>
    
        </asp:Panel>

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>

</asp:Content>

