<%-- 
    Document   : Size.jsp
    Created on : 27 Jan, 2022, 11:30:03 AM
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
        <title>size</title>
    </head>
    <body>
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String siz="";
                siz=request.getParameter("txtname");
                if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_size set size_name='"+siz+"'where size_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("Size.jsp");
                   
                }
                else
                {
                String ins="insert into tbl_size(size_name)values('"+siz+"')";
                con.executeCommand(ins);
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_size where size_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Size.jsp");
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_size where size_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("size_id");
                    ename=rs1.getString("size_name");
                }
              }
        %>
       <form name="frmsize" method="post">
           <h3 align="center"> Size Details</h3>
           <table align="center" border="1">
               <input type="hidden" name="txtid" value="<%=eid%>">
               <tr>
                    <td>Size:</td>
                    <td><input type="text" name="txtname" value="<%=ename%>" width="200px"></td><br>
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
                   <td>Size</td>
                   <td>Action</td>
               </tr>
               <%                String sel="select * from tbl_size";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("size_name")%></td>
                <td><a href="Size.jsp?did=<%=rs.getString("size_id")%>">Delete</a>/<a href="Size.jsp?eid=<%=rs.getString("size_id")%>">Edit</a></td>
            </tr>  
            <%
            }
            %>
            <tr><td colspan="3" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
           </form>    
    </body>
</html>

