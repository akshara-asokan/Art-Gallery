<%-- 
    Document   : District
    Created on : 7 Jan, 2022, 1:51:58 PM
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
        <title>district</title>
    </head>
    <body>
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String dis="";
                dis=request.getParameter("txtname");
                if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_district set district_name='"+dis+"'where district_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("District.jsp");
                   
                }
                else
                {
                String ins="insert into tbl_district(district_name)values('"+dis+"')";
                con.executeCommand(ins);
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("District.jsp");
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("district_id");
                    ename=rs1.getString("district_name");
                }
              }
        %>
       <form name="frmdistrict" method="post">
           <h3 align="center"> District Details</h3>
           <table align="center" border="1">
               <input type="hidden" name="txtid" value="<%=eid%>">
               <tr>
                    <td>District:</td>
                    <td><input type="text" name="txtname" value="<%=ename%>" width="200px" required></td><br>
               </tr>
               <tr>
                   <td colspan="2"><div align="center"><input type="submit" name="btnsave" value="Save"> 
                           <input type="reset" name="btnreset" value="Reset"></div></td>  
               </tr>
           </table>
           <br>
           <table align="center" border="1">
               <tr>
                   <td>Sl.no</td>
                   <td>District name</td>
                   <td>Action</td>
               </tr>
               <%                String sel="select * from tbl_district";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>/<a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
            </tr>  
            <%
            }
            %>
            <tr><td colspan="3" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
           </form>    
    </body>
</html>
