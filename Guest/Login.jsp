<%-- 
    Document   : Login.jsp
    Created on : 28 Jan, 2022, 12:02:58 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ArtGallery::Login</title>
     
    </head>
    <body>
        <%
            if(request.getParameter("btnlogin")!=null)
            {
                String selu="select * from tbl_customer where customer_email='"+request.getParameter("txtuname")+"' and customer_password='"+request.getParameter("txtpwd")+"'";
                ResultSet rs=con.selectCommand(selu);
                
                String sels="select * from tbl_artist where artist_email='"+request.getParameter("txtuname")+"' and artist_password='"+request.getParameter("txtpwd")+"' and artist_vstatus='1'";
                ResultSet rs1=con.selectCommand(sels);
                
                String sel1="select * from tbl_organization where organization_email='"+request.getParameter("txtuname")+"' and organization_password='"+request.getParameter("txtpwd")+"' and organization_vstatus='1'";
                ResultSet r1=con.selectCommand(sel1);
                
                String sel2="select * from tbl_admin where admin_username='"+request.getParameter("txtuname")+"' and admin_password='"+request.getParameter("txtpwd")+"'";
                ResultSet r2=con.selectCommand(sel2);
                
                if(rs.next())
                {
                    session.setAttribute("userid",rs.getString("customer_id"));
                    session.setAttribute("username", rs.getString("customer_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
                else if(rs1.next())
                {
                    session.setAttribute("artistid",rs1.getString("artist_id"));
                    session.setAttribute("artistname", rs1.getString("artist_name"));
                    response.sendRedirect("../Artist/ArtistHomepage.jsp");
                }
                 else if(r1.next())
                {
                    session.setAttribute("organizationid",r1.getString("organization_id"));
                    session.setAttribute("organizationname", r1.getString("organization_name"));
                    response.sendRedirect("../Organization/OrgnizationHomepage.jsp");
                }
                 else if(r2.next())
                {
                    session.setAttribute("aid",r2.getString("admin_id"));
                    session.setAttribute("adminuname", r2.getString("admin_username"));
                    response.sendRedirect("../Admin/AdminHomepage.jsp");
                }
                else
                {
                    %>
                    <script>alert('Invalid Login')</script>
                    <%
                }
            }
        %>
        
        <br><br><h1 align="center">Login</h1>
        <form name="frmlogin" method="post">
            <table align="center">
                <tr>
                   <td>Email</td>
                    <td><input type="text" name="txtuname" value="" required></td>
                </tr>
                <tr>
                   <td>Password</td>
                    <td><input type="password" name="txtpwd" value="" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnlogin" value="LOGIN">
                        <input type="reset" name="btnreset" value="RESET">
                    </td>
                </tr>  
                <tr>
                    <td colspan="2" align="center">
                        <br><a href="Artist.jsp">New Artist</a> | <a href="NewUser.jsp">New User</a> | <a href="Organization.jsp">New Organization</a>
                    </td>
                </tr>
            </table> 
        </form>    
    </body>
    
</html>

