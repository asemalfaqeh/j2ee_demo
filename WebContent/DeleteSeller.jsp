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
<title>Delete Seller</title>

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/style.css" rel="stylesheet">
<style type="text/css">
h4 {
	margin-top: 80px;
	text-align: center;
	font-family: bold;
	font-size: 32px;
}
</style>

</head>
<body class="bgcolor">

	<jsp:include page="header.jsp" />
    <jsp:include page="SessionFile.jsp"/>
	<sql:setDataSource dataSource="jdbc/servletdb" var="ds" />

	<c:set value="${sessionScope.Email }" var="emailsession" />

	<!-- Bootstrap Code here -->

	<div class="container">

		<div class="row">

			<div class="col-md-8 col-sm-8">

				<form action="DeleteSeller.jsp" method="post"
					style="padding: 24px; width: 400px">

					<div class="form-group">

						<h5>Delete User</h5>
                   
						<%
							String id = request.getParameter("id");
							String name = request.getParameter("name");
						%>
						<input type="text" class="form-control" placeholder="Id Seller"
							required="required" name="id" value='<%=id%>' /> <input
							type="text" class="form-control" placeholder="Name Seller"
							name="name" required="required" value='<%=name%>' />
						<button class="btn btn-danger" type="submit" name="seller">Delete
							Seller</button>
						<a href="Seller.jsp">
							<button class="btn btn-warning" type="button">Back</button>
						</a> <br /> <br /> <br />
					</div>
				</form>
			</div>
			
			<div class="col-md-4 col-sm-4">
				<h1>Shoping Manger</h1>
			</div>
		</div>
	</div>
		
	<c:if test="${pageContext.request.method=='POST'}">
		<c:catch var="exception">

			<sql:update dataSource="${ds}" var="deleteseller">
    delete from seller where id=? and EmailShoping = ? and name=?
    <sql:param value="${param.id}" />
				<sql:param value="${emailsession}" />
				<sql:param value=""/>
			</sql:update>
		</c:catch>
	</c:if>
    <c:if test="${deleteseller>=1 }">
    <div style="margin-left: 100px;text-align: center;width: 300px;font-size: 18px;font-family: consolas;">
   <c:out value="Delete Succefully!"/></div>
    </c:if>
	<c:if test="${exception!=null }">
	<div style="margin-left: 100px;text-align: center;width: 300px;font-size: 18px;font-family: consolas;">
     <c:out value="Erro Delete try again"/></div>
	</c:if>
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>