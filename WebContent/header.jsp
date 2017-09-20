<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title></title>
</head>
<body>

 <ul class="nav nav-tabs">
  <li role="presentation" >
  <a href="<%= response.encodeURL(request.getContextPath() + "/SignOut.jsp") %>">Sign Out</a>
  </li>
   <li role="presentation" >
  <a href="<%= response.encodeURL(request.getContextPath() + "/Home.jsp") %>">Home</a>

  </li>
  <li role="presentation">
  <a href="<%= response.encodeURL(request.getContextPath() + "/MyAccount.jsp") %>" >Profile</a></li>
  <li role="presentation"><a href="#">Messages</a></li>
 </ul>
</body>
</html>