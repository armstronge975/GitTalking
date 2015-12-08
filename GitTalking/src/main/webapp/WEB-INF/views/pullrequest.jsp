<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!Doctype html>
<html xmlns:th="http://www.thymeleaf.org">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <title>Pull Requests</title>
 </head>
 <body>
 <h1>Hello, ${user.userID}</h1>
 
  <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name">
  <select class="userCntrls" id="userDropMenu" onchange="javascript:window.location.replace(this.options[this.selectedIndex].value);">
	 <option value="${username}" id="activeUser">${user.userID}</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/timeline">Your Profile</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/account">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
 
 
 
 <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
 <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('index.html');" value="Logout">
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <br><br>
  <h3>Incoming Pull Requests:</h3><br><br>
  <p>None</p><br><br>
  <h3>Your Pull Requests:</h3><br><br>
  <p>None...yet. Browse for some repositories now or go to your projects to create a pull request!</p>
  <br><br>
  <a href="<%=request.getContextPath()%>/welcome">Go back.</a><br>
    <hr>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming">Coming Up</a></li>
  </ul>
 </body>
</html>