using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class ChangeOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.Form.Method == "post")
        {
            String idCourse = this.Page.Request.Form["id_order"];
            String destination = this.Page.Request.Form["startpoint_name"];
            String date = this.Page.Request.Form["course_date"];
            String client = this.Page.Request.Form["client_name"];
            String clientPhone = this.Page.Request.Form["client_phone"];
            String lonString = this.Page.Request.Form["lon"];
            Decimal lon = Decimal.Parse(lonString.Replace(".", ","));
            String latString = this.Page.Request.Form["lat"];
            Decimal lat = Decimal.Parse(latString.Replace(".", ","));
            String seatsString = this.Page.Request.Form["seats"];
            int seats = int.Parse(seatsString);
            String carTypeString = this.Page.Request.Form["car_type"];
            int car_type_id = int.Parse(carTypeString);
            if (idCourse == "")
            {
                addNewCourse(destination, date, client, clientPhone, lon, lat, seats, car_type_id);
            }
            else
            {
                int id = int.Parse(idCourse);
                editCourse(id,destination, date, client, clientPhone, lon, lat,seats, car_type_id);
            }
        }
    }

    private void addNewCourse(String destination, String date, String client, String clientPhone, Decimal lon, Decimal lat, int car_type_id, int seats)
    {
        int userId = int.Parse(Session["userId"].ToString());
        Repository.addNewCourse(null, userId, clientPhone, DateTime.Parse(date), 1, client, destination, lon, lat, lon, lat, car_type_id, seats);
    }

    private void editCourse(int idCourse, String destination, String date, String client, String clientPhone, Decimal lon, Decimal lat, int car_type_id, int seats)
    {
        Repository.editCourse(idCourse, destination, date, client, clientPhone, lon, lat, car_type_id, seats);
    }
}