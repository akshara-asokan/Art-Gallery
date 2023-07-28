<%-- 
    Document   : ViewAcceptedBidDetails
    Created on : Mar 10, 2022, 12:34:45 AM
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
        <title>View Accepted Bid Details</title>
         <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
         <form name="frmview">
            
        
            <h3 align="center">Bid Amounts</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                    <td>Customer Name</td>
                   <td>Artwork Name</td>
                   <td>Bid Date</td>
                   <td>Bid Time</td>
                   <td>Rate</td>
                  
               </tr>
               <%                
                String sel1="select * from tbl_bid b inner join tbl_artwork ar on b.artwork_id=ar.artwork_id inner join tbl_customer c on c.customer_id=b.customer_id where b.bid_status='1' order by(bid_rate) desc";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                 <td><%=rs1.getString("customer_name")%></td>
                <td><%=rs1.getString("artwork_name")%></td>
               
                <td><%=rs1.getString("bid_date")%></td>
                <td><%=rs1.getString("bid_time")%></td>
                <td><%=rs1.getString("bid_rate")%></td>
                
     </tr>
                <%
            }
            %>
            <tr><td colspan="6" align="center"><a href="ArtistHomepage.jsp">Home</a></td></tr>
        </table>
        </form>
    </body>
</html>
