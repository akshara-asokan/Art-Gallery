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
        <title>Bid Request</title>
        <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
        <h1>Bid Request</h1>
        <table align="center">
            <tr>
        <%
        //String sl="select 
        String s="select * from tbl_bid b inner join tbl_artwork a on b.artwork_id=a.artwork_id inner join tbl_artist ar on ar.artist_id=a.artist_id inner join tbl_artworksubtype asb on asb.artwork_subtypeid=a.artwork_subtypeid inner join tbl_artworktype awt on awt.artwork_id=asb.artwork_id inner join tbl_customer c on c.customer_id=b.customer_id where b.customer_id='" + session.getAttribute("userid") + "'";
        ResultSet rr=con.selectCommand(s);
        System.out.println(s);
        int j=0;
                while(rr.next())
                {
                    j++;
        String status=rr.getString("bid_status");
         int st=Integer.parseInt(status);
         
        %>
          
           
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artwork/<%=rr.getString("artwork_photo") %>"><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Artwork name:<%=rr.getString("artwork_name")%> <br>
                   Size:<%=rr.getString("artwork_size")%> <br>
                   Artwork type:<%=rr.getString("artwork_type")%> <br>
                   Artwork subtype:<%=rr.getString("artwork_subtypename")%> <br>
                   Bid date:<%=rr.getString("bid_date")%> <br>
                   Bid time:<%=rr.getString("bid_time")%> <br>
                   Bid  amount:<%=rr.getString("bid_rate")%><br>
                   Status: <%
                   if(st==0)
                    {
                     out.println("Request sent");
                    }
                   else if(st==1)
                   {
                      out.println("Accepted /");
                      %><a href="Payment.jsp?bid=<%=rr.getString("bid_id")%>&aname=<%=rr.getString("artist_name")%>&amail=<%=rr.getString("artist_email")%>&uname=<%=rr.getString("customer_name")%>&umail=<%=rr.getString("customer_email")%>">Payment</a>
                      <%
                   }
                   else if(st==2)
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
