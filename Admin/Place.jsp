 <%-- 
    Document   : Place
    Created on : 30 Dec, 2021, 11:08:04 AM
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
        <title>Place</title>
    </head>
    <body>
        
       <%
             String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String d="";
                d=request.getParameter("district");
                String place="";
                place=request.getParameter("txtplace");
                  if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_place set place_name='"+place+"'where place_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("Place.jsp");
                   
                }
                else
                {
               String in="insert into tbl_place(district_id,place_name)values('"+d+"','"+place+"')";
                con.executeCommand(in);
            }
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_place where place_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("place_id");
                    ename=rs1.getString("place_name");
                }
              }   
            
             if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Place.jsp");
            }
        %>
        <h1 align="center">Place</h1>
        <form name="frmplace" method="post">
            <table align="center" border="1">
                <input type="hidden" name="txtid" value="<%=eid%>">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district">
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
                    <td><input type="text" name="txtplace" value="<%=ename%>" required></td>
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
                   <td>District</td>
                   <td>Place</td>
                   <td>Action</td>
               </tr>
               <%
                String s="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                ResultSet r=con.selectCommand(s);
                int i=0;
                while(r.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r.getString("district_name")%></td>
                <td><%=r.getString("place_name")%></td>
               <td><a href="Place.jsp?did=<%=r.getString("place_id")%>">Delete</a>/<a href="Place.jsp?eid=<%=r.getString("place_id")%>">Edit</a></td>
                
            </tr>  
            <%
            }
            %>
            <tr><td colspan="4" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
        </form>
    </body>
</html>
