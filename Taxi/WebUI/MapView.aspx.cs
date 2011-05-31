using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        //if (!Session["userType"].ToString().Equals("2"))
        //    Response.Redirect("NoAccessRights.aspx");
    }
}