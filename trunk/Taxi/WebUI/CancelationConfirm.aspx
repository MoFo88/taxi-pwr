<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CancelationConfirm.aspx.cs" Inherits="CancelationConfirm" %>

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
    
    <h1 id="h1_Title">Potwierdzenie</h1>

        <asp:Panel ID="p_AddForm" runat="server">
        <h2>Czy na pewno anulować poniższy kurs ?</h2>
            <p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="lb_client" Text="Klient"></asp:Label>
                <asp:Label ID="lb_client" runat="server" Text="Label"></asp:Label><br />             
                <asp:Label ID="Label2" runat="server" AssociatedControlID="lb_phone" Text="Telefon"></asp:Label>
                <asp:Label ID="lb_phone" runat="server" Text="Label"></asp:Label><br />               
                <asp:Label ID="Label4" runat="server" AssociatedControlID="lb_destination" Text="Miejsce"></asp:Label>
                <asp:Label ID="lb_destination" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label6" runat="server" AssociatedControlID="lb_date" Text="Data"></asp:Label>
                <asp:Label ID="lb_date" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label8" runat="server" AssociatedControlID="lb_dispatcher" Text="Dyspozytor"></asp:Label>
                <asp:Label ID="lb_dispatcher" runat="server" Text="Label"></asp:Label><br />              
                <asp:Label ID="Label3" runat="server" AssociatedControlID="lb_driver" Text="Taksówkarz"></asp:Label>
                <asp:Label ID="lb_driver" runat="server" Text="Label"></asp:Label><br />
            </p>
        </asp:Panel>
            <asp:Button ID="bt_Cancel" runat="server" Text="Anuluj kurs" 
                onclick="bt_Cancel_Click" /><br />
            <asp:Button ID="bt_Return" runat="server" Text="Powróć" 
                onclick="bt_Return_Click" />
        <br />

        </div>

    </div>
    </div>
    <div class="mainbottom"></div>
</div>
</asp:Content>

