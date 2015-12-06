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
 <title>Welcome</title>
 </head>
 <body>
  <h1 class="userCntrls" id="welcomeMsg" th:text="'Hello ' + ${user.userID}" ></h1>
  <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name">
  <select class="userCntrls" id="userDropMenu">
	 <option value="${userID}" id="activeUser">${username}</option>
	  <option class="altOps" value="timeline.html">Your Profile</option> 
	 <!-- started by Rich C<option class="altOps" value="<%=request.getContextPath()%>/">Your Profile</option> -->
	 <option class="altOps" value="messages.html">Your Private Messages</option>
	 <option class="altOps" value="account.html">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
  <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
  <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('<%=request.getContextPath()%>/');" value="Logout"> 	
  <br><br>
  <div id="resources">
	<h1>Other Resources</h1>
	 <a href="<%=request.getContextPath()%>/pullrequest">Pull Requests</a><br><br>
	 <a href="<%=request.getContextPath()%>/timeline">My Timeline</a><br><br>
	 <!--  <a href="publicrepos.html">View Public Repositories</a><br><br> -->
	 <a href="<%=request.getContextPath()%>/viewpublicrepository">View Public Repositories</a><br><br>					
	 <a href="<%=request.getContextPath()%>/tutorial">Git Tutorial</a><br><br>
  </div>
  <h1 class="heads">Your Repositories:</h1>
  <ol class="heads" id="repoList">
	<li id="repoDefault"> You are currently not a collaborator on any repositories. </li>
  </ol>
  <img id="welcomeImg" src="<%=request.getContextPath()%>/resources/images/knight7.jpg" alt="Photo not found">
  <!-- the onclick event handler below will be replaced with a proper create repo script at a later date -->
  <form action="createrepo.html">
   <input class="genBtn" id="btnAddRepo" type="submit" value="Create Repository"/>
  </form>
  <br><br>
  <h1 class="heads">Your Social Life:</h1>
  <ul class="heads" id="socialList">
   <li id="socDefault"> No timeline posts, updates from collaborators. Create or find a repo to start collaborating. </li>
  </ul>
  <br><br><br><br><br><br>
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