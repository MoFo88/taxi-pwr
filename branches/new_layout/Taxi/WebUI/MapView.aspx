<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MapView.aspx.cs" Inherits="Default2" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
        <style type="text/css">
      html, body, #basicMap {
          width: 100%;
          height: 100%;
          margin: 0;
      }
    </style>
    <script type="text/javascript" src="http://www.openlayers.org/api/OpenLayers.js"></script>
   
    <div id="basicMap" style="width: 100%; height: 500px"></div>

        <script type="text/javascript">
            function init() {
                map = new OpenLayers.Map("basicMap");
                var mapnik = new OpenLayers.Layer.OSM();
                map.addLayer(mapnik);


                var lonLat = new OpenLayers.LonLat(17.06170, 51.10938) // Center of the map
          .transform(
            new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
            new OpenLayers.Projection("EPSG:900913") // to Spherical Mercator Projection
          );

                map.setCenter(lonLat, 14 // Zoom level
        );


                var popup = new OpenLayers.Popup("taxi1",
                   lonLat,
                   new OpenLayers.Size(70, 70),
                   '<div style="font:500 11px arial">taxi<br>#1<br>wolny</div>',
                   true);

                map.addPopup(popup);
                popup.setOpacity(0.8);
                //popup.hide();

                var marker = new OpenLayers.Marker(lonLat);
                marker.setOpacity(0.5);

                var markers = new OpenLayers.Layer.Markers("Markers");
                map.addLayer(markers);
                markers.addMarker(marker);
                marker.events.register('mousedown', marker, function (evt) { popup.visible() ? popup.hide() : popup.show(); OpenLayers.Event.stop(evt); });


                map.setCenter(lonLat, 14);
            }
            init();
    </script>



</asp:Content>
