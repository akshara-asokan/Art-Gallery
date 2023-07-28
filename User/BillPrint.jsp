<%-- 
    Document   : Bill.jsp
    Created on : Mar 16, 2022, 6:34:45 PM
    Author     : SONY VAIO
--%>

<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    float total=0;
     Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             String from="",address="",ph="",email="";
             String sel="select * from tbl_customer where customer_id='"+session.getAttribute("userid")+"'";
             ResultSet rs=con.selectCommand(sel);
             if(rs.next()){
                 from=rs.getString("customer_name");
                 address=rs.getString("customer_address");
                 ph=rs.getString("customer_contact");
                 email=rs.getString("customer_email");
                 
             }
             
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Bill</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="https://me.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=eryZMrg1TWHTgREaNBT9M4a7RJUcFqVxCdhGlTB8rKACCriUd7AyXasTMJZD8t5vR1o-QzJ4e5H2WgVZwCtoq1qUZDs_C2RcoMfoEMNaugU" charset="UTF-8"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div id="pri">
    
<div class="container bootstrap snippets bootdeys">
<div class="row">
  <div class="col-sm-12">
	  	<div class="panel panel-default invoice" id="invoice">
		  <div class="panel-body">
			<div class="invoice-ribbon"><div class="ribbon-inner">PAID</div></div>
		    <div class="row">

				<div class="col-sm-6 top-left">
					<i class="fa fa-rocket"></i>
				</div>

				<div class="col-sm-6 top-right">
						<h3 class="marginright">INVOICE-<%=r_num%></h3>
						<span class="marginright"></span>
			    </div>

			</div>
			<hr>
			<div class="row">

				<div class="col-xs-4 from">
					<p class="lead marginbottom">From Trinity Art</p>
					<p>Phone: 04842850641</p>
					<p>Email: contact.trinityart@gmail.com</p>
				</div>

				<div class="col-xs-4 to">
                                    <p class="lead marginbottom">To :<%=from%></p>
					<p>Address: <%=address%></p>
					<p>Phone: <%=ph%></p>
					<p>Email: <%=email%> </p>
					

			    </div>

			    <div class="col-xs-4 text-right payment-details">
					<p class="lead marginbottom payment-info">Payment details</p>
					<p>Date:</p>
                                        <p>Account Name: <%=from%></p>
			    </div>

			</div>

			<div class="row table-row">
				<table class="table table-striped">
			      <thead>
			        <tr>
			          <th class="text-center" style="width:5%">#</th>
			          
                                   <th style="width:50%">Artwork Name</th>
			           <th style="width:50%">Booking Date</th>
			          <th class="text-right" style="width:15%">Total Price</th>
			        </tr>
			      </thead>

			      <tbody>
			        <tr>
			        	<%
                                        String soled="select * from tbl_artworkbooking ab inner join tbl_bid b on ab.bid_id=b.bid_id inner join tbl_artwork ar on ar.artwork_id=b.artwork_id where ab.artworkbooking_id='"+session.getAttribute("aid")+"'";
                                     // out.println(soled);
                                        ResultSet rssold=con.selectCommand(soled);
                                        int i=0;
                                        while(rssold.next()){
                                            i++;
                                        %>
			          
                                  <td class="text-right"><img src="../Assets/Artwork/<%=rssold.getString("artwork_photo")%>" width="150" height="150"></td>
			          <td class="text-right"><%=rssold.getString("artwork_name")%></td>
			          <td class="text-right"><%=rssold.getString("artworkbooking_date")%></td>
                                   <td class="text-right"><%=rssold.getString("bid_rate")%></td>
			          
			          
			        </tr>
			        <%
                       
			        
			    }
			        %>
			         

			       </tbody>
			    </table>

			</div>

			<div class="row">
			<div class="col-xs-6 margintop">
				<p class="lead marginbottom">THANK YOU!</p>

				
				
			<div class="col-xs-6 text-right pull-right invoice-total">
					 
                            <p>Total :</p>
			</div>
			</div>

		  </div>
		</div>
	</div>
</div>
</div>
</div></div>
                            

    
<style type="text/css">
body{margin-top:20px;
background:#eee;
}

/*Invoice*/
.invoice .top-left {
    font-size:65px;
	color:#3ba0ff;
}

.invoice .top-right {
	text-align:right;
	padding-right:20px;
}

.invoice .table-row {
	margin-left:-15px;
	margin-right:-15px;
	margin-top:25px;
}

.invoice .payment-info {
	font-weight:500;
}

.invoice .table-row .table>thead {
	border-top:1px solid #ddd;
}

.invoice .table-row .table>thead>tr>th {
	border-bottom:none;
}

.invoice .table>tbody>tr>td {
	padding:8px 20px;
}

.invoice .invoice-total {
	margin-right:-10px;
	font-size:16px;
}

.invoice .last-row {
	border-bottom:1px solid #ddd;
}

.invoice-ribbon {
	width:85px;
	height:88px;
	overflow:hidden;
	position:absolute;
	top:-1px;
	right:14px;
}

.ribbon-inner {
	text-align:center;
	-webkit-transform:rotate(45deg);
	-moz-transform:rotate(45deg);
	-ms-transform:rotate(45deg);
	-o-transform:rotate(45deg);
	position:relative;
	padding:7px 0;
	left:-5px;
	top:11px;
	width:120px;
	background-color:#66c591;
	font-size:15px;
	color:#fff;
}

.ribbon-inner:before,.ribbon-inner:after {
	content:"";
	position:absolute;
}

.ribbon-inner:before {
	left:0;
}

.ribbon-inner:after {
	right:0;
}

@media(max-width:575px) {
	.invoice .top-left,.invoice .top-right,.invoice .payment-details {
		text-align:center;
	}

	.invoice .from,.invoice .to,.invoice .payment-details {
		float:none;
		width:100%;
		text-align:center;
		margin-bottom:25px;
	}

	.invoice p.lead,.invoice .from p.lead,.invoice .to p.lead,.invoice .payment-details p.lead {
		font-size:22px;
	}

	.invoice .btn {
		margin-top:10px;
	}
}

@media print {
	.invoice {
		width:900px;
		height:800px;
	}
}
@media print{
    @page{
        margin:0;
    }
    body{margin:1.6cm;}
}
</style>

 <script type="text/javascript">
window.print();
window.onafterprint = function(event) {
    window.location.href = 'MyOrders.jsp'
};

</script>
</body>
</html>
