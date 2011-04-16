using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = Repository.GetAllEmployeeTypes();
        GridView1.DataBind();

        WebService x = new WebService();
        List<TaxiDriver> a = x.GetAllTaxiDrivers();


    }
}
