<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="assets/style.css" rel="stylesheet">
<title>Shoping Manger</title>
<style type="text/css">
.fontstyle{
   color: red;
   font-size: 14px;
   font-family: consolas;
   font-style: bold;
}
</style>
</head>
<body class="bg">
	<center>
		<h2 style="color: white">Welcome to Shoping Manger</h2>
		<div style="margin: auto 100px; width: 200px;">
			<button
				onclick="document.getElementById('id01').style.display='block'"
				style="width: 200px;">Login
				</button>
	</center>
	</div>
	<div id="id01" class="modal">
    
		<form class="modal-content animate" 
		    action="<%= response.encodeURL(request.getContextPath() + "/Login") %>"
			method="post">
            <input type="hidden" value="action" name="action"/>
			<div class="container">
				<label><b>Username</b></label> <input type="text"
					placeholder="Enter Email" name="uname"   required > <label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="psw"
					required>

			<button type="submit" name="submit1">Login</button>
				
      <a href="<%= response.encodeURL(request.getContextPath() + "/CreateProfile.jsp")%>"><button type="button">Create Account</button></a>

			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					
					class="cancelbtn">Cancel</button><br/>
					<center><div class="fontstyle"><%=session.getAttribute("msg")%></div></center>
			</div>
			
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>