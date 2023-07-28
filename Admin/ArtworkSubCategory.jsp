<%-- 
    Document   : SubCategory
    Created on : 30 Dec, 2021, 11:16:36 AM
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
        <title>SubCategory</title>
    </head>
    <body>
         <%
             String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String c="";
                c=request.getParameter("category");
                String sub="";
                sub=request.getParameter("txtsubcategory");
                if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_artworksubtype set artwork_subtypename='"+sub+"'where artwork_subtypeid='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("ArtworkSubCategory.jsp");
                   
                }
                else
                {
                String insert="insert into tbl_artworksubtype(artwork_id,artwork_subtypename)values('"+c+"','"+sub+"')";
                con.executeCommand(insert);
                }
            }
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_artworksubtype where artwork_subtypeid='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("ArtworkSubCategory.jsp");
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_artworksubtype where artwork_subtypeid='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("artwork_subtypeid");
                    ename=rs1.getString("artwork_subtypename");
                }
              }
        %>
        <h1 align="center">Artwork SubCategory</h1>
        <form name="frmsubcategory" method="post">
            <table align="center" border="1">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>Category</td>
                    <td>
                        <select name="category">
                            <option value="" selected>--Select--</option>
                             <%
                                String sel="select * from tbl_artworktype";
                                ResultSet rs=con.selectCommand(sel);
                               
                                while(rs.next())
                                {
                                    
                            %>
                            <option value="<%=rs.getString("artwork_id")%>"><%=rs.getString("artwork_type")%></option>
                               
                            <%}%>    
                        </select>    
                    </td>
                </tr>    
                <tr>
                    <td>Sub Category</td>
                    <td><input type="text" name="txtsubcategory" value="<%=ename%>" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="submit" name="btncancel" value="CANCEL">
                    </td>
                </tr>  
            </table>
             <br>
           <table align="center" border="1">
               <tr>
                   <td>Sl.no</td>
                   <td>Category</td>
                   <td>Subcategory</td>
                   <td>Action</td>
               </tr>
               <%
                String s="select * from tbl_artworksubtype p inner join tbl_artworktype d on p.artwork_id=d.artwork_id";
                ResultSet r=con.selectCommand(s);
                int i=0;
                while(r.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r.getString("artwork_type")%></td>
                <td><%=r.getString("artwork_subtypename")%></td>
                <td><a href="ArtworkSubCategory.jsp?did=<%=r.getString("artwork_subtypeid")%>">Delete</a>/<a href="ArtworkSubCategory.jsp?eid=<%=r.getString("artwork_subtypeid")%>">Edit</a></td>
            </tr> 
            
            <%
            }
            %>
            <tr><td colspan="4" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
        </form>
    </body>
</html>
