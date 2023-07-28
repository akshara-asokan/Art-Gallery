<%-- 
    Document   : Ajaxamount
    Created on : Apr 22, 2022, 9:49:40 PM
    Author     : JD
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sel="select * from tbl_ticketrates where orgevent_id='"+session.getAttribute("eid") +"' and tickettype_id='"+request.getParameter("did") +"'";
    ResultSet rs=con.selectCommand(sel);
    rs.next();
    out.println(rs.getString("trate_value"));
%>
