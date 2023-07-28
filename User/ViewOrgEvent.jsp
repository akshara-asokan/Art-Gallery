<%-- 
    Document   : ViewOrgEvent
    Created on : 30 Jan, 2022, 7:14:58 PM
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
        <title>view org event</title>
       
    </head>
    <body>
       
         <h1 align="center">Organization Events</h1>
        <form name="frmevents" method="post" enctype="multipart/form-data">
            <table align="center">
              
                 <tr>
                <td>District</td>
                    <td>
                        <select name="district" id="district" onchange="getPlace(this.value)">
                            <option value="">--Select--</option>
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
                            <option value="">--Select--</option>
                                  
                        </select>     
                    </td>
                    <td><a href="Homepage.jsp">Home</a></td>
                </tr>
            </table>
                        <br><hr><br>
                        <div id="event">
                             <table align="center">
                <%
    
    String ss="select * from tbl_orgevent a inner join tbl_organization o on a.organization_id=o.organization_id inner join tbl_place sub on a.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id";
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
                   <img width="100" height="70" src="../Assets/Orgeventposter/<%=rr.getString("orgevent_poster") %>"><br>
                   Event name:<%=rr.getString("orgevent_name")%> <br>
                   Organization name:<%=rr.getString("organization_name")%> <br>
                   Address:<%=rr.getString("orgevent_address")%> <br>
                   Starting date:<%=rr.getString("orgevent_startingdate")%> <br>
                   Ending date:<%=rr.getString("orgevent_endingdate")%> <br>
                   Time:<%=rr.getString("orgevent_time")%> <br>
                   Amount:<%=rr.getString("eventpayment_amount")%> <br>
                   
                   <a href="OrgEventBooking.jsp?eid=<%=rr.getString("orgevent_id")%>&sdate=<%=rr.getString("orgevent_startingdate")%>&edate=<%=rr.getString("orgevent_endingdate")%>">
                       <input type="button" value="Book Ticket" name=""></a>               
                   <a href="EventGallery.jsp">
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
               getData()
	  }
	});
         
}
function getData()
{
    
    var did=document.getElementById("district").value;
    var pid=document.getElementById("place").value;
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxeventdata.jsp?did="+did+"&pid="+pid,
	  success: function(html){
		$("#event").html(html);              
	  }
	});
}
</script>
</html>

                            
                            
                            
                            
           