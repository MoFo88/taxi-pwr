using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
    }
    protected void b_Add_Click(object sender, EventArgs e)
    {
        Repository.addNewCourse(2, 2, tb_Client_phone.Text, Convert.ToDateTime(tb_Course_date.Text), 0, tb_Client_name.Text, tb_Startpoint_name.Text, 56, 17, 57, 18);
        Response.Redirect("Orders.aspx");
    }
}