<%-- 
    Document   : ArtistProfile
    Created on : 18 Feb, 2022, 4:20:56 PM
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
        <title>artist profile</title>
    </head>
    <body>
        <h2 align="center">My Profile</h2>
        <table align="center">
            
            <%
            
                String sel="select * from tbl_artist where artist_id='"+session.getAttribute("artistid")+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                {
                %>
                
                <tr>
              
                    <td colspan="2"><img width="100" height="70" src="../Assets/Artist/<%=rs.getString("artist_photo") %>"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("artist_name") %></td>
            </tr>
            <tr>
                <td>Contact </td>
                <td><%=rs.getString("artist_contact") %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=rs.getString("artist_email") %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=rs.getString("artist_address") %></td>
            </tr>
            <tr>
                <td>Experience</td>
                <td><%=rs.getString("artist_exp") %></td>
            <%}%>
                   </tr>
                   <tr><td colspan="2" align="center"><a href="ArtistHomepage.jsp">Home</a></td></tr>

        </table>
    </body>
</html>

