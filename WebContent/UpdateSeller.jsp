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
<title>Update Seller</title>

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
   
	<sql:setDataSource dataSource="jdbc/servletdb" var="ds" />
    
	<c:set value="${sessionScope.Email }" var="emailsession" />
	<jsp:include page="SessionFile.jsp"/>
	
	
	<sql:query var="result" dataSource="${ds }">
	select name,age,region,phone,companyname from seller where id = ? and name = ?
	<sql:param value="${param.id }" />
	<sql:param value="${param.name }"/>
	</sql:query>
	
	<c:forEach items="${result.rows }" var="data">
	<c:set value="${data.name }" var="namec"/>
	<c:set value="${data.age }" var="agec"/>
	<c:set value="${data.region }" var="regionc"/>
	<c:set value="${data.phone }" var="phonec"/>
	<c:set value="${data.companyname }" var="companynamec"/>
	</c:forEach>

	<!-- Bootstrap Code here -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-8">
       <c:set value="${param.id }" var="idset"/>
				<form action="UpdateSeller.jsp?id=${idset }" method="POST"
					style="padding: 24px; width: 400px">

					<div class="form-group">
	
		
						<h5>Update Seller</h5>
                
				            <input
							type="text" class="form-control" placeholder="Name Seller"
							name="name" required="required" value='<c:out value="${namec }"></c:out>' />
							<input type="text" class="form-control" placeholder="age"
							required="required" name="age"   value='<c:out value="${agec }"></c:out>'/>
							<input type="text" class="form-control" placeholder="Region"
							required="required" name="region"  value='<c:out value="${regionc }"></c:out>' />
							<input type="text" class="form-control" placeholder="Phone"
							required="required" name="phone"  value='<c:out value="${phonec }"></c:out>'/>
								<input type="text" class="form-control" placeholder="Company name"
							required="required" name="companyname"  value='<c:out value="${companynamec }"></c:out>'/>
						<button class="btn btn-danger" type="submit" >Update
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
	<c:catch var="exc">
		<sql:update dataSource="${ds}" var="update">
		update seller set name = ?,age = ?,region = ?,
		phone=?,companyname=? WHERE EmailShoping = ? and id = '${idset}'
			<sql:param value="${param.name }"/>
			<sql:param value="${param.age }"/>
			<sql:param value="${param.region }"/>
			<sql:param value="${param.phone }"/>
			<sql:param value="${param.companyname }"/>
			<sql:param value="${emailsession }"/>
		</sql:update>
		</c:catch>
		</c:if>
	
	 <c:if test="${update>=1 }">
      <div style="margin-left: 100px;text-align: center;width: 300px;font-size: 18px;font-family: consolas;">
     <c:out value="Update Succefully!"/></div>
     </c:if>
     <c:if test="${update<=null }">
     <div style="margin-left: 100px;text-align: center;width: 300px;font-size: 18px;font-family: consolas;">
     <c:out value=""/></div>
     </c:if>
     <c:if test="${exc!=null }">
     <div style="margin-left: 100px;text-align: center;width: 300px;font-size: 18px;font-family: consolas;">
     <c:out value="Try Again!"/></div>
   </c:if>
     

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>