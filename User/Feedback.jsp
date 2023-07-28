<%-- 
    Document   : Feedback
    Created on : Apr 9, 2022, 2:43:16 PM
    Author     : SONY VAIO
--%>



<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
      <%
          session.setAttribute("aid",request.getParameter("aid"));
          session.setAttribute("arid",request.getParameter("arid"));
             if(request.getParameter("btnsave")!=null)
            {
                
             String s="insert into tbl_feedback(customer_id,artist_id,artistevent_id,feedback_description,feedback_date) values('"+session.getAttribute("userid")+"','"+session.getAttribute("arid")+"','"+session.getAttribute("aid")+"','"+request.getParameter("txtfeedback")+"',curdate())"; 
            //out.println(s);
             boolean status=con.executeCommand(s);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='EventsBooked.jsp'},100);
             </script>
              <%   
            }
    
            }
        %>
            <h1><center>Feedback</center></h1>
    <form name="frmfeedback" method="post">
        <table align="center">
            <input type="hidden" name="txthidden"  required>
          <tr>
                <td>feedback</td>
                <td><textarea name="txtfeedback" required></textarea></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Send Complaint">
                    </td>
                </tr>
        </table>
       
        </form>
           
            
    </body>
</html>
