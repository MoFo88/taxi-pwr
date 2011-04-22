function MapInit() {
    mapView = new OpenLayers.Map("map_view", {
            projection: new OpenLayers.Projection("EPSG:900913"),
            displayProjection: new OpenLayers.Projection("EPSG:4326")
                
    } );

    var mapnik = new OpenLayers.Layer.OSM();
    mapView.addLayer(mapnik);

    mapMarkers = new OpenLayers.Layer.Markers("Markers");
    mapView.addLayer(mapMarkers);
    MapInitIcons();

    lonLat = MapCreateLonLat(17.036018, 51.110635);
    mapView.setCenter(lonLat, 12); // lonLat, zoom

    visibleDrivers = new Array();
    visibleOrders = new Array();
    visibleDriversSelected = null;
    visibleOrdersSelected = null;

}

function MapShowMarkersDriver(markersDrivers, showPopup) {
    // Najpierw usuń stare (usunięte) znaczniki i popupy
    var newDriversId = new Array();
    for (var i in markersDrivers) {
        driver = markersDrivers[i];
        newDriversId[driver.id_driver] = (visibleDrivers[driver.id_driver] ? 'existing' : 'new');
    }
    for (var i in visibleDrivers) {
        visibleDriver = visibleDrivers[i];
        if (visibleDriver == null) continue;
        if (newDriversId[i]) {
            continue;
        };
        MapRemoveMarkerDriver(visibleDriver, i);
    }

    for (var i in markersDrivers) {
        driver = markersDrivers[i];
        if (newDriversId[driver.id_driver] == 'existing') MapMoveDriver(driver.id_driver, driver);
        else MapCreateMarkerDriver(driver, showPopup);
    };
}

function MapRemoveMarkerDriver(visibleDriver, i) {
    if (visibleDriver && i) {
        mapView.removePopup(visibleDrivers[i].popup);
        mapMarkers.removeMarker(visibleDrivers[i].marker);
        visibleDrivers[i].popup.destroy();
        visibleDrivers[i].marker.destroy();
        visibleDrivers[i]=null;
    };
};

function MapCreateMarkerDriver(details, showPopup) {
    lonLat = MapCreateLonLat(details.lon, details.lat);
    var id = details.id_driver;
    if (id == visibleDriversSelected) icon = markerIconDriverSelected.clone();
    else {
        icon = markerIconDriver.clone();
        showPopup = false;
    }
    var marker = new OpenLayers.Marker(lonLat, icon.clone());
    marker.setOpacity(1);
    mapMarkers.addMarker(marker);
    var popup = MapCreatePopupDriver(lonLat, details, showPopup);
    visibleDrivers[id] = {
        marker: marker,
        popup: popup,
        details: details
    };
    marker.events.register('mousedown', marker, function (evt) {
        popup.visible() ? popup.hide() : popup.show();
        // !? inaczej niż JavaScriptem chyba nie da rady, bo openstreetmap dodaje biały background dopiero przy wyświetlaniu popupa
        OpenLayers.Event.stop(evt);
    });
}

function MapCreatePopupDriver(lonLat, details, showPopup) {
    var popup = new OpenLayers.Popup(details.id_order, // auto generate id
                   lonLat,
                   new OpenLayers.Size(220, 120),
                   '<div class="map_popup">'+
                   '<div class="driver_id">Taksówkarz #' + details.id_driver + '</div>' +
                   '<div class="status"">Stan: ' + details.status + '</div>' +
                   '<div class="registration">Rejestracja: ' + details.registration_number + '</div>' +
                   '<div class="licence">Nr licencji: ' + details.licence_number + '</div>' +
                   '<div class="assign"></div>' +
                   '</div>',
                   false
    );
    mapView.addPopup(popup);
    popup.draw();
    popup.setOpacity(0.9);
    div_assign = $(popup.contentDiv).find('div.assign');
    div_assign.text('przydziel');
    div_assign.click(function () {
        if (visibleOrdersSelected == null) alert('Najpierw wybierz zgłoszenie');
        else {
            $.post("AssignOrderToDriver.aspx", { id_order: visibleOrdersSelected, id_driver: details.id_driver }, function (data) {
                alert("OK");
                GetOrderList();
            })
            //.success(function () { alert("second success"); })
            .error(function () { alert('Błąd połączenia przy przydzielaniu taksówkarza'); })
            .complete(function () { });
        }
    });
    $(popup.groupDiv.parentNode).addClass('map_popup_groupDiv_parent');
    $(popup.groupDiv).addClass('map_popup_groupDiv').addClass('driver');
    if (showPopup == true) popup.show();
    else popup.hide();
    return popup;
}

function MapMoveDriver(id_driver, newDriver) {
    driver=visibleDrivers[id_driver];
    // Niestety żadne "prostsze" metody nie działały, nie da się tak po prostu zmienić lonlata markera
    var newPx = mapView.getLayerPxFromViewPortPx(mapView.getPixelFromLonLat(new OpenLayers.LonLat(newDriver.lon, newDriver.lat).transform(mapView.displayProjection, mapView.projection)));
    driver.marker.moveTo(newPx);
    driver.popup.moveTo(newPx);
}

