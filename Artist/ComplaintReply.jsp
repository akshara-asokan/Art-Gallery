<%-- 
    Document   : ComplaintReply
    Created on : Apr 9, 2022, 8:37:59 AM
    Author     : SONY VAIO
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Reply</title>
    </head>
    <body>
         <%
          
             if(request.getParameter("btnsave")!=null)
            {
            String dis="";
            String up="update tbl_complaint set complaint_reply='"+request.getParameter("txtcomplaintreply")+"',complaint_status='1' where complaint_id='"+request.getParameter("eid")+"'";

            //out.println(s);
             con.executeCommand(up);
             %>
             <script>alert("Reply Send Successfully");
             </script>
              <%   
            }
        %>
        <table align="center">
                <form name="frmComplaintreply" method="post">

           <h2><center>Complaint</center></h2>
          
            <tr>
                <td><center>Complaint Reply</center></td>
                <td><textarea name="txtcomplaintreply"></textarea></td>
</tr>
  <tr> 
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Send Reply">
                       
                    </td>
                </tr>
               
        </table>

              </form>    
     </body>
</html>
