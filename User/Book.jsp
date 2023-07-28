<%--
    Document   : Book
    Created on : 18 Feb, 2022, 10:26:54 AM
    Author     : asus
--%>

<%@page import="java.util.*" %>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%//@include file="SessionValidator.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>book</title>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function Disable(did){
                if(did=="2"){
                    document.getElementById("hide").removeAttribute("hidden");
                }
                else{
                    document.getElementById("hide").setAttribute("hidden","hidden")
                }
               
            }
            function getTotal(){
                var amount=document.getElementById("amount").value;
                var qty=document.getElementById("txtnum").value;
                var res=amount*qty;
                document.getElementById("totalamount").value=res;
            }
        </script>
        <script>
        function getPrice(did)
{
	//alert(did);
	$.ajax({
	url: "../Assets/Ajaxpages/Ajaxamount.jsp?did="+did,
	  success: function(html){
//		$("#amount").html(html);
                //alert(html);
                document.getElementById("amount").value=html;
                getTotal();
	  }
	});
}
</script>
    </head>
    <body>
      <%
          if(request.getParameter("aid")!=null){
              session.setAttribute("aid", request.getParameter("aid"));
          }
          if(request.getParameter("btn")!=null){
               Random r=new Random();
             int r_num=r.nextInt(1111)+999;
              if(request.getParameter("selt").equals("2")){
                  
                  String ins="insert into tbl_ticketbooking(user_id,tickettype_id,ticket_count,booking_date,booked_date,ticket_number,ticket_total,artistevent_id)vaues('"+session.getAttribute("userid")+"',2,'"+request.getParameter("txtnum")+"','"+request.getParameter("txt")+"',curdate(),'"+r_num+"','"+request.getParameter("txttotal")+"','"+session.getAttribute("aid")+"')";
                  con.executeCommand(ins);
                  response.sendRedirect("TicketPay.jsp");
              }
              else{
                   String ins="insert into tbl_ticketbooking(user_id,tickettype_id,ticket_count,booked_date,ticket_number,ticket_total,artistevent_id)vaues('"+session.getAttribute("userid")+"',1,'"+request.getParameter("txtnum")+"','"+request.getParameter("txt")+"',curdate(),'"+r_num+"','"+request.getParameter("txttotal")+"','"+session.getAttribute("aid")+"')";
                  con.executeCommand(ins);
                  response.sendRedirect("TicketPay.jsp");
              }
          }
      %>
  <form name="frmeventbooking">
            <table align="center">
                 <tr>
                    <td>Ticket Type</td>
                    <td>
                        <select name="selt" onchange="Disable(this.value),getPrice(this.value)">
                            <option value="" selected>--Select--</option>
                             <%
                                String sel="select * from tbl_tickettype";
                                ResultSet rs=con.selectCommand(sel);
                               
                                while(rs.next())
                                {
                                    
                            %>
                            <option value="<%=rs.getString("tickettype_id")%>"><%=rs.getString("tickettype_name")%></option>
                               
                            <%}%>      
                        </select>    
                    </td>
                </tr>    
                <tr  hidden="" id="hide">
                    <td>Prefred Date </td><td><input type="date" min="<%=request.getParameter("sdate")%>" max="<%=request.getParameter("edate")%>" name="txt"></td>
                </tr>
                <tr>
                    <td>No Of Seats</td>
                    <td><input type="number" name="txtnum"  id="txtnum" min="1" value="1" onchange="getTotal()"></td>
                </tr>
                <tr>
                    <td>Amount Per Person</td>
                    <td><input type="text" readonly="" id="amount" name="amount"></td>
                </tr>
                <tr>
                    <td>Total Amount</td>
                    <td><input type="text" readonly="" id="totalamount" name="totalamount"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btn" value="Proceed To Payment"></td>
                </tr></table>
    </body>
</html>