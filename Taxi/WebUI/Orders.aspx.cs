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
        this.DropDownList_Status.DataSource = Repository.getCoursesStatus();
        this.DropDownList_Status.DataTextField = "name";
        this.DropDownList_Status.DataValueField = "id";
        this.DropDownList_Status.DataBind();

    }

    protected void b_Add_Click(object sender, EventArgs e)
    {
        Repository.addNewCourse(33, 38, tb_Client_phone.Text,
            Convert.ToDateTime(tb_Course_date.Text), 1, tb_Client_name.Text, tb_Startpoint_name.Text, 56, 17, 57, 18);
        Response.Redirect("Orders.aspx");
    }
    protected void DropDownList_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        int? statusId = int.Parse(this.DropDownList_Status.SelectedValue);
        if (statusId != null)
        {
            this.gv_Orders.DataSource = null;
            this.gv_Orders.DataBind();
            this.gv_Orders.DataSource = Repository.getCoursesByStatusId((int)statusId);
            this.gv_Orders.DataBind();
        }
    }
}