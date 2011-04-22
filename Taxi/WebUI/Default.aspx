<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div class="main">
    <div class="maintop"></div>
    <div class="content">
        <br class="clear noheight" />

        <asp:Button ID="Button1" runat="server" Text="Get All Employee Types:" 
        onclick="Button1_Click" /><br />
    
        <h2>
            Musisz się zalogować, aby uzyskać dostęp do tej strony.
        </h2>

        <h2 style="color: #F00">
            Kliknąć przycisk "Log In", zamiast entera!
        </h2>

        <div id="loginform">
                <asp:LoginView ID="lv_Login" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login1" runat="server" 
                            onauthenticate="LoginControl_Authenticate">
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <LayoutTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        Log In</td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                            ToolTip="User Name is required." ValidationGroup="ctl00$ctl16$Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                                            ToolTip="Password is required." ValidationGroup="ctl00$ctl16$Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color:Red;">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                            ValidationGroup="ctl00$ctl16$Login1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
                                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" 
                                ForeColor="White" />
                        </asp:Login>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                    Jesteś zalogowany, po zakończeniu pracy
                <asp:LinkButton ID="linkb_Logout" runat="server" onclick="linkb_Logout_Click" 
                            CssClass="linkb_logout">wyloguj się</asp:LinkButton>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>

        <h2>
            Employee Types:
        </h2>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" EntityTypeName="">
        </asp:LinqDataSource>

    </div>
    <div class="mainbottom"></div>
</div>


</asp:Content>
