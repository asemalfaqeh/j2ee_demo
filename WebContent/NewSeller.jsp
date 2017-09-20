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
<title>Add new Seller</title>

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/style.css" rel="stylesheet">

</head>
<body class="bgcolor">

	<jsp:include page="header.jsp" />
	<c:set var="emailsession" value="${sessionScope.Email }" />
	<jsp:include page="SessionFile.jsp" />

	<sql:setDataSource dataSource="jdbc/servletdb" var="ds" />
	<c:set value="asemalfqeh" var="name" />

	<c:if test="${pageContext.request.method=='POST'}">
		<c:catch var="exception">
			<sql:update dataSource="${ds}" var="updatedTable">
    INSERT INTO seller (name,age,region,phone,companyname,EmailShoping) VALUES (?, ?, ?, ?, ?, ?)
                <sql:param value="${param.nameseller}" />
				<sql:param value="${param.age}" />
				<sql:param value="${param.region}" />
				<sql:param value="${param.phone}" />
				<sql:param value="${param.companyname }" />
				<sql:param value="${emailsession}" />
			</sql:update>

		</c:catch>

	</c:if>




	<div class="container">


		<form style="padding: 30px; width: 400px" action="NewSeller.jsp"
			method="POST">
			<div class="form-group" style="float: left;">

				<input type="text" class="form-control" placeholder="Seller Name"
					name="nameseller" required="required" /> <input type="text"
					class="form-control" placeholder="Seller Age" name="age"
					required="required" /> <input type="text" class="form-control"
					placeholder="Region" name="region" required="required" /> <input
					type="text" class="form-control" placeholder="Phone" name="phone"
					required="required" /> <input type="text" class="form-control"
					placeholder="Company name" name="companyname" required="required" />
				<br> <br>
				<button class="btn btn-success btn-sm" type="submit"
					style="width: 140px; height: 40px">Submit</button>
				<a href="Home.jsp">
					<button class="btn btn-primary" type="button"
						style="width: 140px; height: 40px">Back</button>
				</a>
			</div>

		</form>

		<div style="float: right;">
			<h1 style="color: white; font-style: blod; font-size: 32px">Add
				New Seller</h1>
		</div>

	</div>

	</div>

	<c:if test="${updatedTable>=1 }">
		<div
			style="margin-left: 100px; text-align: center; width: 300px; font-size: 18px; font-family: consolas;">
			<c:out value="Added Succefully!" />
		</div>
	</c:if>
	
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>