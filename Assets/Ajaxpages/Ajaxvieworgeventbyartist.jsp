<%-- 
    Document   : Ajaxeventdata
    Created on : 8 Feb, 2022, 11:32:33 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String did="", pid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
    String sel="select * from tbl_orgevent a inner join tbl_organization o on a.organization_id=o.organization_id inner join tbl_place sub on a.place_id=sub.place_id inner join tbl_district t on sub.district_id=t.district_id";


    if(did!="")
    {
        sel+=" and t.district_id='"+did+"'";
    }
    if(pid!="")
    {
        sel+=" and sub.place_id='"+pid+"'";
    }
    %>
    
    <form>
    <table>
        
       <tr>
            <%
    ResultSet res=con.selectCommand(sel);
    System.out.println(sel);
                int j=0;
                while(res.next())
                {
                    j++;
            %>
           <td>
               <p style="text-align:center;border:1px solid #999;margin:22px;padding:10px">
                   <img width="100" height="70" src="../Assets/Orgeventposter/<%=res.getString("orgevent_poster") %>"><br>
                   Event name:<%=res.getString("orgevent_name")%> <br>
                   Organization name:<%=res.getString("organization_name")%> <br>
                   Address:<%=res.getString("orgevent_address")%> <br>
                   Starting date:<%=res.getString("orgevent_startingdate")%> <br>
                   Ending date:<%=res.getString("orgevent_endingdate")%> <br>
                   Time:<%=res.getString("orgevent_time")%> <br>
                   Amount:<%=res.getString("eventpayment_amount")%> <br>
                   
                   <a href="Book.jsp">
                       <input type="button" value="Book Ticket" name=""></a>
                   <a href="EventGallery.jsp">
                       <input type="button" value="View gallery" name="">
                   </a>
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
        </form>
    </body>
</html>




