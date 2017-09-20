<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
 
   <sql:setDataSource dataSource="jdbc/servletdb" var="ds"/>
    

    <sql:update var="deleteaccount" dataSource="${ds }" 
    sql="delete from account where Email = ?">
    <sql:param value="${param.email1 }"/>
    </sql:update>
   
<form method="post" action="androiddelete.jsp">
		<div class="form-group">
		<input type="email" class="form-control" placeholder="Email" 
		name="email1" />
		<br/><br/><br/>
		<button class="btn btn-danger" type="submit" onclick="change()"> Delete </button>
		</form>

</body>
</html>