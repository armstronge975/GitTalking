<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html xmlns:th="http://www.thymeleaf.org">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <script type="text/javascript">
 	function checkPW(btn1, btn2) {
 		if(btn1.value != btn2.value){
 			alert('Please enter matching passwords in the input boxes.');
 			return false;
 		}
 		return true;
 	}
 </script>
 <title>User Registration</title>
 </head>
 <body>
 <h1>Create an Account</h1>
 <h1>${message}</h1>
 <a href="<%=request.getContextPath()%>/"><h2 align="center">Go back</h2></a>
 <p id="regNote"><strong>Fill in the needed information below. All fields are required.</strong></p>
 <hr>
 <br><br>
 <form action="#" method="POST" th:action="tutorial" th:object="${user}" onsubmit="return checkPW(txtPass, txtCheck);">
	<label class="lbl" for="txtFirst">First Name:</label>
	<input class="inField" type="text" class="txt" name="firstName"  maxlength="50" th:field="*{firstName}" required>
	<br><br>
	<label class="lbl" for="txtLast">Last Name:</label>
	<input class="inField" type="text" name="lastName" id="txtLast" maxlength="50" th:field="*{lastName}" required>
	<br><br>
	<label class="lbl" for="txtEmail">Email:</label>
	<input class="inField" type="email" name="email" id="txtEmail" maxlength="35" th:field="*{email}" required>
	<br><br>
	<label class="lbl" for="txtUser">Username:</label>
	<input class="inField" type="text" name="userID" id="txtUser" maxlength="25" th:field="*{userID}" required>
	<br><br>
	<label class="lbl" for="txtPass">Password:</label>
	<input class="inField" type="password" name="password" id="txtPass" maxlength="15" th:field="*{password}" required>
	<br><br>
	<label class="lbl" for="txtCheck">Confirm Password:</label>
	<input class="inField" type="password" name="passwordCheck" id="txtCheck" maxlength="15" required>
	<br><br>
	<fieldset id="regFld">
	  <legend class="cLbl">Select Account Type</legend>
	  <label class="cLbl" for="radPub">Public</label>
	  <input type="radio" name="accountType" id="radPub" th:field="*{accountType}" checked value="public">
	  <label class="cLbl" for="radPvt">Private</label>
	  <input type="radio" name="accountType" id="radPvt" th:field="*{accountType}" value="private">
  	</fieldset>
	<br><br>
	<input type="submit" class="genBtn" id="regSub" value="All done! Let's Git going!" >
  </form>
  <br><br><br>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming">Coming Up</a></li>
  </ul>
 </body>
</html>