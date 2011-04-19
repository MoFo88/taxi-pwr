using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class admin_drivers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
    }

    protected void b_Add_Click(object sender, EventArgs e)
    {
        Repository.AddNewTaxiDriver(tb_Name.Text, tb_Surname.Text, tb_Login.Text, tb_Password.Text);
        Response.Redirect("Admin_employees.aspx");
    }
}