<%-- 
    Document   : ArtistVerification
    Created on : 27 Jan, 2022, 7:34:57 PM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>artist verification</title>
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
                                + " We established Trinity Art in order to set a platform for sell your artworks. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email."
                                + " we were always happy to help!. \r\n"
                                + " Best Regards, \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                    if(b){
                    String up="update tbl_artist set artist_vstatus='1' where artist_id='"+request.getParameter("aid")+"'";
                    con.executeCommand(up);
                    }
                    response.sendRedirect("ArtistVerification.jsp");
            
                    
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
                                + " We established Trinity Art in order to set a platform for sell your artworks. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mailid, subject, text);
                        System.out.println(b);
                     if(b){
                    String up="update tbl_artist set artist_vstatus='2' where artist_id='"+request.getParameter("rid")+"'";
                    con.executeCommand(up);
                    }
                    response.sendRedirect("ArtistVerification.jsp");
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
                   <td>District</td>
                   <td>Place</td>
                   <td>Artwork type</td>
                   <td>Subtype</td>
                   <td>Experience</td>
                   <td>Photo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                   <td>Action</td>
               </tr>
               <%String sel="select * from tbl_artist a inner join tbl_place p on p.place_id=a.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_artworksubtype arsub on arsub.artwork_subtypeid=a.artwork_subtypeid inner join tbl_artworktype ar on ar.artwork_id=arsub.artwork_id where a.artist_vstatus='0' order by a.artist_doj desc";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next())
                {
                    i++;
            %>
           
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("artist_name")%></td>
                <td><%=rs.getString("artist_contact")%></td>
                <td><%=rs.getString("artist_email")%></td>
                <td><%=rs.getString("artist_address")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
                 <td><%=rs.getString("artwork_type")%></td>
                <td><%=rs.getString("artwork_subtypename")%></td>
                <td><%=rs.getString("artist_exp")%></td>
                <td><img width="100" height="70" src="../Assets/Artist/<%=rs.getString("artist_photo") %>"></td>
                <td><a href="../Assets/Proof/<%=rs.getString("artist_proof") %>"><img width="100" height="70" src="../Assets/Proof/<%=rs.getString("artist_proof") %>"></a></td>
                <td><%=rs.getString("artist_doj")%></td>
                <td><a href="ArtistVerification.jsp?aid=<%=rs.getString("artist_id")%>&eid=<%=rs.getString("artist_email")%>&name=<%=rs.getString("artist_name")%>">Accept</a>/<a href="ArtistVerification.jsp?rid=<%=rs.getString("artist_id")%>&eid=<%=rs.getString("artist_email")%>&name=<%=rs.getString("artist_name")%>">Reject</a></td>
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
                   <td>District</td>
                   <td>Place</td>
                   <td>Artwork type</td>
                   <td>Subtype</td>
                   <td>Experience</td>
                   <td>Photo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                   <td>Action</td>
                   
                   
               </tr>
               <%                
                String sel1="select * from tbl_artist a inner join tbl_place p on p.place_id=a.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_artworksubtype arsub on arsub.artwork_subtypeid=a.artwork_subtypeid inner join tbl_artworktype ar on ar.artwork_id=arsub.artwork_id where a.artist_vstatus='1' order by a.artist_doj desc";
                ResultSet rs1=con.selectCommand(sel1);
                int j=0;
                while(rs1.next())
                {
                    j++;
            %>
           
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("artist_name")%></td>
                <td><%=rs1.getString("artist_contact")%></td>
                <td><%=rs1.getString("artist_email")%></td>
                <td><%=rs1.getString("artist_address")%></td>
               <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                 <td><%=rs1.getString("artwork_type")%></td>
                <td><%=rs1.getString("artwork_subtypename")%></td>
                <td><%=rs1.getString("artist_exp")%></td>
                 <td><img width="100" height="70" src="../Assets/Artist/<%=rs1.getString("artist_photo") %>"></td>
                <td><a href="../Assets/Proof/<%=rs1.getString("artist_proof") %>"><img width="100" height="70" src="../Assets/Proof/<%=rs1.getString("artist_proof") %>"></a></td>
                <td><%=rs1.getString("artist_doj")%></td>
                
                <td> <a href="ArtistVerification.jsp?rid=<%=rs1.getString("artist_id")%>&eid=<%=rs1.getString("artist_email")%>&name=<%=rs1.getString("artist_name")%>">Reject</a></td>
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
                   <td>District</td>
                   <td>Place</td>
                   <td>Artwork type</td>
                   <td>Subtype</td>
                   <td>Experience</td>
                   <td>Photo</td>
                   <td>Proof</td>
                   <td>DOJ</td>
                  
                   <td>Action</td>
               </tr>
               <%                
                String sel2="select * from tbl_artist a inner join tbl_place p on p.place_id=a.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_artworksubtype arsub on arsub.artwork_subtypeid=a.artwork_subtypeid inner join tbl_artworktype ar on ar.artwork_id=arsub.artwork_id where a.artist_vstatus='2' order by a.artist_doj desc";
                ResultSet rs2=con.selectCommand(sel2);
                int k=0;
                while(rs2.next())
                {
                    k++;
            %>
           
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("artist_name")%></td>
                <td><%=rs2.getString("artist_contact")%></td>
                <td><%=rs2.getString("artist_email")%></td>
                <td><%=rs2.getString("artist_address")%></td>
                <td><%=rs2.getString("district_name")%></td>
                <td><%=rs2.getString("place_name")%></td>
                 <td><%=rs2.getString("artwork_type")%></td>
                <td><%=rs2.getString("artwork_subtypename")%></td>
                <td><%=rs2.getString("artist_exp")%></td>
                 <td><img width="100" height="70" src="../Assets/Artist/<%=rs2.getString("artist_photo") %>"></td>
                 <td><a href="../Assets/Proof/<%=rs2.getString("artist_proof") %>"><img width="100" height="70" src="../Assets/Proof/<%=rs2.getString("artist_proof") %>"></a></td>
                <td><%=rs2.getString("artist_doj")%></td>
                
                <td> <a href="ArtistVerification.jsp?aid=<%=rs2.getString("artist_id")%>&eid=<%=rs2.getString("artist_email")%>&name=<%=rs2.getString("artist_name")%>">Accept</a></td>
            </tr>  
            <%
            }
            %>
        </table>
            
    </body>
</html>
