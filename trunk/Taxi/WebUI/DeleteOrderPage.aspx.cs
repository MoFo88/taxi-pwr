using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class DeleteOrderPage : System.Web.UI.Page
{
    private int idCourse;
    Course course;

    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("2"))
            Response.Redirect("NoAccessRights.aspx");
        idCourse = int.Parse(Session["idCourseToDelete"].ToString());
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
    }
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Repository.deleteCourse(idCourse);
        switch (course.course_status_id)
        {
            case 1: Response.Redirect("OrdersWaiting.aspx");
                break;
            case 2: Response.Redirect("OrdersAccepted.aspx");
                break;
            case 3: Response.Redirect("OrdersInProgress.aspx");
                break;
            case 4: Response.Redirect("OrdersDone.aspx");
                break;
            case 5: Response.Redirect("OrdersCanceled.aspx");
                break;
        }
    }
    protected void bt_Return_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditOrder.aspx");
    }
}