using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using DAL;
using System.IO;
using System.Threading;

/// <summary>
/// Summary description for CreatingDriverList
/// </summary>
public static class CreatingDriverList
{
    public static List<TaxiDriver> drivers = new List<TaxiDriver>();
    public static HttpServerUtility server;
    
    public static void startThread()
    {
        Thread threat = new Thread(new ThreadStart(CreatingDriverList.refreshDriversFile));
        threat.IsBackground = true;
        threat.Start();
    }

    private static void refreshData()
    {
        CreatingDriverList.drivers = Repository.GetAllTaxiDrivers();
    }

    private static void generateFile()
    {
        try
        {
            StreamWriter sw = new StreamWriter(server.MapPath("Lists\\GetDriverList.txt"), false);
            sw.WriteLine("drivers = new Array();");
            foreach (TaxiDriver driver in drivers)
            {
                sw.WriteLine("driver = {");
                sw.WriteLine("lon: " + driver.position_lon.ToString().Replace(',', '.') + "0,");
                sw.WriteLine("lat: " + driver.position_lat.ToString().Replace(',', '.') + "0,");
                sw.WriteLine("id_driver: " + driver.id + ",");
                sw.WriteLine("status: " + driver.driver_status_id + ",");
                sw.WriteLine("registration_number: 'ASD 1234'" + ",");
                sw.WriteLine("license_number: '" + driver.licence_number + "'};");
                sw.WriteLine("drivers[drivers.length] = driver;");
            }
            sw.Close();
        }
        catch (Exception e)
        { };
    }

    public static void refreshDriversFile()
    {
        while (true)
        {
            refreshData();
            generateFile();
            Thread.Sleep(1 * 1000);
        }
    }
}