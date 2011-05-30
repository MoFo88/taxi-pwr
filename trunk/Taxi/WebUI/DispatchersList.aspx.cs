using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class DispatchersList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("3"))
            Response.Redirect("NoAccessRights.aspx");
    }
    protected void gv_Employees_SelectedIndexChanged(object sender, EventArgs e)
    {
        String value = gv_Employees.SelectedValue.ToString();
        int idEmployee = int.Parse(value);
        Employee emp = Repository.getEmployeeById(idEmployee);
        Session["idEmployeeToEdit"] = value;
        Response.Redirect("EditAdminOrDispatcher.aspx");        
    }
}