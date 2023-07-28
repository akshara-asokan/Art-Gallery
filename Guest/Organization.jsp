<%-- 
    Document   : NewUser
    Created on : 30 Dec, 2021, 11:44:25 AM
    Author     : asus
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NewOrganization</title>
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
</script>
    </head>
    <body>
        <h1 align="center">Organization Registration</h1>
        <form name="frmneworganization" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/OrganizationUploadAction.jsp">
            <table align="center" border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="" required></td>
                </tr>
                
                <tr>
                   <td>Contact</td>
                   <td><input type="text" name="txtcontact" value="" pattern="[7-9]{1}[0-9]{9}" required></td>
                </tr> 
                <tr>
                   <td>Email</td>
                    <td><input type="email" name="email" value="" required></td>
                </tr>
                 <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"required>
                        </textarea>
                    </td>
                </tr>
               <tr>
                   <td>Since</td>
                    <td><input type="date" name="since" value="" required></td>
                </tr>
                <tr>
                <td>District</td>
                    <td>
                        <select name="district" onchange="getPlace(this.value)">
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
                </tr>    
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="place" id="place" required>
                            <option value="" selected>--Select--</option>
                           <%
                                String s="select * from tbl_place";
                                ResultSet r=con.selectCommand(s);
                               
                                while(r.next())
                                {
                                    
                            %>
                            <option value="<%=r.getString("place_id")%>"><%=r.getString("place_name")%></option>
                               
                            <%}%>                 
                        </select>     
                    </td>
                </tr> 
                
               
                <tr>
                    <td>Logo</td>
                    <td><input type="file" name="image" required></td>
                </tr>
                  <tr>
                    <td>Proof</td>
                    <td><input type="file" name="proof" required></td>
                </tr>
                <tr>
                   <td>Password</td>
                    <td><input type="password"  pattern="[A-Za-z0-9@#$%]{8,10}" name="txtpwd" value="" required></td>
                </tr>
                <tr>
                   <td>Confirm Password</td>
                    <td><input type="password" name="txtpwd1" value="" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="REGISTER">
                        <input type="reset" name="btnreset" value="RESET">
                        
                    </td>
                </tr>  
            </table>
        </form>    
    </body>
</html>
