<%-- 
    Document   : EventsBooked
    Created on : Apr 9, 2022, 12:02:40 AM
    Author     : SONY VAIO
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>events booked</title>
    </head>
    <body>
       
          <form name="frmvieweventgallery">
        <h3 align="center">Events</h3>
             <table align="center">
               <tr>
                   
               <%   
                String sel1="select * from tbl_artistticketbooking a inner join tbl_artistevent ae on ae.artistevent_id=a.artistevent_id inner join tbl_artist ar on ar.artist_id=ae.artist_id";
                ResultSet rr=con.selectCommand(sel1);
                int j=0;
                while(rr.next())
                {
                    j++;
            %>
           
                <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artisteventposter/<%=rr.getString("artistevent_poster") %>"><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Event name:<%=rr.getString("artistevent_name")%> <br>
                   Address:<%=rr.getString("artistevent_address")%> <br>
                   Starting date:<%=rr.getString("artistevent_startingdate")%> <br>
                   Ending date:<%=rr.getString("artistevent_endingdate")%> <br>
                   Time:<%=rr.getString("artistevent_time")%> <br>
                   Amount:<%=rr.getString("artistevent_rate")%> <br>
                   
                   <a href="Complaint.jsp?aid=<%=rr.getString("artistevent_id")%>&arid=<%=rr.getString("artist_id")%>">Add Complaints</a>
                      <a href="Rating.jsp?aid=<%=rr.getString("artistevent_id")%>&arid=<%=rr.getString("artist_id")%>">Rate Now</a>
                         <a href="Feedback.jsp?aid=<%=rr.getString("artistevent_id")%>&arid=<%=rr.getString("artist_id")%>">Add Feedback</a><br>
                   </p>
           </td>
           
            <%
            if(j==4)
            {%></tr><tr>
                   <%
                j=0;
            }
            }
            %>
        </table>
                        </div>
        </form>
    </body>
</html>