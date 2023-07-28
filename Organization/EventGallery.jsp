<%-- 
    Document   : ArtworkGallery
    Created on : 28 Jan, 2022, 11:06:14 AM
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
        <title>Eventgallery</title>
        <script src="../Assets/JQ/jQuery.js"></script>
     
    </head>
    <body>
          <%
            session.setAttribute("aid",request.getParameter("aid"));
            %>
        <h1 align="center">Works</h1>
        <form name="frmworks" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/EventgalleryUploadAction.jsp">
            <table align="center" border="1">
               
                <tr>
                    <td>Event Title</td>
                    <td><input type="text" name="txtname" value="" required></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="image"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="btnreset" value="RESET">
                    </td>
                </tr>
            </table>
            <%
            String sel1="select * from tbl_eventgallery a inner join tbl_orgevent o on a.orgevent_id=o.orgevent_id inner join tbl_organization or on or.organization_id=o.organization_id where o.orgevent_id='"+session.getAttribute("aid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("event_caption")%></td>
                
                <td><img width="100" height="70" src="../Assets/EventGallery/<%=rs1.getString("event_image") %>"></td>
               
                <td> <a href="EventGallery.jsp?ddid=<%=rs1.getString("eventgalley_id")%>">Delete</a></td>
                 
            </tr>  
            <%
            }
            %>
        </form>
        
    </body>
</html>


<%--<form name="frmeventgallery">
        <h3 align="center">Event Gallery</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                   <td>Title</td>
                   <td>Photo</td>
                   
                   <td>Action</td>
               </tr>
               <%   
            
             if(request.getParameter("ddid")!=null)
            {
                String del="delete from tbl_eventgallery where eventgalley_id='"+request.getParameter("ddid")+"'";
                con.executeCommand(del);
                response.sendRedirect("EventGallery.jsp");
            }
           
                String sel1="select * from tbl_eventgallery a inner join tbl_orgevent o on a.orgevent_id=o.orgevent_id inner join tbl_organization or on or.organization_id=o.organization_id where o.orgevent_id='"+session.getAttribute("aid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("event_caption")%></td>
                
                <td><img width="100" height="70" src="../Assets/EventGallery/<%=rs1.getString("event_image") %>"></td>
               
                <td> <a href="EventGallery.jsp?ddid=<%=rs1.getString("eventgalley_id")%>">Delete</a></td>
                 
            </tr>  
            <%
            }
            %>
        </table>
        </form>
--%>