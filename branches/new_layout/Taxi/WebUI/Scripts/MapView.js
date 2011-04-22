﻿$(document).dblclick(function () {
    //MapShowMarkersDriver(tmpTaxi);
});

$(document).ready(function () {
    MapInit();
    GetOrderList();
    setInterval(function () {
        GetOrderList();
    }, 5000);
    $('div.rightmenu .new button').button().click(function () {
        div=$('div#dialog_change_orders');
        div.removeClass('edit').addClass('add');
        div.fadeIn(600);
        return false;
    });
    $('div#dialog_change_orders button').button().click(function () {
        $('div#dialog_change_orders').fadeOut(600);
        $.post(
            "ChangeOrders.aspx",
            {
                id_order: $('div#dialog_change_orders').find('#id_order').val(),
                course_date: $('div#dialog_change_orders').find('#order_course_date').val(),
                startpoint_name: $('div#dialog_change_orders').find('#order_startpoint_name').val(),
                client_name: $('div#dialog_change_orders').find('#order_client_name').val(),
                client_phone: $('div#dialog_change_orders').find('#order_client_phone').val(),
            },
            function (data) {
                alert("OK");
                GetOrderList();
            })
            //.success(function () { alert("second success"); })
            .error(function () { alert('Błąd połączenia przy dodawaniu zgłoszenia'); })
            .complete(function () { }
        );
        GetOrderList();
        return false;
    });
    $('div#dialog_change_orders .close').click(function() {
        $('div#dialog_change_orders').fadeOut(600);
    });
});

function GetOrderList() {
    orders = $.getScript('GetOrderList.aspx', function () {
        FillOrderList(orders);
        MapShowMarkersOrder(orders);
        MapShowMarkersOrder(orders);
    });
    drivers = $.getScript('GetDriverList.aspx?id_order=' + visibleOrdersSelected, function () {
        MapShowMarkersDriver(drivers);
    });
}

function FillOrderList(orders) {
    var container = $('div#itemlist div.content ul');
    container.find('li').remove();
    for (var i in orders) {
        var order = orders[i];
        item_html = '<li id="order' + order.id_order + '">' +
                    '<div class="id_driver">' + order.id_driver + '</div>' +
                    '<div class="id_order">' + order.id_order + '</div>' +
                    '<div class="edit">edit</div>' +
                    '<div class="course_date">'+order.course_date+'</div>' +
                    '<div class="startpoint_name">'+order.startpoint_name+'</div>' +
                    '<div class="notes">'+(order.notes==''?'&nbsp;':'Uwagi: '+order.notes)+'</div>' +
                    '</li>';
        var item_obj = $(item_html);
        if (order.id_order == visibleOrdersSelected) item_obj.addClass('selected');
        container.append(item_obj);
        item_obj.click(function () {
            MapSelectOrder($(this));
            container.find('li').removeClass('selected');
            $(this).addClass('selected');
            setTimeout(function () { //TODO wprowadzamy opóźnienie w pobieraniu taksówek, bo inaczej jeśli zamówienie znika w momencie kliknięcia, to nie pojawia się popup - to jest jeszcze do przetestowania
                GetOrderList();
            }, 300);
        });
        item_obj.find('div.edit').click(function (a) {
            var id_order = $(this).parent().find('div.id_order').text();
            var order = visibleOrders[id_order].details;
            var div=$('div#dialog_change_orders');
            div.find('#id_order').val(order.id_order),
            div.find('#order_course_date').val(order.course_date),
            div.find('#order_startpoint_name').val(order.startpoint_name),
            div.find('#order_client_name').val(order.client_name),
            div.find('#order_client_phone').val(order.client_phone),
            div.removeClass('add').addClass('edit');
            div.fadeIn(600);
            return false;
        });
    }
}