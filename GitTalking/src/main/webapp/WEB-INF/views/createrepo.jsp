<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<! Doctype html>
<!-- This page serves as a place holder for a functional registration page. -->
<!-- The page is simply an empty html document with a backround-image of a wireframe mockup -->
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <title>New Repository</title>
 </head>
 <body>
 <h1 class="userCntrls" id="welcomeMsg">Hello ${user.userID}!</h1>
 <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name">
 <select class="userCntrls" id="userDropMenu" onchange="javascript:window.location.replace(this.options[this.selectedIndex].value);">
	 <option value="${username}" id="activeUser">${username}</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/timeline">Your Profile</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/messages">Your Private Messages</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/account">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
 <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
 <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('index.html');" value="Logout">
 <br><br>
 <h1>Create a Repository</h1>
 <br><a href="welcome.html"><h2 align"center">Go back</h2></a>
 <p style="text-align:center;"><strong>Fill in the needed information below. All fields are required.</strong></p>
  <hr>
  <form:form action="#" ModelAttribute="repo">
  	<span class="login" style="width: 100%; text-align:center;"> 
		<span style="width:10%;">Repository Name: </span> <form:input type="text" maxlength="50" style="width: 264px" path="repoName"/><br>
		<span style="width:10%;">Repository Type:  </span>
		<span>Public<form:radiobutton checked="checked" style="width: 69px" name="account" path="type" />Private</span><form:radiobutton style="width: 104px" name="account" path="type" /><br>
		<span>Create Readme File   </span><input type="checkbox" checked><br>
		<span>Enter the names of collaborators (separate each name with a space):</span><br>
		<textarea wrap="hard" rows="4"></textarea>
  	</span><br><br><br>
  	<input type="submit" class="button" value="Create Repository" style="position: relative;left:45%;">
  </form:form>
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
