<%-- 
    Document   : ArtistEventGallery
    Created on : 4 Mar, 2022, 3:31:06 PM
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
        <title>Org event gallery</title>
    </head>
    <body>
       
          <form name="frmvieweventgallery">
        <h3 align="center">Event Gallery</h3>
             <table align="center">
               <tr>
                   
               <%   
                String sel1="select * from tbl_eventgallery a inner join tbl_orgevent o on o.orgevent_id=a.orgevent_id inner join tbl_organization orn on orn.organization_id=o.organization_id";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
                <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                  <img width="100" height="70" src="../Assets/EventGallery/<%=rs1.getString("event_image") %>">
                 <br><%=rs1.getString("event_caption")%>
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
        </form> 
    </body>
</html>

                 
           
