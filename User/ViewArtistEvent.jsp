<%-- 
    Document   : ViewArtistEvent
    Created on : 30 Jan, 2022, 3:22:20 PM
    Author     : asus
--%>
<%@page import="java.util.*" %>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view artist event</title>
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
function getData()
{
    var did=document.getElementById("district").value;
    var pid=document.getElementById("place").value;
    //alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxartisteventsrch.jsp?did="+did+"&pid="+pid,
	  success: function(html){
		$("#event").html(html);
                //alert(html);
	  }
	});
}
</script>
    </head>
    <body>
       
         <h1 align="center">Artist Events</h1>
        <form name="frmevents" method="post" enctype="multipart/form-data">
            <table align="center">
              
                 <tr>
                <td>District</td>
                    <td>
                        <select name="district" id="district" onchange="getPlace(this.value),getData()">
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
                    
                    <td>Place</td>
                    <td>
                        <select name="place" id="place" onchange="getData()">
                            <option value="" selected>--Select--</option>
                                  
                        </select>     
                    </td>
                    <td><a href="Homepage.jsp">Home</a></td>
                </tr>
            </table>
                        <br><hr><br>
                        <div id="event">
                             <table align="center">
                <%
    Date d=new Date();
                    String da=d.toString();
    String ss="select * from tbl_artistevent a inner join tbl_artist ar on a.artist_id=ar.artist_id inner join tbl_place sub on a.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id where a.artistevent_endingdate<='"+da+"'";
    %>
    

        <tr>
            <%
    ResultSet rr=con.selectCommand(ss);
    System.out.println(ss);
                int j=0;
                while(rr.next())
                {
                    j++;
                    
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artisteventposter/<%=rr.getString("artistevent_poster") %>"><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Event name:<%=rr.getString("artistevent_name")%> <br>
                   Address:<%=rr.getString("artistevent_address")%> <br>
                   Starting date:<%=rr.getString("artistevent_startingdate")%> <br>
                   Ending date:<%=rr.getString("artistevent_endingdate")%> <br>
                   Time:<%=rr.getString("artistevent_time")%> <br>
                   Amount:<%=rr.getString("artistevent_rate")%> <br>
                   
                   <a href="Book.jsp?aid=<%=rr.getString("artistevent_id")%>&sdate=<%=rr.getString("artistevent_startingdate")%>&edate=<%=rr.getString("artistevent_endingdate")%>">
                       <input type="button" value="Book Ticket" name=""></a>
                       <a href="EventGalleryArtist.jsp?bid=<%=rr.getString("artistevent_id")%>">
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
                        </div>
        </form>
    </body>
</html>

                            
                            
                            
                            
           








