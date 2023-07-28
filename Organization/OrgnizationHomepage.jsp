<%-- 
    Document   : OrgnizationHomepage
    Created on : 28 Jan, 2022, 12:14:45 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="SessionValidator.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Org Homepage</title>
    </head>
    <body>
        <h1>Hello!</h1>
        <a href="OrganizationEvent.jsp">New Event</a><br>
         
         <a href="ViewArtistReq.jsp">View artist request</a><br>
         <a href="OrgProfile.jsp">My Profile</a><br>
         <a href="OrgEditProfile.jsp">Edit Profile</a><br>
         <a href="OrgChangePassword.jsp">Change Password</a><br>
         <a href="../Guest/Login.jsp">Logout</a>
    </body>
</html>
