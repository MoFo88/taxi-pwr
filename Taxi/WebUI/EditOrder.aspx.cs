﻿using System;
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
        idCourse = int.Parse(Session["idCourseToEdit"].ToString());
        course = (Course)Repository.getCourseById(idCourse);
        if (!IsPostBack)
        {
            loadCourseData();
        }
    }

    private void loadCourseData()
    {
        tb_clientNameAndSurname.Text = course.client_name;
        tb_Phone.Text = course.client_phone;
        tb_Destination.Text = course.startpoint_name;
        tb_Date.Text = course.date.ToString();
    }
    
    protected void b_Submit_Click(object sender, EventArgs e)
    {
        Repository.editCourse(idCourse, tb_clientNameAndSurname.Text, tb_Phone.Text, tb_Destination.Text, tb_Date.Text);
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