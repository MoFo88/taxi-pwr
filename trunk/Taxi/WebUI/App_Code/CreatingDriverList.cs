using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BLL;
using DAL;
using System.IO;

/// <summary>
/// Summary description for CreatingDriverList
/// </summary>
public class CreatingDriverList
{
    List<TaxiDriver> drivers;

	public CreatingDriverList()
	{
        drivers = new List<TaxiDriver>();
	}

    private void refreshData()
    {
        drivers = Repository.GetAllTaxiDrivers();
    }

    private void generateFile(HttpServerUtility server)
    {
        StreamWriter sw = new StreamWriter(server.MapPath("Lists\\GetDriverList.txt"), false);
        sw.WriteLine("drivers = new Array();");
        foreach (TaxiDriver driver in drivers)
        {
            sw.WriteLine("driver = {");
            sw.WriteLine("lon: " + driver.position_lon.ToString().Replace(',', '.') + "0,");
            sw.WriteLine("lat: " + driver.position_lat.ToString().Replace(',', '.') + "0,");
            sw.WriteLine("id_driver: " + driver.id + ",");
            sw.WriteLine("status: 1" + driver.driver_status_id + ",");
            sw.WriteLine("registration_number: 'ASD 1234'" + ",");
            sw.WriteLine("license_number: '" + driver.licence_number + "'};");
            sw.WriteLine("drivers[drivers.length] = driver;");
        }
        sw.Close();
    }

    public void refreshDriversFile(HttpServerUtility server)
    {
        refreshData();
        generateFile(server);
    }
}