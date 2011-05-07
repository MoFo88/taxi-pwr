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
        if (Request.Cookies["menuHidden"].Value == "1")
        {
            div_header.Attributes["style"] = "display:none";
        }
    }

    protected bool IsLoggedIn()
    {
        if (Session["userName"]!=null && Session["userName"]!="") {
            return true;
        }
        else {
            return false;
        }
    }

}
