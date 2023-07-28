<%-- 
    Document   : ViewArtworks
    Created on : 28 Jan, 2022, 11:52:52 AM
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
        <title>org event</title>
    </head>
    <body>
        <%
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_orgevent where orgevent_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewOrgEvents.jsp");
            }
            %>
        <form name="frmview">
            </table>
        
            <h3 align="center">Artworks</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                    <td>Organization</td>
                   <td>Event name</td>
                   <td>District</td>
                   <td>Place</td>
                   <td>Address</td>
                   <td>Starting date</td>
                   <td>Ending date</td>
                   <td>Time</td>
                   <td>Poster</td>
                   <td>Artist allowed</td>
                   <td>Artist Payment</td>
                   <td>Ticket rate</td>
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_orgevent o inner join tbl_organization org on o.organization_id=org.organization_id inner join tbl_place sub on o.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("organization_name")%></td>
                <td><%=rs1.getString("orgevent_name")%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><%=rs1.getString("orgevent_address")%></td>
                <td><%=rs1.getString("orgevent_startingdate")%></td>
                <td><%=rs1.getString("orgevent_endingdate")%></td>
                <td><%=rs1.getString("orgevent_time")%></td>
                <td><%=rs1.getString("orgevent_poster")%></td>
                <td><%=rs1.getString("orgevent_artistallowed")%></td>
                <td><%=rs1.getString("artistpayment_amount")%></td>
                <td><%=rs1.getString("eventpayment_amount")%></td>
                <td><img width="100" height="70" src="../Assets/Orgeventposter/<%=rs1.getString("orgevent_poster") %>"></td>
               
                <td> <a href="ViewOrgEvents.jsp?did=<%=rs1.getString("orgevent_id")%>">Delete</a>/<a href="EventGallery.jsp?aid=<%=rs1.getString("orgevent_id")%>">Add gallery</a></td>
                 
            </tr>  
            <%
            }
            %>
        </table>
        </form>
    </body>
</html>
