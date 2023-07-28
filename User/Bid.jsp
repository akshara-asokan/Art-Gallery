
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bid</title>
        <script src="../Assets/JQ/jQuery.js"></script>
        <%             if (request.getParameter("txtbtn")!=null) {
            
                session.setAttribute("aid", request.getParameter("aid"));
                 session.setAttribute("bid", request.getParameter("bid"));
                String amt = request.getParameter("txtname");
                String min="select max(bid_rate) as id from tbl_bid where artwork_id='"+session.getAttribute("aid")+"'";
                //String min="select bid_rate from tbl_artwork where artwork_id='"+session.getAttribute("aid")+"'";
                ResultSet rs=con.selectCommand(min);
                while(rs.next())
                {
               int m=Integer.parseInt(amt);
              //out.println(m);
             
               
              // out.println( );
                if(m>Integer.parseInt(rs.getString("id")))
                {
                String str1 = "insert into tbl_bid(artwork_id,customer_id,bid_rate,bid_time,bid_date)values('" + session.getAttribute("aid") + "','" + session.getAttribute("userid") + "','" +amt+ "',curtime(),curdate())";
                
                //out.println(str1);

                if (con.executeCommand(str1)) {
        %> 
                <script type="text/javascript">
                alert("Upload Successfully..");
              //  setTimeout(function(){window.location.href='ViewArtwork.jsp'},100);
                </script>
        <%
                }
                }
                else
                { 
         %>
                 <script type="text/javascript">
                alert("Amount entered should be greater than minimum amount");
            //    setTimeout(function(){window.location.href='ViewArtwork.jsp'},100);
                </script>
         <%      
                }
                }
                
                
                }
        %>
    </head>
    <body>
        <form name="frmbid" method="POST">
            <table align="center" border="1">
                <tr>
                    <td>Enter amount</td>
                    <td><input type="text" name="txtname" value="" required></td>
                </tr>
                <tr>

                    <td><input type="submit" name="txtbtn" id="txtbtn" value="submit"></td>
                </tr> 
            </table>   
        </form> 
    </body>
</html>
