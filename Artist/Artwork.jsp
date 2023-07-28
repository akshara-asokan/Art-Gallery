<%-- 
    Document   : Artwork
    Created on : 28 Jan, 2022, 10:06:49 AM
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
        <title>Artwork</title>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
           function getSubtype(sid)
{
	//alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxsubtype.jsp?sid="+sid,
	  success: function(html){
		$("#subtype").html(html);
                //alert(html);
	  }
	});
}
</script>
    </head>
    <body>
        
         <h1 align="center">Artwork</h1>
        <form name="frmnewartwork" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/ArtworkUploadAction.jsp">
            <table align="center" border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="" required></td>
                </tr> 
                <tr>
                    <td>Type</td>
                    <td>
                       
                            <select name="typ" onchange="getSubtype(this.value)">
                            <option value="" selected>--Select--</option>
                           <%
                                String s="select * from tbl_artworktype";
                                ResultSet r=con.selectCommand(s);
                                while(r.next())
                                {
                                    
                            %>
                            <option value="<%=r.getString("artwork_id")%>"><%=r.getString("artwork_type")%></option>
                               
                            <%}%>                 
                        </select>     
                    </td>
                </tr> 
                
                  <tr>
                    <td>Subtype</td>
                   
                    <td>
                        <select name="subtype" id="subtype" required>
                            <option value="" selected>--Select--</option>
                           <%
                                String ss="select * from tbl_artworksubtype";
                                ResultSet res=con.selectCommand(ss);
                                while(res.next())
                                {
                                    
                            %>
                            <option value="<%=res.getString("artwork_subtypeid")%>"><%=res.getString("artwork_subtypename")%></option>
                               
                            <%}%>         
                        </select>     
                    </td>
                </tr>
                </tr> 
                <tr>
                   <td>Size</td>
                    <td><input type="text" name="txtsize" value="" required></td>
                </tr>
                 <tr>
                   <td>Bid Date</td>
                    <td><input type="date" name="biddate" value="" required></td>
                </tr>
                 <tr>
                   <td>Bid Time</td>
                    <td><input type="time" name="bidtime" value="" required></td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td><input type="text" name="txtrate" value="" required=""</td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="image" required></td>
                </tr>     
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="REGISTER">
                        <input type="reset" name="btnreset" value="RESET">
                    </td>
                </tr>  
            </table>
        </form> 
                        
            
        <%
             if(request.getParameter("ddid")!=null)
            {
                String del="delete from tbl_artwork where artwork_id='"+request.getParameter("ddid")+"'";
                con.executeCommand(del);
                String del1="delete from tbl_artworkgallery where artwork_id='"+request.getParameter("ddid")+"'";
                con.executeCommand(del1);
                response.sendRedirect("Artwork.jsp");
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
                   <td>Sub Type</td>
                   <td>Bid Date</td>
                   <td>Bid Time</td>
                   <td>Rate</td>
                   <td>Photo</td>
                   
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_artwork a inner join tbl_artworksubtype sub on a.artwork_subtypeid=sub.artwork_subtypeid inner join tbl_artworktype t on sub.artwork_id=t.artwork_id where a.artist_id='"+session.getAttribute("artistid")+"' order by a.artwork_biddate desc";
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
               
                <td> <a href="Artwork.jsp?ddid=<%=rs1.getString("artwork_id")%>">Delete</a>/<a href="ArtworkGallery.jsp?aid=<%=rs1.getString("artwork_id")%>">Add gallery</a>
                    /<a href="ViewBidDetails.jsp?arid=<%=rs1.getString("artwork_id")%>">View Bid Details</a></td>
                 
            </tr>  
            <%
            }
            %>
            <tr><td colspan="10" align="center"><a href="ArtistHomepage.jsp">Home</a></td></tr>
        </table>
        </form>
    </body>
</html>
 </body>
</html>





