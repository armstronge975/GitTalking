<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<! Doctype html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <title>Hello World Repository</title>
 </head>
 <body>
 <h1 class="userCntrls" id="welcomeMsg">Hello, ${user.userID}!</h1>
 <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name">
<select class="userCntrls" id="userDropMenu" onchange="javascript:window.location.replace(this.options[this.selectedIndex].value);">
	 <option value="${username}" id="activeUser">${user.userID}</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/timeline">Your Profile</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/account">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
 <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
 <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('<%=request.getContextPath()%>/');" value="Logout">
 <h1 style="float:left;">Hello-World</h1><br><br><br>
  <br><br>
  <!-- TODO for later: decide how Files will be uploaded -->
  <table border='1'>
  <tr><td><input type="button" class="button" value="+ Add Files">
  <input type="button" class="button" value="View Collaborators" onclick="window.location.replace('collablist.html');">
  <input type="button" class="button" value="- Delete Repository" style="background-color:red">
  </td></tr>
  <tr><td>Most recent commit: Edited README.md 2 days ago</td></tr>
  <tr><td><a href='readme.html'>README.md</a></td></tr>
  <tr><td>README.md contents:<br>My first repository. Let's keep the ball rolling!</td></tr>
  </table>
  <br><br>
  <a href="welcome.html">Go back.</a><br>
    <hr>
 <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>