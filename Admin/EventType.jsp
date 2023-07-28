

<%-- 
    Document   : EventType.jsp
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
        <title>event type</title>
    </head>
    <body>
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String event="";
                event=request.getParameter("txtname");
                if(request.getParameter("eid")!=null)
                {
                    String up="update tbl_eventtype set eventtype_name='"+event+"'where eventtype_id='"+request.getParameter("txtid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("EventType.jsp");
                   
                }
                else
                {
                String ins="insert into tbl_eventtype(eventtype_name)values('"+event+"')";
                con.executeCommand(ins);
            }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_eventtype where eventtype_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("EventType.jsp");
            }
              if(request.getParameter("eid")!=null)
              {
                String sel1="select * from tbl_eventtype where eventtype_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel1);
  
                if(rs1.next())
                {
                    eid=rs1.getString("eventtype_id");
                    ename=rs1.getString("eventtype_name");
                }
              }
        %>
       <form name="frmeventtype" method="post">
           <h3 align="center"> EventType Details</h3>
           <table align="center" border="1">
               <input type="hidden" name="txtid" value="<%=eid%>">
               <tr>
                    <td>Event Type:</td>
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
                   <td>Event Type</td>
                   <td>Action</td>
               </tr>
               <%String sel="select * from tbl_eventtype";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("eventtype_name")%></td>
                <td><a href="EventType.jsp?did=<%=rs.getString("eventtype_id")%>">Delete</a>/<a href="EventType.jsp?eid=<%=rs.getString("eventtype_id")%>">Edit</a></td>
            </tr>  
            <%
            }
            %>
            <tr><td colspan="3" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
           </form>    
    </body>
</html>


