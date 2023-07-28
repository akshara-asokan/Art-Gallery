<%-- 
    Document   : OrganizationVerification
    Created on : 28 Jan, 2022, 12:27:38 AM
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
        <title>organization verification</title>
    </head>
    <body>
        <%
            
            if(request.getParameter("aid")!=null)
            {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {request.getParameter("eid")};
                    String name = request.getParameter("name");
                    String subject = "Verification Successfull ";
                        String text = "Dear " + name + ",  \r\n \r\n"
                                + " This is from Trinity Art ,thank you for signing up to our service. \r\n"
                                + " We established Trinity Art in order to conduct events. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email."
                                + " we were always happy to help!. \r\n"
                                + " Best Regards, \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                    if(b){
                    String up="update tbl_organization set organization_vstatus='1' where organization_id='"+request.getParameter("aid")+"'";
                    con.executeCommand(up);
                    }
                    response.sendRedirect("OrganizationVerification.jsp");    
            }
       
            
            if(request.getParameter("rid")!=null)
            {
                    DB.mailconnection m = new DB.mailconnection();
                    String mailid[] = {request.getParameter("eid")};
                    String name = request.getParameter("name");
                    String subject = "Verification Unsuccessfull ";
                    String text = "Dear " + name + "  \r\n \r\n"
                                + " This is from Trinity Art ,thank you for signing up to our service. \r\n"
                                + " Sorry to inform that you failed in the verification process. \r\n\r\n"
                                + " We established Trinity Art in order to conduct events. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     if(b){
                     String up="update tbl_organization set organization_vstatus='2' where organization_id='"+request.getParameter("rid")+"'";
                    con.executeCommand(up);
                    }
                    response.sendRedirect("OrganizationVerification.jsp");
                    
            }
        %>
        <h3 align="center">Verifications</h3>
        <table align="center" border="1">
               <tr>
                   <td>Sl.no</td>
                   <td>Name</td>
                   <td>contact</td>
                   <td>Email</td>
                   <td>Address</td>
                   <td>Since</td>
                   <td>District</td>
                   <td>Place</td>
                   <td>Logo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                   <td>Action</td>
               </tr>
               <%                
            String sel="select * from tbl_organization o inner join tbl_place p on o.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where organization_vstatus='0'";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
           
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("organization_name")%></td>
                <td><%=rs.getString("organization_contact")%></td>
                <td><%=rs.getString("organization_email")%></td>
                <td><%=rs.getString("organization_address")%></td>
                 <td><%=rs.getString("organization_since")%></td>
                 <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
               <td><img width="100" height="70" src="../Assets/Organization/<%=rs.getString("organization_logo") %>"></td>
                 <td><a href="../Assets/Org_Proof/<%=rs.getString("organization_proof") %>"><img width="100" height="70" src="../Assets/Org_Proof/<%=rs.getString("organization_proof") %>"></a></td>
                <td><%=rs.getString("organization_doj")%></td>
                <td><a href="OrganizationVerification.jsp?aid=<%=rs.getString("organization_id")%>&eid=<%=rs.getString("organization_email")%>&name=<%=rs.getString("organization_name")%>">Accept</a>/<a href="OrganizationVerification.jsp?rid=<%=rs.getString("organization_id")%>&eid=<%=rs.getString("organization_email")%>&name=<%=rs.getString("organization_name")%>">Reject</a></td>
            </tr>  
            <%
            }
            %>
        </table>
        
            <h3 align="center">Acceped List</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                   <td>Name</td>
                   <td>contact</td>
                   <td>Email</td>
                   <td>Address</td>
                   <td>Since</td>
                   <td>Place</td>
                   <td>Logo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                   
                   <td>Action</td>
               </tr>
               <%                
                String sel1="select * from tbl_organization o inner join tbl_place p on o.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where organization_vstatus='1'";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("organization_name")%></td>
                <td><%=rs1.getString("organization_contact")%></td>
                <td><%=rs1.getString("organization_email")%></td>
                <td><%=rs1.getString("organization_address")%></td>
                <td><%=rs1.getString("organization_since")%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><img width="100" height="70" src="../Assets/Organization/<%=rs1.getString("organization_logo") %>"></td>
                 <td><a href="../Assets/Org_Proof/<%=rs1.getString("organization_proof") %>"><img width="100" height="70" src="../Assets/Org_Proof/<%=rs1.getString("organization_proof") %>"></a></td>
                <td><%=rs1.getString("organization_doj")%></td>
                
                <td> <a href="OrganizationVerification.jsp?rid=<%=rs1.getString("organization_id")%>&eid=<%=rs1.getString("organization_email")%>&name=<%=rs1.getString("organization_name")%>">Reject</a></td>
            </tr>  
            <%
            }
            %>
        </table>
        <h3 align="center">Rejected List</h3>
             <table align="center" border="1">
               <tr>
                    <td>Sl.no</td>
                   <td>Name</td>
                   <td>contact</td>
                   <td>Email</td>
                   <td>Address</td>
                   <td>Since</td>
                   <td>Place</td>
                   <td>Logo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                   
                   <td>Action</td>
               </tr>
               <%                
                String sel2="select * from tbl_organization o inner join tbl_place p on o.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where organization_vstatus='2'";
                ResultSet rs2=con.selectCommand(sel2);
                int k=0;
                while(rs2.next())
                {
                    k++;
            %>
           
            <tr>
                <td><%=k%></td>
                <td><%=j%></td>
                <td><%=rs2.getString("organization_name")%></td>
                <td><%=rs2.getString("organization_contact")%></td>
                <td><%=rs2.getString("organization_email")%></td>
                <td><%=rs2.getString("organization_address")%></td>
                <td><%=rs2.getString("organization_since")%></td>
               <td><%=rs2.getString("district_name")%></td>
                <td><%=rs2.getString("place_name")%></td>
               <td><img width="100" height="70" src="../Assets/Organization/<%=rs2.getString("organization_logo") %>"></td>
                <td><a href="../Assets/Org_Proof/<%=rs2.getString("organization_proof") %>"><img width="100" height="70" src="../Assets/Org_Proof/<%=rs2.getString("organization_proof") %>"></a></td>
                <td><%=rs2.getString("organization_doj")%></td>
                
                <td> <a href="OrganizationVerification.jsp?aid=<%=rs2.getString("organization_id")%>&eid=<%=rs2.getString("organization_email")%>&name=<%=rs2.getString("organization_name")%>">Accept</a></td>
            </tr>  
            <%
            }
            %>
        </table>
           </body>
</html>

