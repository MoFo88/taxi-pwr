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
        try
        {
            Login log = (Login)LoginView1.FindControl("Login1");
            int userId = Repository.UserAuth(log.UserName, log.Password);
            if (userId >= 0)
            {
                e.Authenticated = true;
                Session["userName"] = log.UserName;
            }
        }
        catch (Exception exception)
        {
            
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Redirect("Default.aspx");
    }
}
