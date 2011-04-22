<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MapView.aspx.cs" Inherits="Default2" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/MapView.js" type="text/javascript"></script>
    <script src="Scripts/MapHandler.js" type="text/javascript"></script>
    <script src="http://www.openlayers.org/api/OpenLayers.js" type="text/javascript"></script> <!--TODO wczytywać mapkę z dysku, tylko trzeba ikonki pościągać i powprowadzać odpowiednie ścieżki do obrazków-->
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
<div id="itemlist" class="rightmenu orders">
    <div class="list">
        <div class="content">
            <ul>
            </ul>
        </div>
        <div class="bottom"></div>
    </div>
    <div class="new">
        <button>Nowe zgłoszenie</button>
    </div>
</div>

<div id="dialog_change_orders">
    <div class="close">zamknij</div>
    <input type="hidden" id="id_order" />
    <label for="order_course_date">Data: </label><input type="text" id="order_course_date" />
    <label for="order_startpoint_name">Miejsce: </label><input type="text" id="order_startpoint_name" />
    <label for="order_client_name">Imię i nazwisko: </label><input type="text" id="order_client_name" />
    <label for="order_client_phone">Telefon: </label><input type="text" id="order_client_phone" />
    <div class="submitbutton">
        <button class="add">Dodaj zgłoszenie</button>
        <button class="edit">Zmień zgłoszenie</button>
    </div>
</div>

<div class="main">
    <div class="maintop"></div>
    <div class="content">

        <div id="map_view"></div>

    </div>
    <div class="mainbottom"></div>
</div>


</asp:Content>
