<%-- 
    Document   : ArtistEvent
    Created on : 28 Jan, 2022, 1:37:26 PM
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
        <title>Artist event</title>
        <script src="../Assets/JQ/jQuery.js"></script>
     <script>
function getPlace(did)
{
	//alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,
	  success: function(html){
		$("#place").html(html);
                //alert(html);
	  }
	});
}
</script>
    </head>
    <body>
      <h1 align="center">Event</h1>
        <form name="frmevents" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/EventUploadAction.jsp">
            <table align="center" border="1">
               
                <tr>
                    <td>Event Name</td>
                    <td><input type="text" name="txtname" value="" required></td>
                </tr>
                 <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"required>
                        </textarea>
                    </td>
                </tr>
                 <tr>
                <td>District</td>
                    <td>
                        <select name="district" onchange="getPlace(this.value)">
                            <option value="" selected>--Select--</option>
                             <%
                                String sel="select * from tbl_district";
                                ResultSet rs=con.selectCommand(sel);
                               
                                while(rs.next())
                                {
                                    
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                               
                            <%}%>      
                        </select>      
                    </td>
                </tr>    
                 <tr>
                    <td>Place</td>
                    <td>
                        <select name="place" id="place" required>
                            <option value="" selected>--Select--</option>
                           <%
                                String s="select * from tbl_place";
                                ResultSet r=con.selectCommand(s);
                               
                                while(r.next())
                                {
                                    
                            %>
                            <option value="<%=r.getString("place_id")%>"><%=r.getString("place_name")%></option>
                               
                            <%}%>         
                        </select>     
                    </td>
                </tr>
                <tr>
                    <td>Starting Date</td>
                    <td><input type="date" name="sdate"></td>
                </tr>
                <tr>
                    <td>Ending Date</td>
                    <td><input type="date" name="edate"></td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="text" name="time"></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="image"></td>
                </tr>
                <tr>
                    <td>Ticket Rate</td>
                    <td><input type="text" name="rate"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btnreset" value="RESET">
                    </td>
                </tr>
            </table>
        </form> 
                        
                                         <%
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_artistevent where artistevent_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ArtistEvent.jsp");
            }
            %>
        <form name="frmview">
            
        
            <h3 align="center">Events</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                   <td>Event Name</td>
                   <td>District</td>
                   <td>Place</td>
                   <td>Address</td>
                   <td>Starting Date</td>
                   <td>Ending Date</td>
                   <td>Time</td>
                   <td>Poster</td>
                   <td>Ticket Rate</td>
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_artistevent a inner join tbl_place sub on a.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id where a.artist_id='"+session.getAttribute("artistid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("artistevent_name")%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><%=rs1.getString("artistevent_address")%></td>
                <td><%=rs1.getString("artistevent_startingdate")%></td>
                <td><%=rs1.getString("artistevent_endingdate")%></td>
                <td><%=rs1.getString("artistevent_time")%></td>
                <td><img width="100" height="70" src="../Assets/Artisteventposter/<%=rs1.getString("artistevent_poster") %>"></td>
                <td><%=rs1.getString("artistevent_rate")%></td>
                
               
                <td> <a href="ArtistEvent.jsp?did=<%=rs1.getString("artistevent_id")%>">Delete</a>/<a href="ArtistEventGallery.jsp?aid=<%=rs1.getString("artistevent_id")%>">Add gallery</a>/<a href="TicketRate.jsp?aid=<%=rs1.getString("artistevent_id")%>">Add Ticket Rates</a>/<a href="ArtistUserTicketBookings.jsp?aid=<%=rs1.getString("artistevent_id")%>">User Bookings</a></td>
                 
            </tr>  
            <%
            }
            %>
            <tr><td colspan="11" align="center"><a href="ArtistHomepage.jsp">Home</a></td></tr>
        </table>
        </form>
    </body>
</html>

   

                   