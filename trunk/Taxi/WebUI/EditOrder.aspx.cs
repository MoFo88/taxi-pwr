using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

public partial class EditOrder : System.Web.UI.Page
{
    private int idCourse;
    Course course;
    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        if (!Session["userType"].ToString().Equals("2"))
            Response.Redirect("NoAccessRights.aspx");
        idCourse = int.Parse(Session["idCourseToEdit"].ToString());
        course = (Course)Repository.getCourseById(idCourse);
        if (!IsPostBack)
        {
            prepareDropList();
            loadCourseData();
        }
    }

    private void prepareDropList()
    {
        this.ddl_Car_model.DataSource = Repository.getAllCarTypes();
        this.ddl_Car_model.DataTextField = "name";
        this.ddl_Car_model.DataValueField = "id";
        this.DataBind();
    }

    private void loadCourseData()
    {
        tb_clientNameAndSurname.Text = course.client_name;
        tb_Phone.Text = course.client_phone;
        tb_Destination.Text = course.startpoint_name;
        tb_Date.Text = course.date.ToString();
        tb_Seats.Text = course.seats.ToString();
        ddl_Car_model.SelectedValue = course.car_type_id.ToString();
    }
    
    protected void b_Submit_Click(object sender, EventArgs e)
    {
        int car_type_id = ddl_Car_model.SelectedIndex;
        Repository.editCourse(idCourse, tb_clientNameAndSurname.Text, tb_Phone.Text, tb_Destination.Text, tb_Date.Text, car_type_id, int.Parse(tb_Seats.Text));
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
    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        Session["idCourseToDelete"] = idCourse;
        Response.Redirect("DeleteOrderPage.aspx");
    }
}