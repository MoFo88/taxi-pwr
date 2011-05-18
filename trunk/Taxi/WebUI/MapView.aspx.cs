using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{   
     CreatingDriverList cdl = new CreatingDriverList();

     CreatingOrdersList col = new CreatingOrdersList();

    protected void Page_Load(object sender, EventArgs e)
    {
        PageLoading.CheckAuthorization();
        cdl.refreshDriversFile(this.Server);
        col.refreshOrdersFile(this.Server); 
    }
}