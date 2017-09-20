<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<link href="assets/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<title>Delete Account</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
   
   <jsp:include page="SessionFile.jsp"></jsp:include>
   <c:set var="sessionemail" value="${sessionScope.Email }"></c:set>
    <sql:setDataSource dataSource="jdbc/servletdb" var="ds"/>
    

    <sql:update var="deleteaccount" dataSource="${ds }" 
    sql="delete from account where Email = ?">
    <sql:param value="${param.email1 }"/>
    </sql:update>
    
	<div class="container" style="padding: 30px;width: 400px">
		
		<center>
		<h4 class="display-4">Enter Your Email for Delete Account</h4>
		<br/><br/><br/>
		<form method="post" action="DeleteAccount.jsp">
		<div class="form-group">
		<input type="email" class="form-control" placeholder="Email" 
		name="email1" value="${sessionemail}"/>
		<br/><br/><br/>
		<button class="btn btn-danger" type="submit" onclick="change()"> Delete </button>
		</form>
		</div>
		<p id="ToBeChanged" style="color: red;font-size: 15px;font-style: bold"></p>
		</center>
	</div>

   <c:if test="${deleteaccount == 0 }">
   <center><c:out value="" ></c:out></center>
   </c:if>
   <c:if test="${deleteaccount >=1 }" >
   <c:redirect url="SignOut.jsp"/>
   </c:if>

    <script type="text/javascript">
    function change(){
        document.getElementById("ToBeChanged").innerHTML = "Email not Found";
    };
    </script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>