function MapShowMarkersOrder(markersOrders, showPopup) {
    // Najpierw usuń stare (usunięte) znaczniki i popupy
    var newOrdersId = new Array();
    for (var i in markersOrders) {
        order = markersOrders[i];
        newOrdersId[order.id_order] = (visibleOrders[order.id_order] ? 'existing' : 'new');
    }
    for (var i in visibleOrders) {
        visibleOrder = visibleOrders[i];
        if (visibleOrder == null) continue;
        if (newOrdersId[i]) {
            continue;
        };
        MapRemoveMarkerOrder(visibleOrder, i);
    }

    // Dodaj nowe znaczniki
    //setTimeout(function () { // timeout dla celów testowych - żeby było wiać że się coś dzieje
        for (var i in markersOrders) {
            order = markersOrders[i];
            if (newOrdersId[order.id_order] == 'existing') continue;
            MapCreateMarkerOrder(order, showPopup);
        };
    //}, 100);
}

function MapRemoveMarkerOrder(visibleOrder, i) {
    if (visibleOrder && i) {
        mapView.removePopup(visibleOrder.popup);
        mapMarkers.removeMarker(visibleOrder.marker);
        visibleOrder.popup.destroy();
        visibleOrder.marker.destroy();
        visibleOrders[i] = null;
        if (visibleOrdersSelected == i) visibleOrdersSelected = null;
    };
}

function MapCreateMarkerOrder(details, showPopup) {
    lonLat = MapCreateLonLat(details.lon, details.lat);
    var id = details.id_order;
    if (id == visibleOrdersSelected) icon = markerIconOrderTargetSelected.clone();
    else {
        icon = markerIconOrderTarget.clone();
        showPopup = false;
    }
    var marker = new OpenLayers.Marker(lonLat, icon.clone());
    marker.setOpacity(1);
    mapMarkers.addMarker(marker);
    var popup = MapCreatePopupOrder(lonLat, details, showPopup);
    visibleOrders[id] = {
        marker: marker,
        popup: popup,
        details: details
    };

    marker.events.register('mousedown', marker, function (evt) {
        popup.visible() ? popup.hide() : popup.show();
        OpenLayers.Event.stop(evt);
    });
}

function MapCreatePopupOrder(lonLat, details, showPopup) {
    var popup = new OpenLayers.Popup(details.id_order, // auto generate id
                   lonLat,
                   new OpenLayers.Size(220, 110),
                   '<div class="map_popup">'+
                   '<div class="order_id">Zamówienie #' + details.id_order + '</div>' +
                   '<div class="course_date">' + details.date + '</div>' +
                   '<div class="startpoint_name">' + details.startpoint_name + '</div>' +
                   '<div class="notes">Uwagi: ' + details.notes + '</div>' +
                   '</div>',
                   false);
    mapView.addPopup(popup);
    popup.draw();
    popup.setOpacity(0.9);
    $(popup.groupDiv.parentNode).addClass('map_popup_groupDiv_parent');
    $(popup.groupDiv).addClass('map_popup_groupDiv').addClass('order');
    if (showPopup == true) popup.show();
    else popup.hide();
    return popup;
}

function MapCreateLonLat(lon, lat) {
    var lonLat = new OpenLayers.LonLat(lon, lat)
              .transform(
                new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
                new OpenLayers.Projection("EPSG:900913") // to Spherical Mercator Projection
              );
    return lonLat;
}

function MapInitIcons() {
    var size = new OpenLayers.Size(14, 19);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    markerIconDriver = new OpenLayers.Icon('Images/MarkerIcons/driver.png', size, offset);

    var size = new OpenLayers.Size(14, 19);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    markerIconDriverSelected = new OpenLayers.Icon('Images/MarkerIcons/driver_selected.png', size, offset);

    var size = new OpenLayers.Size(21, 34);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    markerIconOrderTarget = new OpenLayers.Icon('Images/MarkerIcons/order_target.png', size, offset);

    var size = new OpenLayers.Size(21, 34);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    markerIconOrderTargetSelected = new OpenLayers.Icon('Images/MarkerIcons/order_target_selected.png', size, offset);
}

function MapSelectOrder(order_obj) {
    // Pobieramy nowe ID taksówkarza i zamówienia
    id_order = order_obj.find('div.id_order').text();
    id_driver = order_obj.find('div.id_driver').text();

    // Centrujemy mapę na wybranym punkcie
    marker = visibleOrders[id_order].marker;
    mapView.setCenter(marker.lonlat, 14); // lonLat, zoom

    // Usuwamy stare zaznaczenie
    selectedOrder=visibleOrders[visibleOrdersSelected];
    MapRemoveMarkerOrder(selectedOrder, visibleOrdersSelected);
    selectedDriver=visibleDrivers[visibleDriversSelected];
    MapRemoveMarkerDriver(selectedDriver, visibleDriversSelected);

    // Usuwamy nowozaznaczony marker, aby zaznaczył się na nowy kolor
    MapRemoveMarkerOrder(visibleOrders[id_order], id_order);
    MapRemoveMarkerDriver(visibleDrivers[id_driver], id_driver);

    // Zapamiętujemy nowe miejsce
    visibleOrdersSelected = id_order;
    visibleDriversSelected = id_driver;

    // Trzeba przywrócić punkt który usunęliśmy przed chwilą
    MapShowMarkersOrder(orders, true);
    MapShowMarkersDriver(drivers, true);
}
