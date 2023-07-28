<%-- 
    Document   : category
    Created on : 7 Jan, 2022, 2:42:28 PM
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
        <title>Artwork</title>
    </head>
    <body>
          <%
                String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                   String cat=request.getParameter("txttype");
                   if(request.getParameter("eid")!=null)
                    {
                        String up="update tbl_artworktype set artwork_type='"+cat+"'where artwork_id='"+request.getParameter("txtid")+"'";
                        con.executeCommand(up);
                        response.sendRedirect("ArtworkCategory.jsp");  
                    }
                    else
                    {
                        String ins="insert into tbl_artworktype(artwork_type)values('"+cat+"')";
                        con.executeCommand(ins);
                    }
            }    
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_artworktype where artwork_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ArtworkCategory.jsp");
            }
             if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_artworktype where artwork_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("artwork_id");
                    ename=rs1.getString("artwork_type");
                }
              }
        %>
        <form name="frmcategory" method="post">
           <h3 align="center"> Category Details</h3>
           <table align="center" border="1">
                <input type="hidden" name="txtid" value="<%=eid%>">
               <tr>
                    <td>Category:</td>
                    <td><input type="text" name="txttype" value="<%=ename%>" width="200px"></td><br>
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
                   <td>Category</td>
                   <td>Action</td>              
               </tr>
               <%
                String sel="select * from tbl_artworktype";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("artwork_type")%></td>
                <td><a href="ArtworkCategory.jsp?did=<%=rs.getString("artwork_id")%>">Delete</a>/<a href="ArtworkCategory.jsp?eid=<%=rs.getString("artwork_id")%>">Edit</a></td>
            </tr>  
            <%
            }
            %>
            <tr><td colspan="3" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
           </form>   
    </body>
</html>
