                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <%-- 
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
        <title>View Artwork</title>
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
    var typ=document.getElementById("typ").value;
    var subtype=document.getElementById("subtype").value;
    //alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxdata.jsp?did="+did+"&pid="+pid+"&typ="+typ+"&subtype="+subtype,
	  success: function(html){
		$("#data").html(html);
                //alert(html);
	  }
	});
}
</script>
    </head>
    <body>
      <h1 align="center">Artworks</h1>
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
                </tr>
                <tr>
                    <td>Artwork Type</td>
                    <td>
                       
                            <select name="typ" id="typ" onchange="getSubtype(this.value),getData()">
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
                
                    <td>Artwork subtype</td>
                   
                    <td>
                        <select name="subtype" id="subtype" onchange="getData()">
                            <option value="" selected>--Select--</option>
                                
                        </select>     
                    </td>
                </tr>
                <td><a href="Homepage.jsp">Home</a></td>
            </table>
                        <br><hr><br>
                
                <div id="data">
                    <table align="center">
                        <tr>      
                
                <%
    
    String ss="select * from tbl_artwork ar  inner join tbl_artist a on a.artist_id=ar.artist_id inner join tbl_artworksubtype asb on asb.artwork_subtypeid=ar.artwork_subtypeid inner join tbl_artworktype awt on awt.artwork_id=asb.artwork_id where ar.artwork_status='0'";
     ResultSet rr=con.selectCommand(ss);
    System.out.println(ss);
     int j=0;
                while(rr.next())
                {
                    j++;
               
  
                   String s1="select max(bid_rate) as id from tbl_bid where artwork_id='"+rr.getString("artwork_id")+"'";
                   //out.println(s1);
                   int i=0;
                    ResultSet rs1=con.selectCommand(s1);
                while(rs1.next())
                  {
                      i++;
                         %>    

           
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Artwork/<%=rr.getString("artwork_photo") %>"><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Artwork name:<%=rr.getString("artwork_name")%> <br>
                   Size:<%=rr.getString("artwork_size")%> <br>
                   Artwork type:<%=rr.getString("artwork_type")%> <br>
                   Artwork subtype:<%=rr.getString("artwork_subtypename")%> <br>
                   Bid date:<%=rr.getString("artwork_biddate")%> <br>
                   Bid time:<%=rr.getString("artwork_bidtime")%> <br>
                   Bid  amount:<%=rs1.getString("id")%><br>
                   <a href="Bid.jsp?aid=<%=rr.getString("artwork_id")%>">
                   <input type="button" value="Bid" name=""></a>
                     
                   <a href="Artworkgallery.jsp?aid=<%=rr.getString("artwork_id")%>">
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
                }
            %>
        
            
            
               
        </table>
                </div>
        </form>
    </body>
</html>




                
           