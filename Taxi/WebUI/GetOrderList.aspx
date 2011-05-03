<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetOrderList.aspx.cs" Inherits="GetOrderList" %>

<%
    Random random=new Random();
%>

orders = new Array();

order = {
    lon: 17.034069,
    lat: 51.111418,
    course_date: '2011-05-01 13:00',
    startpoint_name: 'Kuźnicza 16',
    client_name: 'Jan Kowalski',
    client_phone: '500123456',
    notes: 'ten punkt nigdy nie znika',
    id_order: 5,
    id_driver: 10 // przypisana taksówka, po kliknięciu zgłoszenia (np. w menu po prawej) taksówkarz z tym id zostanie oznaczony na mapie w inny sposób, ale nie wiem czy będziemy z tego korzystać, bo to zakłada że gdzieś będą wypisane wszystkie zgłoszenia, razem z tymi już do kogoś przypisanymi
};
<%= random.Next(0, 1) == 0 ? "orders[orders.length] = order;" : "" %>

order={
    lon: 17.035802,
    lat: 51.108425,
    course_date: '2011-04-18 19:46',
    startpoint_name: 'Oławska 16',
    client_name: 'Mariusz Nowak',
    client_phone: '533876543',
    notes: 'limuzyna, taxi11',
    id_order: 6,
    id_driver: 13
};
<%= random.Next(0, 2) == 0 ? "orders[orders.length] = order;" : "" %>

order={
    lon: 17.016563,
    lat: 51.090122,
    course_date: '2011-04-18 20:05',
    startpoint_name: 'pl. Powstańców Śląskich',
    client_name: 'Jan Nikodem',
    client_phone: '500123456',
    notes: 'taxi13',
    id_order: 7,
    id_driver: 13
};
<%= random.Next(0, 2) == 0 ? "orders[orders.length] = order;" : "" %>

order={
    lon: 17.060480,
    lat: 51.107025,
    course_date: '2011-04-18 19:46',
    startpoint_name: 'Wybrzeże Stanisława Wyspiańskiego',
    client_name: 'Janusz Biernat',
    client_phone: '603600700',
    notes: '',
    id_order: 11,
    id_driver: null
};
<%= random.Next(0, 2) == 0 ? "orders[orders.length] = order;" : "" %>

order={
    lon: 17.067432,
    lat: 51.107402,
    course_date: '2011-04-18 19:46',
    startpoint_name: 'Wybrzeże Stanisława Wyspiańskiego, 51-627 Wrocław',
    client_name: 'Donald Tusk',
    client_phone: '999777555',
    notes: 'Długa lokalizacja do testów',
    id_order: 9,
    id_driver: null
};
<%= random.Next(0, 2) == 0 ? "orders[orders.length] = order;" : "" %>

