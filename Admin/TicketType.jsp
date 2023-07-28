<%-- 
    Document   : District
    Created on : 7 Jan, 2022, 1:51:58 PM
    Author     : asus
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Type</title>
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
                    String up="update tbl_tickettype set tickettype_name='"+dis+"'where tickettype_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("TicketType.jsp");
                   
                }
                else
                {
                String ins="insert into tbl_tickettype(tickettype_name)values('"+dis+"')";
                con.executeCommand(ins);
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_tickettype where tickettype_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("TicketType.jsp");
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_tickettype where tickettype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("tickettype_id");
                    ename=rs1.getString("tickettype_name");
                }
              }
        %>
       <form name="frmtickettype" method="post">
           <h3 align="center"> Ticket Type Details</h3>
           <table align="center" border="1">
               <input type="hidden" name="txtid" value="<%=eid%>">
               <tr>
                    <td>Ticket Type:</td>
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
                   <td>Ticket Type</td>
                   <td>Action</td>
               </tr>
               <%                String sel="select * from tbl_tickettype";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("tickettype_name")%></td>
                <td><a href="TicketType.jsp?did=<%=rs.getString("tickettype_id")%>">Delete</a>/<a href="TicketType.jsp?eid=<%=rs.getString("tickettype_id")%>">Edit</a></td>
            </tr>  
            <%
            }
            %>
           
           </table>
           </form>    
    </body>
</html>
