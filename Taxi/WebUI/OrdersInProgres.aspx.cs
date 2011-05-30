using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrdersInProgres : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("2"))
            Response.Redirect("NoAccessRights.aspx");
    }

    protected void gv_Orders_SelectedIndexChanged(object sender, EventArgs e)
    {
        String value = gv_Orders.SelectedValue.ToString();
        int idCourse = int.Parse(value);
        Session["idCourseToCancel"] = value;
        Response.Redirect("CancelationConfirm.aspx");
    }
}