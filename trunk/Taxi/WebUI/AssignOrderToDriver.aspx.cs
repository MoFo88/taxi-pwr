using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

public partial class AssignOrderToDriver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.Form.Method == "post")
        {
            int idCourse = int.Parse(this.Page.Request.Form["id_order"]);
            int idDriver = int.Parse(this.Page.Request.Form["id_driver"]);
            Repository.BindCoursToTaxiDriver(idDriver, idCourse);
        }
    }
}