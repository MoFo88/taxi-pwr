using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

/// <summary>
/// Summary description for PageLoading
/// </summary>
public class PageLoading
{
	public PageLoading()
	{

	}

    public static void CheckAuthorization() {
        String abc=(String)(HttpContext.Current.Session)["userName"];
        if (abc == null)
        {
            HttpContext.Current.Response.Redirect("Default.aspx");
        };
    }
}