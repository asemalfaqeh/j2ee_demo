<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Seller</title>
</head>
<body>
	<meta http-equiv="Content-Type"
		content="text/html; charset=windows-1256">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<link href="assets/style.css" rel="stylesheet">
	<!-- Bootstrap -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">

	<jsp:include page="SessionFile.jsp"></jsp:include>

	<jsp:include page="header.jsp" />


	<c:set value="${sessionScope.Email }" var="sessionemail"></c:set>

	<sql:setDataSource dataSource="jdbc/servletdb" var="ds" />



	<c:choose>
		<c:when test="${empty param.id}">
			<sql:query var="result" dataSource="${ds}"
				sql="select id,name,age,region,phone,companyname from seller where EmailShoping = ?">
				<sql:param value="${sessionemail }" />
			</sql:query>
		</c:when>
		<c:otherwise>
			<sql:query dataSource="${ds}"
				sql="select * from seller where region = '${param.id }'"
				var="result" />


		</c:otherwise>
	</c:choose>

	<sql:query var="option" sql="select DISTINCT region from seller"
		dataSource="${ds}" />

	<div class="container">

		<h5>
			<c:out value="${sessionemail }"></c:out>
		</h5>
		<h3>Seller List</h3>


		<input type="search" class="light-table-filter"
			data-table="order-table" placeholder="Filter"> &nbsp; <select
			name="id" onchange="myFunction()" id="mySelect">
			   
			   <option value="" selected="selected" disabled="disabled">Select Region</option>
			    <option value="" >all</option>
			<c:forEach items="${option.rows }" var="opt">
				<option value='<c:out value="${opt.region }"></c:out>'>
					<c:out value="${opt.region }"></c:out>
				</option>
			</c:forEach>
		</select> <br />
		<br />
		<table class="table order-table table" id="myTable">
			<thead>
				<tr class="danger">
					<th>id Seller</th>
					<th>Name Seller</th>
					<th>Age</th>
					<th>Region</th>
					<th>Phone</th>
					<th>Company Name</th>
					<th>Delete Seller</th>
					<th>Update Seller</th>
				</tr>
			</thead>
			<c:forEach var="data" items="${result.rows }">
				<tr class="success" class="table">
					<td><c:out value="${data.id }" /></td>
					<td><c:out value="${data.name}" /></td>
					<td><c:out value="${data.age}" /></td>
					<td><c:out value="${data.region }" /></td>
					<td><c:out value="${data.phone}" /></td>
					<td><c:out value="${data.companyname}" /></td>
					<td><a
						href="http://localhost:8083/ShopManger/DeleteSeller.jsp?id=${data.id}&name=${data.name}">Delete
							Seller</a></td>
					<td><a
						href="<%=response.encodeUrl(request.getContextPath()) %>/UpdateSeller.jsp?id=${data.id}&name=${data.name}">Update
							Seller</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="row">
			<form
				action="<%=response.encodeURL(request.getContextPath() + "/Seller")%>"
				method="post">
				<div class="col-md-4 col-sm-4">
					<button class="btn btn-warning" type="submit" value="newseller"
						name="seller">Add new Seller</button>
				</div>
		</div>
		</form>
	</div>

	<script>
		(function(document) {
			'use strict';

			var LightTableFilter = (function(Arr) {

				var _input;

				function _onInputEvent(e) {
					_input = e.target;
					var tables = document.getElementsByClassName(_input
							.getAttribute('data-table'));
					Arr.forEach.call(tables, function(table) {
						Arr.forEach.call(table.tBodies, function(tbody) {
							Arr.forEach.call(tbody.rows, _filter);
						});
					});
				}

				function _filter(row) {
					var text = row.textContent.toLowerCase(), val = _input.value
							.toLowerCase();
					row.style.display = text.indexOf(val) === -1 ? 'none'
							: 'table-row';
				}

				return {
					init : function() {
						var inputs = document
								.getElementsByClassName('light-table-filter');
						Arr.forEach.call(inputs, function(input) {
							input.oninput = _onInputEvent;
						});
					}
				};
			})(Array.prototype);

			document.addEventListener('readystatechange', function() {
				if (document.readyState === 'complete') {
					LightTableFilter.init();
				}
			});

		})(document);
	</script>

	<script>
		function myFunction() {
			var x = document.getElementById("mySelect").value;
			window.location='Seller.jsp?id='+x;
		}
	</script>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>