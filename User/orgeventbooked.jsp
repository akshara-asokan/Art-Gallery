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
                String sel1="select * from tbl_orgeventticket a inner join tbl_orgevent ae on ae.orgevent_id=a.orgevent_id inner join tbl_organization ar on ar.organization_id=ae.organization_id where a.status='1'";
                ResultSet rr=con.selectCommand(sel1);
                int j=0;
                while(rr.next())
                {
                    j++;
            %>
           
                <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Orgeventposter/<%=rr.getString("orgevent_poster") %>"><br>
                   Artist name:<%=rr.getString("organization_name")%> <br>
                   Event name:<%=rr.getString("orgevent_name")%> <br>
                   Organization name:<%=rr.getString("organization_name")%> <br>
                   Address:<%=rr.getString("orgevent_address")%> <br>
                   Starting date:<%=rr.getString("orgevent_startingdate")%> <br>
                   Ending date:<%=rr.getString("orgevent_endingdate")%> <br>
                   Time:<%=rr.getString("orgevent_time")%> <br>
                   Amount:<%=rr.getString("eventpayment_amount")%> <br>
                   
                   <a href="OrgEventComplaint.jsp?aid=<%=rr.getString("orgevent_id")%>&arid=<%=rr.getString("organization_id")%>">Add Complaints</a>
                      <a href="OrgEventRating.jsp?aid=<%=rr.getString("orgevent_id")%>&arid=<%=rr.getString("organization_id")%>">Rate Now</a>
                        <a href="Orgeventfeedback.jsp?aid=<%=rr.getString("orgevent_id")%>&arid=<%=rr.getString("organization_id")%>">Add Feedback</a><br>
                    
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