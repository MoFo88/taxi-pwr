using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

public partial class employeeList : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
    }

    protected void gv_Employees_SelectedIndexChanged(object sender, EventArgs e)
    {
        String value = gv_Employees.SelectedValue.ToString();
        Session["employeeToEditId"] = value;
        Response.Redirect("EditEmployee.aspx");
    }

    
}