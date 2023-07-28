<%-- 
    Document   : ViewFeedback
    Created on : Apr 9, 2022, 4:11:46 PM
    Author     : SONY VAIO
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback View</title>
    </head>
    <body>
        <h1><center>Feedback View</center></h1>

         <table border="1" align="center">

            <tr>
                <td>Sl.no</td>
                <td>User name</td>
                <td>Artist event</td>
                <td>Feedback</td>
               

                </tr>
 <%
            String se1="select * from tbl_feedback f inner join tbl_customer c on f.customer_id=c.customer_id inner join tbl_organization org on f.organization_id=org.organization_id inner join tbl_orgevent oe on oe.orgevent_id=f.orgevent_id";
            ResultSet rs2=con.selectCommand(se1);
            int k=0;
            while(rs2.next())
            {
               
            k++;
            %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("customer_name")%></td>
                 <td><%=rs2.getString("orgevent_name")%></td>
                <td><%=rs2.getString("feedback_description")%></td>
               
            <%
            }
            %>
          </table>
     </body>
</html>
