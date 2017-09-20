<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Create new Account</title>
    <link href="assets/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    .fontstyle{
    font-family: consolas;
    font-size: 18px;
    color: white;
    font-style: bold;
    }
    </style>
  </head>
  <body class="bg">
  
  <jsp:useBean id="bean1" class="Model.CreateBeans" scope="session"></jsp:useBean>
  <jsp:setProperty property="*" name="bean1"/>

  <!-- Validate Data Create account -->

  <div class="container" style="padding: 28px">
    <form style="padding:30px;width: 400px"  action="<%= response.encodeURL(request.getContextPath() + "/Login") %>" method="post">
  <div class="form-group">
  
     <input  type="hidden" name="action" value="insert"/>
     <input type="email" class="form-control" id="Email" placeholder="Email" name="email" value="<%= session.getAttribute("email2") %>" />
     <input type="password" class="form-control" id="psw" placeholder="Password" name="password" value="<%= session.getAttribute("pass") %>"/>
     <input type="text" class="form-control" id="yourname" placeholder="Your Shoping Name" name="shopingname" value="<%= session.getAttribute("name") %>"/>
     <input type="text" class="form-control" id="phone" placeholder="Phone" name="phone" value="<%= session.getAttribute("ph") %>"/>  
     <input type="text" class="form-control" id="country" placeholder="Your Country" name="country" value="<%= session.getAttribute("country") %>"/>  
     <input type="text" class="form-control" id="region" placeholder="Your Region" name="region" value="<%= session.getAttribute("reg") %>"/> 
      
     <br><br>
      <button class="btn btn-success btn-sm" type="submit" style="width: 140px;height: 40px">
      Submit     </button>
      <a href="Login">
      <button class="btn btn-primary" type="button" style="width: 140px;height: 40px">
       Back    </button></a>
  </div>
</form>
<font class="fontstyle"><%=session.getAttribute("msg") %></font>
  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>