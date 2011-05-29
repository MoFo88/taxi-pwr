function createCurrentOrder() {
    var div_dco=$('div#dialog_change_orders');
    obj={
        id_order: div_dco.find('#tb_id_order').val(),
        course_date: div_dco.find('#tb_order_course_date').val(),
        startpoint_name: div_dco.find('#tb_order_startpoint_name').val(),
        client_name: div_dco.find('#tb_order_client_name').val(),
        client_phone: div_dco.find('#tb_order_client_phone').val(),
        seats: div_dco.find('#tb_order_seats').val(),
        car_type: div_dco.find('#tb_order_car_type').val(),
        lon: div_dco.find('#tb_order_lon').val(),
        lat: div_dco.find('#tb_order_lat').val()
    };
    return obj;
}

function getCurrentDateTime() {
    var curtime = new Date();
    var curhour = curtime.getHours();
    var curmin = curtime.getMinutes();
    var cursec = curtime.getSeconds();
    var time = "";
 
    date=curtime.getFullYear()+'-'+(curtime.getMonth()+1<10?'0':'')+(curtime.getMonth()+1)+'-'+curtime.getDate();
    time = (curtime.getHours()<10?'0':'')+(curtime.getHours())+':'+
            (curtime.getMinutes()<10?'0':'')+curtime.getMinutes();
 
    return date+' '+time;
}

selectOrder_timeout=null;
function selectOrder(container, element) {
    div_dco=$('div#dialog_change_orders');
    //TODO wprowadzamy opóźnienie w pobieraniu taksówek, bo inaczej jeśli zamówienie znika w momencie kliknięcia, to nie pojawia się popup - to jest jeszcze do przetestowania
    if (selectOrder_timeout!=null) clearTimeout(selectOrder_timeout);
    selectOrder_timeout=setTimeout(function () {
        if (element.find('div.id_order').text()!=div_dco.find('#tb_id_order').val()) {
            $('div#dialog_change_orders').slideUp(300);
        }
        //GetOrderList();
    }, 200);
    MapSelectOrder(element);
    container.find('li').removeClass('selected');
    element.addClass('selected');
}

function showPointByAddress(address) {
    address+=', Wrocław, Polska';
    $.ajax({
        type: 'GET',
        url: 'GetLonLatByAddress.aspx',
        data: {
            address: address
        },
        success: function (data) {
            response=$(data).text();
            response='startpoint_data='+response.substring(38, response.length-2);
            eval(response);
            pointLon=startpoint_data.Placemark[0].Point.coordinates[0];
            pointLat=startpoint_data.Placemark[0].Point.coordinates[1];
            MapShowPoint(pointLon, pointLat, 15); // lon, lat, zoom==centerMap
            $('#tb_order_lon').val(pointLon);
            $('#tb_order_lat').val(pointLat);
        },
    });
}

function var_dump(obj) {
   if(typeof obj == "object") {
      return "Type: "+typeof(obj)+((obj.constructor) ? "\nConstructor: "+obj.constructor : "")+"\nValue: " + obj;
   } else {
      return "Type: "+typeof(obj)+"\nValue: "+obj;
   }
}//end function var_dump

function dialog_change_orders_fill(div_dco, order) {
    if (order==null) {
        order={
            id_order: '',
            course_date: '',
            startpoint_name: '',
            client_name: '',
            client_phone: '',
            seats: 1,
            car_type: 1,
            lon: '',
            lat: '',
        };
    }
    div_dco.find('#tb_id_order').val(order.id_order);
    if (order.course_date=='')
        $('#tb_order_course_date').val(getCurrentDateTime());
    else
        div_dco.find('#tb_order_course_date').val(order.course_date);
    div_dco.find('#tb_order_startpoint_name').val(order.startpoint_name);
    div_dco.find('#tb_order_client_name').val(order.client_name);
    div_dco.find('#tb_order_client_phone').val(order.client_phone);
    div_dco.find('#tb_order_seats').val(order.seats);
    div_dco.find('#tb_order_car_type').val(order.car_type);
    div_dco.find('#tb_order_lon').val(order.lon);
    div_dco.find('#tb_order_lat').val(order.lat);
    if ($.cookie('dialog_change_orders_x')!=null) { // ustaw okienko w odpowiedniej (zapamiętanej pozycji)
        div_dco.get(0).style.left=$.cookie('dialog_change_orders_x')+'px';
        div_dco.get(0).style.top=$.cookie('dialog_change_orders_y')+'px';
    }
}

