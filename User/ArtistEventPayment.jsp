<%-- 
    Document   : ArtistEventPayment
    Created on : Mar 17, 2022, 12:15:19 PM
    Author     : SONY VAIO
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body{
      background-color: #f5f5f5;
      font-family: Arial, Helvetica, sans-serif;
    }
    .wrapper{
      background-color: #fff;
      width: 500px;
      padding: 25px;
      margin: 25px auto 0;
      box-shadow: 0px 0px 20px rgba(0,0,0,0.5);
    }
    .wrapper h2{
      background-color: #fcfcfc;
      color: #7ed321;
      font-size: 24px;
      padding: 10px;
      margin-bottom: 20px;
      text-align: center;
      border: 1px dotted #333;
    }
    h4{
      padding-bottom: 5px;
      color: #7ed321;
    }
    .input-group{
      margin-bottom: 8px;
      width: 100%;
      position: relative;
      display: flex;
      flex-direction: row;
      padding: 5px 0;
    }
    .input-box{
      width: 100%;
      margin-right: 12px;
      position: relative; 
    }
    .input-box:last-child{
      margin-right: 0;
    }
    .name{
      padding: 14px 10px 14px 50px;
      width: 100%;
      background-color: #fcfcfc;
      border: 1px solid #00000033;
      outline: none;
      letter-spacing: 1px;
      transition: 0.3s;
      border-radius: 3px;
      color: #333;
    }
    .name:focus, .dob:focus{
      -webkit-box-shadow:0 0 2px 1px #7ed32180;
      -moz-box-shadow:0 0 2px 1px #7ed32180;
      box-shadow: 0 0 2px 1px #7ed32180;
      border: 1px solid #7ed321;
    }
    .input-box .icon{
      width: 48px;
      display: flex;
      justify-content: center;
      position: absolute;
      padding: 15px;
      top: 0px;
      left: 0px;
      bottom: 0px;
      color: #333;
      background-color: #f1f1f1;  
      border-radius: 2px 0 0 2px;
      transition: 0.3s;
      font-size: 20px;
      pointer-events: none;
      border: 1px solid #000000033;
      border-right: none;
    }
    
    
    .name:focus + .icon{
      background-color: #7ed321;
      color: #fff;
      border-right: 1px solid #7ed321;
      border-right: none;
      transition: 1s;
    }
    .radio:checked + label {
      background-color: #7ed321;
      color: #fcfcfc  ;
      border-right: 1px solid #7ed321;
      border-right: none;
      transition: 1s;
    }
    .dob{
      width: 30%;
      padding: 14px;
      text-align: center;
      background-color: #fcfcfc;
      transition: 0.3s;
      outline: none;
      border: 1px solid #c0bfbf;
      border-radius: 3px;
    }
    .radio{
      display: none;
    }
    .input-box label{
      width: 50%;
      padding: 13px;
      background-color: #fcfcfc;
      display: inline-block;
      float: left;
      text-align: center;
      border: 1px solid #c0bfbf; 
    }
    .input-box label:first-of-type{
      border-top-left-radius: 3px;
      border-bottom-left-radius: 3px;
      border-right: none;
    }
    .input-box label:last-of-type{
      border-top-left-radius: 3px;
      border-bottom-left-radius: 3px;
    }
    
    .radio:checked{
      background-color:green;
      color: #fff;
    }
    
    input[type=submit]{
      width: 100%;
      background: transparent;
      border: none;
      background: #7ed321;
      color: #fff;
      padding: 15px;
      border-radius: 4px;
      font-size: 16px;
      transition: all 0.35s ease;
    }
    input[type=submit]:hover{
      cursor: pointer;
      background: #5eb105;
    }
</style>
  <meta charset="UTF-8">
        <%@page import="java.sql.ResultSet" %>
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
  <title>Oxycare Payement Gateway</title>
</head>
<body>
<%

