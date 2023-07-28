<%-- 
    Document   : Ajaxartisteventsrch
    Created on : 9 Feb, 2022, 12:30:56 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String did="", pid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
    String sel="select * from tbl_artistevent a inner join tbl_artist ar on a.artist_id=ar.artist_id inner join tbl_place sub on a.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id";
   
     if(did!="")
    {
        sel+=" and t.district_id='"+did+"'";
    }
    if(pid!="")
    {
        sel+=" and sub.place_id='"+pid+"'";
    }
    %>
    
    <table>
        
       <tr>
            <%
    ResultSet res=con.selectCommand(sel);
    System.out.println(sel);
                int j=0;
                while(res.next())
                {
                    j++;
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                  <img width="100" height="70" src="../Assets/Artisteventposter/<%=res.getString("artistevent_poster") %>"><br>
                   Artist name:<%=res.getString("artist_name")%> <br>
                   Event name:<%=res.getString("artistevent_name")%> <br>
                   Address:<%=res.getString("artistevent_address")%> <br>
                   Starting date:<%=res.getString("artistevent_startingdate")%> <br>
                   Ending date:<%=res.getString("artistevent_endingdate")%> <br>
                   Time:<%=res.getString("artistevent_time")%> <br>
                   Amount:<%=res.getString("artistevent_rate")%> <br>
                   
                   <a href="Book.jsp">
                       <input type="button" value="Book Ticket" name=""></a>
                   <a href="ArtistEventGallery.jsp">
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





