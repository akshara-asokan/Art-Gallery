<%-- 
    Document   : ViewBidDetails.jsp
    Created on : 3 Mar, 2022, 7:16:41 PM
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
        <title>View bid details</title>
         <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
         <%
         if(request.getParameter("arid")!=null){
        session.setAttribute("arid",request.getParameter("arid"));
         }
         //out.println(session.getAttribute("arid"));
            if(request.getParameter("aid")!=null)
            {
                 
                //String up="update tbl_bid set bid_status='1' where bid_id='"+request.getParameter("aid")+"'";
                //con.executeCommand(up);
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {request.getParameter("eid")};
                    String name = request.getParameter("name");
                    String art = request.getParameter("ar");
                    String subject = "Bid Acceptance ";
                   //String artist="select artist_name from tbl_artist where artist_id='"+session.getAttribute("artistid")+"'";
                   //ResultSet rs=con.selectCommand(artist);
                  // out.println(artist);
                        String text = "Dear " + name + ",  \r\n \r\n"
                                + " It is with great pleasure we inform you that has chosen to accept your bid for buying "
                                + " artwork entitled with '"+art+"'.\r\n"
                                + " We carefully reviewed all bids but founds yours was the perfect budget. "
                                + " If you have any questions,and if there is anything we can improve please reply to this email. "
                                + " we were always happy to help!. \r\n"
                                + " Best Regards, \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                    if(b){
                    String up="update tbl_bid set bid_status='1' where bid_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up);
               String upd="update tbl_artwork set artwork_status='1' where artwork_id='"+session.getAttribute("arid")+"'";
                con.executeCommand(upd);
                //out.println(upd);
                    }
                    //response.sendRedirect("Artwork.jsp");
            
            }
             if(request.getParameter("rid")!=null)
            {
              String upd="update tbl_bid set bid_status='2' where bid_id='"+request.getParameter("rid")+"'";
              con.executeCommand(upd);
              response.sendRedirect("Artwork.jsp");  
            
            }
              
            %>
        <form name="frmview">
            </table>
        
            <h3 align="center">Bid Amounts</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                    <td>Customer Name</td>
                   <td>Artwork Name</td>
                   <td>Bid Date</td>
                   <td>Bid Time</td>
                   <td>Rate</td>
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_artwork ar inner join tbl_bid b on b.artwork_id=ar.artwork_id inner join tbl_customer c on c.customer_id=b.customer_id where ar.artwork_id='"+request.getParameter("arid")+"' order by b.bid_rate desc";
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
                
                <td> <a href="ViewBidDetails.jsp?aid=<%=rs1.getString("bid_id")%>&eid=<%=rs1.getString("customer_email")%>&name=<%=rs1.getString("customer_name")%>&ar=<%=rs1.getString("artwork_name")%>">Accept</a>/<a href="ViewBidDetails.jsp?rid=<%=rs1.getString("bid_id")%>">Reject</a></td>
            </tr>
                <%
            }
            %>
            <tr><td colspan="7" align="center"><a href="ArtistHomepage.jsp">Home</a></td></tr>
        </table>
        </form>
    </body>
</html>
    