<%-- 
    Document   : EventsBooked
    Created on : Apr 9, 2022, 12:02:40 AM
    Author     : SONY VAIO
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint View</title>
    </head>
    <body>
        <h1><center>Complaint View</center></h1>

         <table border="1" align="center">

            <tr>
                <td>Sl.no</td>
                <td>User name</td>
                <td>Event name</td>
                <td>Complaint Description</td>
                <td>Action</td>

                </tr>
 <%
            String se1="select * from tbl_complaint c inner join tbl_customer a on c.customer_id=a.customer_id inner join tbl_artist ar on c.artist_id=ar.artist_id inner join tbl_artistevent ae on ae.artistevent_id=c.artistevent_id where c.complaint_status='0'";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("customer_name")%></td>
                 <td><%=rs2.getString("artistevent_name")%></td>
                <td><%=rs2.getString("complaint_description")%></td>
                <td><a href="ComplaintReply.jsp?eid=<%=rs2.getString("complaint_id")%>">Complaint Reply</a></td>
            
            <%
            }
            %>
          </table>
     </body>
</html>