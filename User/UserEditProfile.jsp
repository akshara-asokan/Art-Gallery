<%-- 
    Document   : EditProfile
    Created on : 13 Jan, 2022, 12:29:24 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user edit</title>
        
    </head>
    <body>
        <body>
        
        <h1 align="center">Edit Profile</h1>
        <form name="frmeditprofile" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/CustomerEditUploadAction.jsp">
            <table align="center">
               <%
                  String sel="select * from tbl_customer where customer_id='"+session.getAttribute("userid")+"'";
                  ResultSet rs=con.selectCommand(sel);
                  if(rs.next())
                {
                %>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtfname" value="<%=rs.getString("customer_name") %>" required></td>
                                   
                </tr>
                
                <tr>
                   <td>Contact</td>
                   <td><input type="text" name="txtcontact" value="<%=rs.getString("customer_contact") %>" pattern="[0-9]{10}" required></td>
                </tr> 
                <tr>
                   <td>Email</td>
                    <td><input type="email" name="email" value="<%=rs.getString("customer_email") %>" required></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress"required><%=rs.getString("customer_address") %>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>Date Of Birth</td>
                    <td><input type="text" name="txtdob" value="<%=rs.getString("customer_dob") %>" required></td>
                </tr>
                
                <tr>
                    <td>Photo</td>
                    <td>
                        <img src="../Assets/User/<%=rs.getString("customer_photo") %>" name="txtlogo" id="profile-image" height="120" width="120" align="center" >
                        <input type="file" name="image" id="profile-image-upload" onchange="readURL(this)" style="display: none">
                    </td>
                </tr>
               
                <%}%>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnedit" value="EDIT PROFILE">
                    </td>
                </tr>  
                <tr><td colspan="2" align="center"><a href="Homepage.jsp">Home</a></td></tr>
            </table>
        </form>
    </body>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
<script>
$('#profile-image').on('click', function(callback) {
    $('#profile-image-upload').click();
});
 function readURL(input) {
    if (input.files && input.files[0]) {
   
      var reader = new FileReader();
      reader.onload = function (e) {
        document.querySelector("#profile-image").setAttribute("src",e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }

</script>


