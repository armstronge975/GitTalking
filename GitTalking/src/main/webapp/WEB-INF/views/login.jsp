<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <script src="<%=request.getContextPath()%>/resources/scripts/login.js"></script>
 <title>User Login</title>
 </head>
 <body>
  <form:form action="#" method="post" modelAttribute="user">
 	<label id="lblImg"> GitTalking </label>
	<label class="lblLog" for="txtUsername">Username:</label>
	<input type="text" id="txtUsername" name="userID" maxlength="25" required>
	<label class="lblLog" for="txtPassword"> Password:</label>
	<input type="password" id="txtPassword" name="password" maxlength="25" required>
	<input type="submit" class="genBtn" value="Login">
  </form:form>
  <p>GitTalking is a source control system that allows developers to collaborate within a social setting.
  Users can work on the same files, see each other's changes, like and comment on posts, and perform many other social
  tasks. Git started today!</p>
  <img src="<%=request.getContextPath()%>/resources/images/login.jpg" alt="Photo not found." id="loginPic">
  <hr>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="team.html">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="index.html">Back to Home Page</a></li>
	<li class="nvbr"> <a href="about.html">About</a></li>
	<li class="nvbr"> <a href="upcoming.html">Coming Up</a></li>
  </ul>
 </body>
</html>