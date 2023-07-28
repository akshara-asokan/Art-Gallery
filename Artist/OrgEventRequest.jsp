<%--
    Document   : Book
    Created on : 18 Feb, 2022, 10:26:54 AM
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
        <title>orgeventreq</title>
    </head>
    <body>
         <%
            session.setAttribute("rid",request.getParameter("rid"));
          
         String str1="insert into tbl_orgeventreq(orgevent_id,artist_id,eventreq_status)values('"+session.getAttribute("rid")+"','"+session.getAttribute("artistid")+"','1')";
  System.out.println(str1);
   out.println(str1);
    boolean status=con.executeCommand(str1);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='ViewOrganizationEvent.jsp'},100);
        </script>
     <%
    }
      

        
  %>
    </body>
</html>
