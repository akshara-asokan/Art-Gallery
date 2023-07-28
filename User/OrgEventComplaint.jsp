<%-- 
    Document   : OrgEventComplaint
    Created on : Apr 9, 2022, 11:57:34 AM
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
                
             String s="insert into tbl_complaint(customer_id,organization_id,orgevent_id,complaint_description,complaint_date) values('"+session.getAttribute("userid")+"','"+session.getAttribute("arid")+"','"+session.getAttribute("aid")+"','"+request.getParameter("txtcomplaint")+"',curdate())"; 
            //out.println(s);
             boolean status=con.executeCommand(s);
    
    if(status==true)
    {
      %> 
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='orgeventbooked.jsp'},100);
             </script>
              <%   
            }
    
            }
        %>
            <h1><center>Complaint</center></h1>
    <form name="frmComplaint" method="post">
        <table align="center">
            <input type="hidden" name="txthidden"  required>
          <tr>
                <td>Complaint</td>
                <td><textarea name="txtcomplaint" required></textarea></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Send Complaint">
                    </td>
                </tr>
        </table>
       
        </form>
            <hr><h2>Complaints</h2>
            <table><tr>
            <%
            String s="select * from tbl_complaint where customer_id='"+session.getAttribute("userid")+"' and artist_id='0'";
    ResultSet rr=con.selectCommand(s);
    System.out.println(s);
                int j=0;
                while(rr.next())
                {
                    j++;
                    
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                  
                   You:<%=rr.getString("complaint_description")%> <br>
                   Reply:<%=rr.getString("complaint_reply")%> <br>
               
            </p>
           </td>
           
            <%
            if(j==4)
            {%></tr><tr>
                   <%
                j=0;
            }
            }
            %>
        </table>
            
            
    </body>
</html>

    
