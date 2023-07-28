<%-- 
    Document   : ArtistEventGallery
    Created on : 4 Feb, 2022, 10:19:15 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" conte nt="text/html; charset=UTF-8">
        <title>Artist event gallery</title>
        <script src="../Assets/JQ/jQuery.js"></script>
     
    </head>
    <body>
          <%
            session.setAttribute("aid",request.getParameter("aid"));
            %>
        <h1 align="center">Works</h1>
        <form name="frmworks" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/ArtistEventGalleryUploadAction.jsp">
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
        </form>
        <form name="frmvieweventgallery">
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
                response.sendRedirect("ArtistEventGallery.jsp");
            }
           
                String sel1="select * from tbl_eventgallery a inner join tbl_artistevent s on a.artistevent_id=s.artistevent_id inner join tbl_artist ar on ar.artist_id=s.artist_id";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("event_caption")%></td>
                
                <td><img width="100" height="70" src="../Assets/Artisteventgallery/<%=rs1.getString("event_image") %>"></td>
               
                <td> <a href="ArtistEventGallery.jsp?ddid=<%=rs1.getString("eventgalley_id")%>">Delete</a></td>
                 
            </tr>  
            <%
            }
            %>
        </table>
        </form>
    </body>
</html>

