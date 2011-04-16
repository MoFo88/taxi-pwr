using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Security;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LoginControl_Authenticate(object sender, AuthenticateEventArgs e)
    {
        Login log = (Login)LoginView1.FindControl("Login1");
        int wynik = Repository.UserAuth(log.UserName, log.Password);
        //int wynik = Repository.UserAuth("Abc", "Def");
        if (wynik>=0)
        {
            e.Authenticated = true;
            Session["userName"] = log.UserName;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Redirect("Default.aspx");
    }
}
