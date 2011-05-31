using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using BLL;
using System.IO;
using System.Threading;

/// <summary>
/// Summary description for CreatingOrdersList
/// </summary>
public static class CreatingOrdersList
{
    public static List<Course> orders = new List<Course>();
    public static HttpServerUtility server;

    private static void refreshData()
    {
        orders = Repository.getWaitingOrders();
    }

    public static void startThread()
    {
        Thread threat = new Thread(new ThreadStart(CreatingOrdersList.refreshOrdersFile));
        threat.IsBackground = true;
        threat.Start();
    }

    private static void generateFile()
    {
        try
        {
            StreamWriter sw = new StreamWriter(server.MapPath("Lists\\GetOrderList.txt"), false);
            sw.WriteLine("orders = new Array();");
            foreach (Course order in orders)
            {
                sw.WriteLine("order = {");
                sw.WriteLine("lon: " + order.startpoint_lon.ToString().Replace(',', '.') + ",");
                sw.WriteLine("lat: " + order.startpoint_lat.ToString().Replace(',', '.') + ",");
                sw.WriteLine("course_date: '" + order.course_date.ToString().Substring(0,16) + "',");
                sw.WriteLine("startpoint_name: '" + order.startpoint_name + "',");
                sw.WriteLine("client_name: '" + order.client_name + "',");
                sw.WriteLine("notes: 'brak'" + ",");
                sw.WriteLine("car_type: " + order.car_type_id + ",");
                sw.WriteLine("seats: " + order.seats + ",");
                sw.WriteLine("id_order: " + order.id + ",");
                sw.WriteLine("id_driver: " + (order.taxidriver_id!=null?order.taxidriver_id:-1) + "};");
                sw.WriteLine("orders[orders.length] = order;");
            }
            sw.Close();
        }
        catch (Exception e)
        { };
    }

    public static void refreshOrdersFile()
    {
        while (true)
        {
            refreshData();
            generateFile();
            Thread.Sleep(1 * 1000);
        }
    }
}