%> 
   
  <div class="wrapper">
    <h2>Payment Gateway</h2>
    <form method="POST">
      <h4>Account</h4>
      <div class="input-group">
        <div class="input-box">
          <input class="name" type="text" name="txtname" id="txtname" placeholder="First Name" required="required">
          <i class="fa fa-user icon" aria-hidden="true"></i>
        </div>
        <div class="input-box">
          <input class="name" type="text" name="txtnname" id="txtnname" placeholder="Last Name" required="required">
          <i class="fa fa-user icon" aria-hidden="true"></i>
        </div>
      </div>
      <div class="input-group">
        <div class="input-box">
          <input class="name" type="email" name="txtemail" id="txtemail" placeholder="Email Address" required="required">
          <i class="fa fa-envelope icon" aria-hidden="true"></i>
        </div>
      </div>  
      <div class="input-group">
        <div class="input-box">
          <h4>Date of Birth</h4>
          <input class="dob" type="text" data-mask="00" name="txtdate" id="txtdate" placeholder="DD">
          <input class="dob" type="text" data-mask="00" name="txtmonth" id="txtmonth" placeholder="MM">
          <input class="dob" type="text" data-mask="0000" name="txtyear" id="txtyear" placeholder="YYYY">
        </div>
        <div class="input-box">
          <h4>Gender</h4>
          <input type="radio" name="rdbgender" id="male" checked  class="radio">
          <label for="male">Male</label>
          <input type="radio" name="rdbgender" id="female" class="radio">
          <label for="female">Female</label>
        </div>
      </div>
      <div class="input-group">
        <div class="input-box">
          <h4>Payment Details</h4>
          <input type="radio" name="rdbpay" id="cc" checked class="radio">
          <label for="cc">
            <span><i class="fa fa-cc-visa" aria-hidden="true"></i>Credit Card</span>
          </label>
          <input type="radio" name="rdbpay" id="dc" class="radio">
          <label for="dc">
            <span><i class="fa fa-cc-visa" aria-hidden="true"></i>Debit Card</span>
          </label>
        </div>
      </div>
      <div class="input-group">
        <div class="input-box">
          <input class="name" type="tel" id="txtcardno" name="txtcardno" required="required" data-mask="0000 0000 0000 0000" placeholder="Card Number">
          <i class="fa fa-credit-card icon" aria-hidden="true"></i>
        </div>
      </div>
      <div class="input-group">
        <div class="input-box">
          <input class="name" type="text" name="txtcvc" id="txtcvc" data-mask="000" placeholder="CVC" required="required">
          <i class="fa fa-user icon" aria-hidden="true"></i>
        </div>
        <div class="input-box">
          <input class="name" type="text" name="txtdate" id="txtdate" data-mask="00 / 00" placeholder="EXP DATE" required="required">
          <i class="fa fa-calendar icon" aria-hidden="true"></i>
        </div>
      </div>
     
      <div class="input-group">
        <div class="input-box">
            <input type="submit" name="btnpay"  value="PAY NOW">
        </div>
      </div>
    </form>
  </div>
</body>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js'></script>
</html>
<%
    if (request.getParameter("btnpay") != null) 
    {    
        
       String sel="select * from tbl_artistticketbooking atb inner join tbl_artistevent ae on atb.artistevent_id=ae.artistevent_id  inner join tbl_customer c on c.customer_id=atb.customer_id where atb.customer_id='"+session.getAttribute("userid")+"'";
       ResultSet rs=con.selectCommand(sel);
       while(rs.next())
       {
       String event=rs.getString("artistevent_name");
       String name=rs.getString("customer_name");
       String mail[]={rs.getString("customer_email")};
       
        DB.mailconnection m = new DB.mailconnection();
        String subject = "Ticket Booking";
        String text = "Dear " + name + "  \r\n \r\n"
                                + " This is from Trinity Art. \r\n\r\n"
                                + " Your payment for the event "+ event +" is completed. \r\n Check it out... \r\n\r\n"
                                + " We established Trinity Art in order to buy artworks and to book tickets for events. \r\n"
                                + " If you have any questions,and if there is anything we can improve please reply to this email. \r\n"
                                + " we were always happy to help!. \r\n \r\n"
                                + " Trinity Art.";
                        boolean b = m.sendMail(mail, subject, text);
                        System.out.println(b);
                        
             }
        //mail
        //redirect
       // response.sendRedirect("Loader.jsp");
        response.sendRedirect("ViewArtistEvent.jsp");
    }
%>
