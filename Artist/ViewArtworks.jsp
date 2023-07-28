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
        <title>view artwork</title>
    </head>
    <body>
        <%
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_artwork where artwork_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ViewArtworks.jsp");
            }
            %>
        <form name="frmview">
            </table>
        
            <h3 align="center">Artworks</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                   <td>Title</td>
                   <td>Size</td>
                   <td>Type</td>
                   <td>Sub type</td>
                   <td>Bid date</td>
                   <td>Bid time</td>
                   <td>Rate</td>
                   <td>Photo</td>
                   
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_artwork a inner join tbl_artworksubtype sub on a.artwork_subtypeid=sub.artwork_subtypeid inner join tbl_artworktype t on sub.artwork_id=t.artwork_id order by a.artwork_biddate desc";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("artwork_name")%></td>
                <td><%=rs1.getString("artwork_size")%></td>
                <td><%=rs1.getString("artwork_subtypename")%></td>
                <td><%=rs1.getString("artwork_type")%></td>
                <td><%=rs1.getString("artwork_biddate")%></td>
                <td><%=rs1.getString("artwork_bidtime")%></td>
                <td><%=rs1.getString("artwork_rate")%></td>
                <td><img width="100" height="70" src="../Assets/Artwork/<%=rs1.getString("artwork_photo") %>"></td>
               
                <td> <a href="ViewArtworks.jsp?did=<%=rs1.getString("artwork_id")%>">Delete</a>/<a href="ArtworkGallery.jsp?aid=<%=rs1.getString("artwork_id")%>">Add gallery</a></td>
                 
            </tr>  
            <%
            }
            %>
        </table>
        </form>
    </body>
</html>
