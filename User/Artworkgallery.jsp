<%-- 
    Document   : ArtworkGallery
    Created on : Mar 11, 2022, 10:36:57 AM
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
        <title>Artwork Gallery</title>
        <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
        <h1>Artwork Gallery</h1>
        <form name="frmgallery">
            <table>
            <tr>
            <%
        String sel1="select * from tbl_artworkgallery a inner join tbl_artwork s on a.artwork_id=s.artwork_id inner join tbl_artist ar on ar.artist_id=s.artist_id where a.artwork_id='"+request.getParameter("aid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
            
                 <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                  <img width="100" height="70" src="../Assets/Artgallery/<%=rs1.getString("gallery_image") %>">
                 <br><%=rs1.getString("gallery_caption")%>
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