$(document).ready(function () {

    // Inicjalizacja mapy i wyświetlenie pozyci w menu po prawej
    MapInit();
    GetOrderList();

    // Interval wyświetlający zgłoszenia w menu po prawej
    setInterval(function () {
        GetOrderList();
    }, 10000);

    // ESC przy dodawaniu/edytowaniu zgłoszenia -> zamknięcie okienka zgłoszenia
    $('div#dialog_change_orders').keyup(function (e) {
        if (e.keyCode==27) {
            $('div#dialog_change_orders').slideUp(300);
            MapShowPoint();
        }
    });

    // Przycisk dodawania nowego zgłoszenia
    $('div.rightmenu .new button').button().click(function () {
        div_dco=$('div#dialog_change_orders');
        if (div_dco.is(':visible')) div_dco.slideUp(150, function () {
            dialog_change_orders_fill(div_dco, null);
        });
        else dialog_change_orders_fill(div_dco, null);
        div_dco.removeClass('edit').addClass('add');
        div_dco.slideDown(300);
        div_dco.find('#tb_order_startpoint_name').focus();
        return false;
    });

    // Pole daty dodawania zgłoszenia jako kalendarz
    $('#tb_order_course_date').datetimepicker({
        dateFormat: 'yy-mm-dd'
    });

    // Odczytywanie na bieżąco lokalizacji wpisywanego adresu
    order_startpoint_name_timeout=null;
    $('#tb_order_startpoint_name').keyup(function () {
        if (order_startpoint_name_timeout!=null) {
            clearTimeout(order_startpoint_name_timeout);
            order_startpoint_name_timeout=null;
        };
        address=$(this).val();

        order_startpoint_name_timeout=setTimeout(function () {
            showPointByAddress(address);
        }, 300);
    });

    // Reakcja na zatwierdzenie formularza zmiany/dodawania zgłoszenia
    $('div#dialog_change_orders button.add, div#dialog_change_orders button.edit').button().click(function () {
        changeOrder();
        return false;
    });

    function changeOrder() {
        div_dco=$('div#dialog_change_orders');
        if (div_dco.find('#tb_order_lon').val()=='' || div_dco.find('#tb_order_lat').val()=='') {
            showQuickMessage('Brak współrzędnych');
        }
        else {
            $.post(
                "ChangeOrders.aspx",
                {
                    id_order: div_dco.find('#tb_id_order').val(),
                    course_date: div_dco.find('#tb_order_course_date').val(),
                    startpoint_name: div_dco.find('#tb_order_startpoint_name').val(),
                    client_name: div_dco.find('#tb_order_client_name').val(),
                    client_phone: div_dco.find('#tb_order_client_phone').val(),
                    seats: div_dco.find('#tb_order_seats').val(),
                    car_type: div_dco.find('#tb_order_car_type').val(),
                    lon: div_dco.find('#tb_order_lon').val(),
                    lat: div_dco.find('#tb_order_lat').val()
                },
                function (data) {
                    if (data.length<50) showQuickMessage(data);
                    else showQuickMessage('Zmieniono/dodano zgłoszenie', 3000);
                    $.get('MapView.aspx', function () { // wywołujemy odświeżenie list zgłoszeń i taksówkarzy
                        GetOrderList(); //TODO odblokować jak będzie działało generowanie listy
                        //order=createCurrentOrder();
                        //MapChangeOrder(div_dco.find('#tb_id_order').val(), order);
                        setTimeout(function () {
                            MapSelectOrderById(div_dco.find('#tb_id_order').val()); // automatycznie wywołuje MapShowPoint() - czyli wyszukany na podstawie adresu punkt na mapie znika
                        }, 500);
                        //alert(data);
                    });
                })
                //.success(function () { alert("second success"); })
                .error(function () {
                    showQuickMessage('Błąd przy dodawaniu/modyfikowaniu zgłoszenia');
                })
                .complete(function () { }
            );
        }
        return false;
    };

    // Reakcja na przycisk usuwania zgłoszenia
    $('div#dialog_change_orders button.del').button().click(function () {
        div_dco=$('div#dialog_change_orders');
        $.post(
            "DeleteOrder.aspx",
            {
                id_order: div_dco.find('#tb_id_order').val(),
            },
            function (data) {
                if (data.length<50) showQuickMessage(data);
                else showQuickMessage('Usunięto zgłoszenie', 3000);
                $('div#dialog_change_orders').slideUp(300);
                GetOrderList();
            })
            //.success(function () { alert("second success"); })
            .error(function () {
                showQuickMessage('Błąd przy usuwaniu zgłoszenia');
            })
            .complete(function () { }
        );
        GetOrderList();
        return false;
    });

    // Reakcja na przycisk zamykajacy okno dodawania/zmiany zgłoszenia
    $('div#dialog_change_orders .close').click(function() {
        $('div#dialog_change_orders').slideUp(300);
    });

    // Przeciąganie okna dodawania/zmiany zgłoszenia
    $('div#dialog_change_orders').draggable({
        drag: function (e, ui) {
            $.cookie('dialog_change_orders_x', ui.offset.left);
            $.cookie('dialog_change_orders_y', ui.offset.top);
        },
        distance: 15,
        handle: '.title'
    });
});

