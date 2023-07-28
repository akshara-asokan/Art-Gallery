<%-- 
    Document   : ViewArtistReq
    Created on : 18 Feb, 2022, 12:38:31 PM
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
        <title>Artist req</title>
        <script src="../Assets/JQ/jQuery.js"></script>
    </head>
    <body>
        <%
         if(request.getParameter("eid")!=null)
            {
                String ac="update tbl_orgeventreq set eventreq_status='2'";
                con.executeCommand(ac);
                response.sendRedirect("ViewArtistReq.jsp");
            }
              if(request.getParameter("rid")!=null)
              {
                 String re="update tbl_orgeventreq set eventreq_status='3'";
                con.executeCommand(re);
                response.sendRedirect("ViewArtistReq.jsp"); 
              }
        %>
        <h1>Request from artist</h1>
        <form name="artistreq">
              <table align="center">
                <%
    
    String ss="select * from tbl_orgeventreq a inner join tbl_artist ar on a.artist_id=ar.artist_id inner join tbl_orgevent s on a.orgevent_id=s.orgevent_id where eventreq_status='1'";
%>
    

        <tr>
            <%
    ResultSet rr=con.selectCommand(ss);
    System.out.println(ss);
                int j=0;
                while(rr.next())
                {
                    j++;
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   Event name:<%=rr.getString("orgevent_name")%><br>
                   Artist name:<%=rr.getString("artist_name")%> <br>
                   Email id:<%=rr.getString("artist_email")%> <br>
                  
                   <a href="artists_profile.jsp?aid=<%=rr.getString("artist_id")%>">View Profile</a>/<a href="ViewArtistReq.jsp?eid=<%=rr.getString("orgeventreq_id")%>">Accept</a>/<a href="ViewArtistReq.jsp?rid=<%=rr.getString("orgeventreq_id")%>">reject</a>
                   
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
        </tr>
               
        </table>
        </form>
        
    </body>
</html>
