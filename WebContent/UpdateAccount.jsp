<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Update Account</title>
<link href="assets/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.fontstyle {
	font-family: consolas;
	font-size: 18px;
	color: white;
	font-style: bold;
}
</style>
</head>
<body class="bg">

	<jsp:include page="SessionFile.jsp"/>

	<!-- Validate Data Create account -->
	<c:set value="${sessionScope.Email }" var="email"></c:set>
	<sql:setDataSource dataSource="jdbc/servletdb" var="ds" />
	<sql:query var="result" dataSource="${ds }" 
		sql="select * from account where email = ?">
		<sql:param value="${email }" />
	</sql:query>
	<!-- Get Data from database -->
	<c:forEach var="data" items="${result.rows }">
		<c:set var="email" value="${data.Email }"></c:set>
		<c:set var="password" value="${data.password }" />
		<c:set var="shopingname" value="${data.shopingname }" />
		<c:set var="region" value="${data.region }" />
		<c:set var="country" value="${data.country }" />
		<c:set var="phone" value="${data.phone }" />
		<c:set var="id" value="${date.id }"></c:set>
	</c:forEach>
	
	<!-- Update Data -->
	

		<sql:update dataSource="${ds}" var="updatedata">
		update account set Email = ?,password = ?,shopingname = ?,
		region=?,country=?,phone=? WHERE Email='${param.email1}'
			<sql:param value="${param.email1 }"/>
			<sql:param value="${param.password }"/>
			<sql:param value="${param.shopingname }"/>
			<sql:param value="${param.region }"/>
			<sql:param value="${param.country }"/>
			<sql:param value="${param.phone }"/>
		</sql:update>


	<div class="container" style="padding: 28px">

		<form style="padding: 30px; width: 400px"
			action="UpdateAccount.jsp"
			method="post">
			<div class="form-group">

				<input type="hidden" name="action" value="insert" /> <input
					type="email" class="form-control" id="Email1" placeholder="Email"
					name="email1" value="<c:out value="${email}"></c:out>" /> <input
					type="password" class="form-control" id="psw"
					placeholder="Password" name="password"
					value="<c:out value="${password}"></c:out>" /> <input type="text"
					class="form-control" id="yourname" placeholder="Your Shoping Name"
					name="shopingname" value="<c:out value="${shopingname}"></c:out>" />
				<input type="text" class="form-control" id="phone"
					placeholder="Phone" name="phone"
					value="<c:out value="${phone}"></c:out>" /> <input type="text"
					class="form-control" id="country" placeholder="Your Country"
					name="country" value="<c:out value="${country}"></c:out>" /> <input
					type="text" class="form-control" id="region"
					placeholder="Your Region" name="region" 
					value="<c:out value="${region}"></c:out>" /> <br>
				<br>
				<button class="btn btn-success btn-sm" type="submit"
					style="width: 140px; height: 40px">Update</button>
				<a href="MyAccount.jsp">
					<button class="btn btn-primary" type="button"
						style="width: 140px; height: 40px">Back</button>
				</a>
			</div>
		</form>
        
		<c:if test="${updatedata>=1}">
		 <font size="5" color='white'> Congratulations ! Data updated
            successfully.</font>
		</c:if>
		<c:if test="${updatedata<=1 }">
		 <font size="5" color='white'> Enter New Data For Update Account</font>
		</c:if>
	
		
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>