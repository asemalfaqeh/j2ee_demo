<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Payment</title>
</head>
<body>
    <link href="assets/style.css" rel="stylesheet">
	<!-- Bootstrap -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<jsp:include page="header.jsp"/>
<jsp:useBean id="req" class="Controller.Payment" scope="request"/> 
 <sql:setDataSource dataSource="servletdb/jdbc" var="ds" />

<div class="container" style="padding: 28px">
    <form style="padding:30px;width: 400px"  action="<%= response.encodeURL(request.getContextPath() + "/Payment.do") %>" method="post">
  <div class="form-group">
  
     <input type="hidden" name="payment" value="payment"/>
     <input type="date" class="form-control" placeholder="Date" name="date"  />
     <input type="text" class="form-control"  placeholder="Amount" name="amount" />
     <input type="text" class="form-control"  placeholder="Product" name="product" />
     <input type="text" class="form-control"  placeholder="Pay" name="pay"/>  
     <input type="text" class="form-control"  placeholder="Quantity" name="quantity" />  
     <input type="text" class="form-control"  placeholder="Name Seller" name="nameseller"/> 
      
     <br><br>
      <button class="btn btn-success btn-sm" type="submit" style="width: 140px;height: 40px">
      Submit     </button>
      <a href="Login">
      <button class="btn btn-primary" type="button" style="width: 140px;height: 40px">
       Back    </button></a>
  </div>
</form>
<font class="fontstyle"><%=request.getAttribute("msg") %></font>
  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.min.js"></script>

</body>
</html>