<%-- 
    Document   : TicketRate
    Created on : Apr 22, 2022, 7:27:44 PM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(request.getParameter("btnsave")!=null){
            String ins="insert into tbl_ticketrates(tickettype_id,trate_value,artistevent_id)values('"+request.getParameter("type")+"','"+request.getParameter("txtrate")+"','"+request.getParameter("aid")+"')";
            con.executeCommand(ins);
            
        }
         if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_ticketrates where trate_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("TicketRate.jsp");
            }
        %>
        <form method="post">
            <table border="1" cellpadding="10" style="border-collapse: collapse">
                <tr>
                    <td>Ticket Type</td>
                    <td>
                        <select name="type">
                            <option value="" selected>--Select--</option>
                             <%
                                String sel="select * from tbl_tickettype";
                                ResultSet rs=con.selectCommand(sel);
                               
                                while(rs.next())
                                {
                                    
                            %>
                            <option value="<%=rs.getString("tickettype_id")%>"><%=rs.getString("tickettype_name")%></option>
                               
                            <%}%>      
                        </select>    
                    </td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td><input type="text" required="" autocomplete="off" name="txtrate" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Add"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
                        <br>
                        <hr>
                        <br>
                         <table align="center" border="1">
               <tr>
                   <td>Sl.no</td>
                   <td>Ticket Type</td>
                   <td>Rate</td>
                   <td>Event Name</td>
                   <td>Action</td>
               </tr>
               <%
                String s="select * from tbl_ticketrates v inner join tbl_tickettype tt on tt.tickettype_id=v.tickettype_id inner join tbl_artistevent ae on ae.artistevent_id=v.artistevent_id where ae.artistevent_id='"+request.getParameter("aid")+"'";
                
                ResultSet r=con.selectCommand(s);
                int i=0;
                while(r.next())
                {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r.getString("tickettype_name")%></td>
                <td><%=r.getString("trate_value")%></td>
                <td><%=r.getString("artistevent_name")%></td>
               <td><a href="TicketRate.jsp?did=<%=r.getString("trate_id")%>">Delete</a></td>
                
            </tr>  
            <%
            }
            %>
            <tr><td colspan="4" align="center"><a href="AdminHomepage.jsp">Home</a></td></tr>
           </table>
        </form>
    </body>
</html>
