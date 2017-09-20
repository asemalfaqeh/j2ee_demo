<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>My Account</title>
<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.font_style {
	font-size: 18px;
	font-family: sans-serif consolas;
	border: 2px solid black;
	border-radius: 6px;
	padding: 20px;
	margin: 8px;
	font-style: bold;
	margin-top: 20px;
	box-shadow: navy;
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Code Here -->
	<jsp:include page="SessionFile.jsp"></jsp:include>
	<sql:setDataSource var="ds" dataSource="jdbc/servletdb" />
	<c:set value="${sessionScope.Email }" var="email"></c:set>
	<sql:query var="result" dataSource="${ds}"
		sql="SELECT * FROM account where email = ?">
		<sql:param value="${email}" />
	</sql:query>

	<c:forEach var="data" items="${result.rows }">
		<br>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-8 font_style">
					Email:
					<c:out value="${data.Email }" />
					<br /> Password:
					<c:out value="${data.password }" />
					<br /> Shoping Name:
					<c:out value="${data.shopingname }" />
					<br /> Region:
					<c:out value="${data.region }" />
					<br /> Country:
					<c:out value="${data.country }" />
					<br /> Phone:
					<c:out value="${data.phone}"></c:out>
				</div>
			</div>
			<br>
			<a href="UpdateAccount.jsp"><button type="button" class="btn btn-primary">Update Profile</button></a>
			<a href="DeleteAccount.jsp"><button type="button" class="btn btn-success">Delete Profile</button></a>
		</div>

	</c:forEach>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>