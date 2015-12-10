<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!Doctype html>
<!-- Thymeleaf is an alternative to jsp and jstl approach. Feel free to change back to form taglib (such as form:form) -->
<html xmlns:th="http://www.thymeleaf.org">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <title>Welcome</title>
 </head>
 <body>
 	<h1>${message} </h1>
  <h1>Hello, ${user.userID}</h1>
  <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name" />
<select class="userCntrls" id="userDropMenu" onchange="javascript:window.location.replace(this.options[this.selectedIndex].value);">
	 <option value="${user.userID}" id="activeUser">${user.userID}</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/timeline">Your Profile</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/account">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
  <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
  <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('<%=request.getContextPath()%>/');" value="Logout"> 	
  <br><br>
  <div id="resources">
	<h1>Other Resources</h1>
	 <a href="<%=request.getContextPath()%>/pullrequest">Pull Requests</a><br><br>
	 <a href="<%=request.getContextPath()%>/timeline">My Timeline</a><br><br>
	 <a href="<%=request.getContextPath()%>/viewpublicrepository">View Public Repositories</a><br><br>					
	 <a href="<%=request.getContextPath()%>/tutorial">Git Tutorial</a><br><br>
  </div>
  <h1 class="heads">Your Repositories:</h1>
  	<!-- Add later: Query for user's list of repositories -->
	<p style="color:yellow"> You are currently not a collaborator on any repositories. </p>
  <img id="welcomeImg" src="<%=request.getContextPath()%>/resources/images/knight7.jpg" alt="Photo not found">
  <!-- the onclick event handler below will be replaced with a proper create repo script at a later date -->
  <form action="createrepo" method="GET">
   <input class="genBtn" id="btnAddRepo" type="submit" value="Create Repository"/>
  </form>
  <br><br>
  <h1 class="heads">Your Social Life:</h1>
  <!-- Add later: Query for recent messages and changes in repositories -->
   <p> No timeline posts, updates from collaborators. Create or find a repo to start collaborating. </p><br>
   <p> Send a public message to someone below!</p><br>
   <h1 style="color:red">${message} </h1>
   <form:form action="welcome" method="POST" modelAttribute="newMsg">
	   <form:label class="lbl" for="txtUser" path="toUser">Username:</form:label>
	   <form:input type="text" id="txtUser" path="toUser" /><br>
	   <form:label class="lbl" for="txtMessage" path="content">Message:</form:label>
	   <form:textarea id="txtMessage" rows="8" cols="50" path="content"></form:textarea><br><br>
	   <input type="submit" class="genBtn" value="Send Message" />
   </form:form>
  <br><br><br><br><br><br>
  <hr>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>