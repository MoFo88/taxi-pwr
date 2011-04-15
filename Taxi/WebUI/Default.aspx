<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <asp:Button ID="Button1" runat="server" Text="Get All Employee Types:" 
    onclick="Button1_Click" /><br />
    
    <h2>
        Musisz się zalogować, aby uzyskać dostęp do tej strony.
    </h2>

    <h2>
        Employee Types:
    </h2>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" EntityTypeName="">
    </asp:LinqDataSource>
</asp:Content>
