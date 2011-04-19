using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;
using DAL;


/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://taxi.yasio.pl/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    public List<Employee_type> GetAllEmployeeTypes() {
        return Repository.GetAllEmployeeTypes();
    }

    [WebMethod]
    public List<TaxiDriver> GetAllTaxiDrivers()
    {
        return Repository.GetAllTaxiDrivers();
    }
    
}
