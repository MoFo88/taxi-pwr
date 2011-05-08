using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

/*
 * Ten plik jest potrzebny, ponieważ w jQuery jest problem z zapytaniami cross-domain. Dlatego jQuery odwołuje się do lokalnego pliku, a w C# pobieramy odpowiednie dane ze zdalnego serwera
 */

public partial class GetLonLatByAddress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Uri uri = new Uri("http://maps.google.com/maps/geo?output=json&oe=utf-8&q="+Request["address"]+"&key=ABQIAAAAgJQSLzz5oDNMhvRgyTHxWRT3x038EYAEXgYKGEQCIoEp3dSvOxSfVQ_vNywU6Z7AOW5q1YgtkHeH0Q&mapclient=jsapi&hl=pl&callback=_xdc_._3gng7uor0");
        HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(uri);
        using (HttpWebResponse webResponse = (HttpWebResponse)webRequest.GetResponse())
        {
            using (StreamReader reader = new StreamReader(webResponse.GetResponseStream()))
            {
                String response="";
                response = reader.ReadToEnd();
                div_resp.InnerHtml = response;
            }
        }
    }
}