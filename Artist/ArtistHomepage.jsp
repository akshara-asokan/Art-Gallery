<%-- 
    Document   : ArtistHomepage
    Created on : 28 Jan, 2022, 12:13:30 AM
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
        <title>artist home</title>
    </head>
    <body>
       <h1>WELCOME</h1>
       <a href="Artwork.jsp">Artwork</a><br>
      
       <a href="ArtistEvent.jsp">New Events</a><br>
       <a href="ViewOrganizationEvent.jsp">Organization Events</a><br>
       <a href="ViewBidDetails.jsp">View Bid Details</a><br>
       <a href="ViewAcceptedBidDetails.jsp">View Accepted Bid Details</a><br>
       <a href="ViewEventRequest.jsp">View Event Request</a><br>
        <a href="EventComplaintView.jsp">Event Complaints</a><br>
        <a href="ArtistUserTicketBookings.jsp">User Bookings</a><br>
       <a href="ArtistProfile.jsp">My Profile</a><br>
       <a href="ArtistEditProfile.jsp">Edit Profile</a><br>
       <a href="ArtistChangePassword.jsp">Change Password</a><br>
       <a href="../Guest/Login.jsp">Logout</a>
    </body>
</html>
