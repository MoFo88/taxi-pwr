<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Admin_employees.aspx.cs" Inherits="admin_drivers" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div>
    
        <asp:Label ID="Label_name" runat="server" AssociatedControlID="Name" 
            Text="Label"></asp:Label>
&nbsp;<asp:TextBox ID="Name" runat="server" style="margin-left: 0px"></asp:TextBox>
    
    </div>

</asp:Content>
