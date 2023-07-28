<%-- 
    Document   : Homepage
    Created on : 28 Jan, 2022, 12:14:10 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user homepage</title>
    </head>
    <body>
        <h1>Hello!</h1>
        <a href="ViewArtistEvent.jsp">View artist events</a><br>
        <a href="ViewArtwork.jsp">View artwork</a><br>
        <a href="ViewOrgEvent.jsp">View organization event</a><br>
        <a href="UserProfile.jsp">My Profile</a><br>
        <a href="UserEditProfile.jsp">Edit Profile</a><br>
        <a href="UserChangePassword.jsp">Change Password</a><br>
        <a href="BidRequests.jsp">Bid Request</a><br>
        <a href="MyOrders.jsp">My Orders</a><br>
        <a href="EventsBooked.jsp">Booked Events</a><br>
        <a href="orgeventbooked.jsp">Booked Events of Organization</a><br>
       
        <a href="../Guest/Login.jsp">Logout</a>
       
    </body>
</html>
