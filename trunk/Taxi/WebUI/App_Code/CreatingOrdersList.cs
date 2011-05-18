using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using BLL;
using System.IO;

/// <summary>
/// Summary description for CreatingOrdersList
/// </summary>
public class CreatingOrdersList
{
	List<Course> orders;

    public CreatingOrdersList()
	{
        orders = new List<Course>();
	}

    private void refreshData()
    {
        orders = Repository.getAllCourses();
    }

    private void generateFile(HttpServerUtility server)
    {
        StreamWriter sw = new StreamWriter(server.MapPath("Lists\\GetOrderList.txt"), false);
        sw.WriteLine("orders = new Array();");
        foreach (Course order in orders)
        {
            sw.WriteLine("order = {");
            sw.WriteLine("lon: " + order.startpoint_lon.ToString().Replace(',','.') + ",");
            sw.WriteLine("lat: " + order.startpoint_lat.ToString().Replace(',', '.') + ",");
            sw.WriteLine("course_date: '" + order.date.ToShortDateString() + " " + order.date.Hour + ":" +order.date.Minute + "',");
            sw.WriteLine("startpoint_name: '" + order.startpoint_name + "',");
            sw.WriteLine("client_name: '" + order.client_name + "',");
            sw.WriteLine("notes: 'brak'" + ",");
            sw.WriteLine("id_order: " + order.id + ",");
            sw.WriteLine("id_driver: " + order.taxidriver_id + "};");
            sw.WriteLine("orders[orders.length] = order;");
        }
        sw.Close();
    }

    public void refreshOrdersFile(HttpServerUtility server)
    {
        refreshData();
        generateFile(server);
    }
}