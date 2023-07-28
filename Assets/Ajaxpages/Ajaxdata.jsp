<%-- 
    Document   : Ajaxdata
    Created on : 6 Feb, 2022, 12:16:25 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String did="", pid="", typ="", subtype="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
    typ=request.getParameter("typ");
    subtype=request.getParameter("subtype");
    String sel="select * from tbl_artwork a inner join tbl_artist ar on a.artist_id=ar.artist_id inner join tbl_artworksubtype sub on a.artwork_subtypeid=sub.artwork_subtypeid inner join tbl_artworktype t on sub.artwork_id=t.artwork_id inner join tbl_place pl on ar.place_id=pl.place_id inner join tbl_district d on pl.district_id=d.district_id";


    if(did!="")
    {
        sel+=" and d.district_id='"+did+"'";
    }
    if(pid!="")
    {
        sel+=" and pl.place_id='"+pid+"'";
    }
    if(typ!="")
    {
        sel+=" and t.artwork_id='"+typ+"'";
    }
    if(subtype!="")
    {
        sel+=" and sub.artwork_subtypeid='"+subtype+"'";
    }
    %>
    
    <table>
        
        <tr>
            <%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
                int j=0;
                while(rs.next())
                {
                    j++;
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artwork/<%=rs.getString("artwork_photo") %>"><br>
                   Artist name:<%=rs.getString("artist_name")%> <br>
                   Artwork name:<%=rs.getString("artwork_name")%> <br>
                   Size:<%=rs.getString("artwork_size")%> <br>
                   Artwork type:<%=rs.getString("artwork_type")%> <br>
                   Artwork subtype:<%=rs.getString("artwork_subtypename")%> <br>
                   Bid date:<%=rs.getString("artwork_biddate")%> <br>
                   Bid time:<%=rs.getString("artwork_bidtime")%> <br>
                   Bid starting amount:<%=rs.getString("artwork_rate")%> <br>
                   <a href="Bid.jsp">
                       <input type="button" value="Bid" name=""></a>
                   <a href="ArtworkGallery.jsp">
                       <input type="button" value="View gallery" name="">
                   </a>
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



