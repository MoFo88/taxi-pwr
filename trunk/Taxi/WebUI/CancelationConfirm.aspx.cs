using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class CancelationConfirm : System.Web.UI.Page
{
    private int idCourse;
    Course course;

    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("2"))
            Response.Redirect("NoAccessRights.aspx");
        idCourse = int.Parse(Session["idCourseToCancel"].ToString());
        course = Repository.getCourseById(idCourse);
        loadCourseData();
    }
    private void loadCourseData()
    {
        lb_client.Text = course.client_name;
        lb_destination.Text = course.startpoint_name;
        lb_date.Text = course.date.ToString();
        lb_dispatcher.Text = course.Employee.name + " " + course.Employee.surname;
        lb_phone.Text = course.client_phone;
        lb_driver.Text = course.Employee1.name + " " + course.Employee1.surname;
    }

    protected void bt_Cancel_Click(object sender, EventArgs e)
    {
        Repository.cancelCourse(idCourse);
        Response.Redirect("OrdersCanceled.aspx");
    }

    protected void bt_Return_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrdersInProgres.aspx");
    }
}
