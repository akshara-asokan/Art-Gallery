<%-- 
    Document   : Ajaxsubtype
    Created on : 4 Feb, 2022, 3:25:44 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="">---select---</option>
<%
    String sel="select * from tbl_artworksubtype where artwork_id='"+request.getParameter("sid")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("artwork_subtypeid")%>"><%=rs.getString("artwork_subtypename")%></option>
        
        <%
    }
%>

