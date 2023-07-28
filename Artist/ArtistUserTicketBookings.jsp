<%-- 
    Document   : UserTicketBookings
    Created on : Apr 23, 2022, 9:31:49 AM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Ticket Bookings</title>
    </head>
    <body>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <th>Sl.No</th>
                    <th>Name Of User</th>
                    <th>Booked Date</th>
                    <th>Booking Date</th>
                    <th>Number of Persons</th>
                    
                </tr>
                <%
                String sel="select * from tbl_ticketbooking tb inner join tbl_customer u on u.customer_id=tb.customer_id where tb.artistevent_id='"+request.getParameter("aid")+"'";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                <td><%=rs.getString("customer_name")%></td>
                <td><%=rs.getString("booked_date")%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("ticket_count")%></td>
                    </tr>
                    <%
                }
                %>
            </table>
        </form>
    </body>
</html>