function GetOrderList() {
    showQuickMessage('Pobieram listę zgłoszeń i taksówek...', 3000);
    orders = $.getScript('Lists/GetOrderList.txt', function () {
        FillOrderList(orders);
        MapShowMarkersOrder(orders);
        //MapShowMarkersOrder(orders);
    });
    drivers = $.getScript('Lists/GetDriverList.txt?id_order=' + visibleOrdersSelected, function () { //TODO - nie jest potrzebne id_order, przynajmniej na razie, DC obsłuży przypisanego taksówkrza
        MapShowMarkersDriver(drivers);
    });
    return orders;
}

orders_current_page=0;
function FillOrderList(orders) {
    var orders_per_page=7;
    var container = $('div#itemlist div.content ul');
    container.find('li').remove();

    var linkIsActive;
    // Link - pokaż wcześniejsze wpisy
    linkIsActive=orders_current_page>0;
    var item_html='<li class="more'+(linkIsActive?'':' locked')+'">'+
                '&uarr;&uarr; pokaż wcześniejsze &uarr;&uarr;'+
                '</li>';
    var item_obj=$(item_html);
    if (linkIsActive) item_obj.click(function () { // pokaż wcześniejsze elementy na liście
        orders_current_page--;
        FillOrderList(orders);
    });
    container.append(item_obj);

    for (i=orders_current_page*orders_per_page; i<orders.length && i<orders_per_page*(orders_current_page+1); i++) {

        // Pokaż wpisy
        var order = orders[i];
        var item_html = '<li id="order' + order.id_order + '">' +
                    '<div class="id_driver">' + order.id_driver + '</div>' +
                    '<div class="id_order">' + order.id_order + '</div>' +
                    '<div class="edit">edit</div>' +
                    '<div class="course_date">'+order.course_date+'</div>' +
                    '<div class="startpoint_name">'+order.startpoint_name+'</div>' +
                    '<div class="notes">'+(order.notes==''||order.notes=='brak'?'&nbsp;':order.notes)+'</div>' +
                    '</li>';
        var item_obj = $(item_html);
        if (order.id_order == visibleOrdersSelected) item_obj.addClass('selected');
        container.append(item_obj);
        item_obj.click(function () {
            selectOrder(container, $(this));
        });
        item_obj.find('div.edit').click(function (a) {
            var id_order = $(this).parent().find('div.id_order').text();
            var order = visibleOrders[id_order].details;
            var div_dco=$('div#dialog_change_orders');
            if (div_dco.is(':visible')) div_dco.slideUp(150, function () {
                dialog_change_orders_fill(div_dco, order);
            });
            else dialog_change_orders_fill(div_dco, order);
            div_dco.removeClass('add').addClass('edit');
            div_dco.slideDown(300);
            div_dco.find('#tb_order_startpoint_name').focus();
            //selectOrder($(this).parent());
            //showPointByAddress($('#tb_order_startpoint_name').val());
            //return false;
        });
    }

    // Link - pokaż późniejsze wpisy
    linkIsActive=orders.length>orders_per_page*(orders_current_page+1);
    var item_html='<li class="more'+(linkIsActive?'':' locked')+'">'+
                '&darr;&darr; pokaż późniejsze &darr;&darr;'+
                '</li>';
    var item_obj=$(item_html);
    if (linkIsActive) item_obj.click(function () { // pokaż następne elementy na liście
        orders_current_page++;
        FillOrderList(orders);
    });
    container.append(item_obj);

}

showQuickMessage_lastZIndex=0;
showQuickMessage_visibleCount=0;
showQuickMessage_visiblePos=0;
function showQuickMessage(message, hide_after) {
    if (hide_after==null) hide_after=5000;
    var message_html='<div class="message_box">'+
                message+
                '</div>';
    var message_obj=$(message_html);
    message_obj.css('zIndex', 50000+showQuickMessage_lastZIndex);
    message_obj.css('top', message_obj.css('top')+50*(++showQuickMessage_visiblePos)+'px');
    showQuickMessage_lastZIndex++;
    showQuickMessage_visibleCount++;
    $('div.layout').append(message_obj);
    message_obj.fadeIn(300);
    message_obj.click(function () {
        showQuickMessage_hide(message_obj);
    });
    setTimeout(function () {
        showQuickMessage_hide(message_obj);
    }, hide_after);
}

function showQuickMessage_hide(message_obj) {
    message_obj.fadeOut(600, function () {$(this).remove();});
    showQuickMessage_visibleCount--;
    if (showQuickMessage_visibleCount==0) showQuickMessage_visiblePos=0;
}
