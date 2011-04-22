<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetDriverList.aspx.cs" Inherits="GetDriverList" %>

<%
    Random random=new Random();
%>

drivers = new Array();

driver = {
    lon: 17.014046,
    lat: 51.115485,
    id_driver: 10,
    status: 0,
    registration_number: 'ZVW432',
    licence_number: 'abc-def'
};
<%= random.Next(0, 4) == 0 ? "driver.lon -= 0.01;" : ""%> // testowe - żeby było widać jak się taksówki przesuwają po mieście
drivers[drivers.length] = driver;

driver = {
    lon: 17.063828,
    lat: 51.114946,
    id_driver: 11,
    status: 0,
    registration_number: 'ABCD1234',
    licence_number: 'ghi-jkl'
};
<%= random.Next(0, 4) == 0 ? "driver.lon -= 0.01;" : ""%>
drivers[drivers.length] = driver;

driver = {
    lon: 17.052841,
    lat: 51.074626,
    id_driver: 13,
    status: 0,
    registration_number: 'HJK876',
    licence_number: 'mno-prs'
};
<%= random.Next(0, 4) == 0 ? "driver.lon -= 0.01;" : ""%>
drivers[drivers.length] = driver;
