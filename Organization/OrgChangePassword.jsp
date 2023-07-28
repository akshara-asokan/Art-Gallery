<%-- 
    Document   : ChangePassword
    Created on : 12 Jan, 2022, 11:58:23 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>org change password</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String current="", confirm="";
                String ne=" ";
               
                current=request.getParameter("txtpwd1");
                ne=request.getParameter("txtpwd2");
                confirm=request.getParameter("txtpwd3");
                 String sel="select * from tbl_organization where organization_id='"+session.getAttribute("organizationid")+"' and organization_password='"+current+"' ";
            ResultSet rs=con.selectCommand(sel);
           
           
            if(rs.next())
            {
                
                
                   if(ne.equals(confirm))
                 {
                     String up="update tbl_organization set organization_password='"+ne+"' where organization_id='"+session.getAttribute("organizationid")+"'";
                    con.executeCommand(up);
                    %>
                   <script>alert("password updated");</script>
                     <%
                    //response.sendRedirect("ChangePassword.jsp");
                     
                 }
                 else
                   {
                    %>
                   <script>alert("password mismatch");</script>
                     <%
                   }
                 }
             
             else
             {
                %>
                     <script>alert("Your current password is incorrect");</script>
                     <%
             }
            }
        %>
        <h1 align="center">CHANGE PASSWORD</h1>
        <form name="frmchangepassword">
            <table align="center">
                <tr>
                    <td>Current Password</td><td><input type="password" name="txtpwd1"></td>
                </tr>
                <tr>
                    <td>New Password</td><td><input type="password" name="txtpwd2" pattern="[A-Za-z0-9@#$%]{8,10}"></td>
                </tr>
                <tr>
                    <td> Confirm Password</td><td><input type="password" name="txtpwd3" pattern="[A-Za-z0-9@#$%]{8,10}"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
                <tr><td colspan="4" align="center"><a href="OrgnizationHomepage.jsp">Home</a></td></tr>
            </table>      
        </form>
    </body>
</html>


