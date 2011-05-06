using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;
using DAL;
using System.Xml.Serialization;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://localhost/TestWebService/")]//"http://taxi.yasio.pl/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () 
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string Add(int val1, int val2)
    {
        return "The Sum of two number= " + (val1 + val2);
    }

    [WebMethod]
    public List<Employee_type> GetAllEmployeeTypes() 
    {
        return Repository.GetAllEmployeeTypes();
    }

    [WebMethod]
    public List<TaxiDriver> GetAllTaxiDrivers()
    {
        return Repository.GetAllTaxiDrivers();
    }

    [WebMethod]
    public bool setTaxiCoord(double longitude, double latitude)
    {
        //odczytanie z kontekstu sesyjnego użytkownika zalogowanego użytkownika
        decimal lon = (decimal)longitude;//latwiejsze rozwiazanie, bo w javie nie ma decimala
        decimal lat = (decimal)latitude;
        return Repository.setTaxiPosition(lon,lat,1); // jak na razie 1
    }

    [WebMethod]
    public bool setTaxiStatus(int status)
    {
        //mozliwe rozdzielenie na kilka metod:
        // setTaxiStatusOnCourse
        // setTaxiStatusFree
        // setTaxiStatusBusy
        //itp itd - DO USTALENIA
        return Repository.setTaxiState(status,1); //zmieniamy ryska ;)
    }

}
