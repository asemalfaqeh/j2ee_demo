<%@page import="Model.DataBaseSQL"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Account</title>

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<!-- include header file jsp -->
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="SessionFile.jsp"></jsp:include>

	<div class="container">
	<br/>
			<div style="margin:80;text-align:center">
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<a href="Seller.jsp"><img src="assets/seller.png"
							 width="240" height="240"> </a>
							<h4>Seller</h4>
					</div>
					<div class="col-sm-6 col-md-6" >
						<a href="payment.jsp"><img src="assets/payment.png"
						    width="240" height="240"> </a>
							<h4>Payment</h4>
					</div>
				</div><br/><br/>
					<div class="row">
					<div class="col-sm-6 col-md-6">
						<a href="Seller.jsp"><img src="assets/background.jpg"
							class="img-circle" width="200" height="200"> </a>
							<h4>ÚSetting</h4>
					</div>
					<div class="col-sm-6 col-md-6" >
						<a href="Seller.jsp"><img src="assets/background.jpg"
							class="img-circle" width="200" height="200"> </a>
							<h4>Seller</h4>
					</div>
				</div>
			</div>
	
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
