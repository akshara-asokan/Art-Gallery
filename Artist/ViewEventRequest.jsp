<%--
    Document   : BidRequests
    Created on : Mar 11, 2022, 11:39:07 AM
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
        <title>Event Request</title>
        <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
        <h1>Bid Request</h1>
        <table align="center">
            <tr>
        <%
        //String sl="select 
        String s="select * from tbl_orgeventreq orq inner join tbl_orgevent oe on orq.orgevent_id=oe.orgevent_id inner join tbl_organization o on o.organization_id=oe.organization_id inner join tbl_artist ar on ar.artist_id=orq.artist_id where orq.artist_id='" + session.getAttribute("artistid") + "'";
        ResultSet rr=con.selectCommand(s);
        //System.out.println(s);
        int j=0;
                while(rr.next())
                {
                    j++;
        String status=rr.getString("eventreq_status");
         int st=Integer.parseInt(status);
         
        %>
          
           
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                    <img width="100" height="70" src="../Assets/Orgeventposter/<%=rr.getString("orgevent_poster") %>"><br>
                   Event name:<%=rr.getString("orgevent_name")%> <br>
                   Organization name:<%=rr.getString("organization_name")%> <br>
                   Address:<%=rr.getString("orgevent_address")%> <br>
                   
                   Ticket Rate:<%=rr.getString("artistpayment_amount")%><br>
                   Status: <%
                   if(st==1)
                    {
                     out.println("Request sent");
                    }
                   else if(st==2)
                   {
                      out.println("Accepted /");
                      %><a href="EventPayment.jsp?rid=<%=rr.getString("orgeventreq_id")%>&name=<%=rr.getString("artist_name")%>&mail=<%=rr.getString("artist_email")%>">Payment</a>
                      <%
                   }
                   else if(st==3)
                   {
                      out.println("Rejected"); 
                   }
                   %>
                   
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
    </body>
</html>
