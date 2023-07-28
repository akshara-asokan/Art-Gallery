<%-- 
    Document   : MyOrders
    Created on : Mar 13, 2022, 10:51:32 AM
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
        <title>my orders</title>
    </head>
    <body>
        <%
        String sel="select * from tbl_artworkbooking ab inner join tbl_bid b on ab.bid_id=b.bid_id inner join tbl_artwork a on a.artwork_id=b.artwork_id inner join tbl_artist ar on ar.artist_id=a.artist_id where b.customer_id='"+session.getAttribute("userid")+"'";
       
        %>
        <form name="frmmyorders">
            <table>
                
        <tr>
            <%
    ResultSet rr=con.selectCommand(sel);
    //System.out.println(sel);
                int j=0;
                while(rr.next())
                {
                    j++;
            %>
               <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artwork/<%=rr.getString("artwork_photo") %>"><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Artwork name:<%=rr.getString("artwork_name")%> <br>
                   Size:<%=rr.getString("artwork_size")%> <br>
                   
                   Rate:<%=rr.getString("bid_rate")%> <br>
                   Booking Date:<%=rr.getString("artworkbooking_date")%> <br>
                   
                   
                   <a href="Bill.jsp?aid=<%=rr.getString("artworkbooking_id")%>">Get Bill</a>
                   </p>
           </td>
           
            <%
            if(j%4==0)
            {%></tr><tr>
                   <%
                j=0;
            }
            }
            %>
        </table>
        </form>
       </body>
</html>
