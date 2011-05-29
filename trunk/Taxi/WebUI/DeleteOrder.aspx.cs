using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

public partial class DeleteOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.Form.Method == "post")
        {
            int idCourse = int.Parse(this.Page.Request.Form["id_order"]);
            Repository.deleteCourse(idCourse);
        }
    }
}