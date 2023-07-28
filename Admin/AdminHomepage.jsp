<%-- 
    Document   : AdminHomepage
    Created on : 30 Jan, 2022, 2:52:53 PM
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
        <title>homepage</title>
    </head>
    <body>
       <h1>WELCOME</h1><br>
        <a href="District.jsp">Add district</a>
        <br><a href="Place.jsp">Add places</a>
         <br><a href="ArtworkCategory.jsp">Add artwork types</a>
        <br><a href="ArtworkSubCategory.jsp">Add artwork subtypes</a> 
        <br><a href="EventType.jsp">Event types</a>
        <br><a href="Size.jsp">Add size of artwork</a><br>
       <a href="ArtistVerification.jsp">Artist verification</a><br>
       <a href="OrganizationVerification.jsp">Organization verification</a><br>
       <a href="ViewFeedback.jsp">Artist Event Feedback</a><br>
       <a href="Orgevent_feedback.jsp">Org Event Feedback</a><br>
       <a href="TicketType.jsp">Add Ticket Type</a>
        <a href="../Guest/Login.jsp">Logout</a>
       </body>
</html>
