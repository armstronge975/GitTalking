<! Doctype html>
<!-- This page serves as a place holder for a functional login page. -->
<!-- The page is simply an empty html document with a backround-image of a wireframe mockup -->
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <title>Collaborators</title>
 </head>
 <body>
 <h1 class="userCntrls" id="repoName">Hello-World Collaborators</h1>
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
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <br><br>
  <input type="button" class="button" value="Invite Collaborators"><br><br>
  <h3>All Collaborators (** = Creator):</h3><br><br>
  <!-- Change ** to image icon later -->
  <ol>
  <li><a href="timeline.html">armstronge975**</a></li>
  </ol><br><br>
  <a href="repo.html">Go back.</a><br>
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