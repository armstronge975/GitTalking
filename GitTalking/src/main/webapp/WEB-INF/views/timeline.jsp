<! Doctype html>
<html>
 <head>
<<<<<<< HEAD
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script type="text/javascript" src="scripts/jquery.js"></script>
=======
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
>>>>>>> branch 'master' of https://github.com/armstronge975/GitTalking.git
 <title>Timeline</title>
 </head>
 <body>
 <h1 class="userCntrls" id="welcomeMsg">Hello, armstronge975!</h1>
 <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name">
 <select class="userCntrls" id="userDropMenu">
	<option value="" id="activeUser">armstronge975</option>
	<option class="altOps" value="timeline.html">Your Profile</option>
	<option class="altOps" value="messages.html">Your Private Messages</option>
	<option class="altOps" value="account.html">Your Account Settings</option>
	<option class="altOps" value="index.html">Logout</option>
 </select>
 <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
 <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('index.html');" value="Logout">
  <img src="images/minion.jpg" style="height:30%;">
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <br><br>
  <div style="display:inline-block;">
  <h3>About:</h3><br><br><br>
  <p>Name: Emily<br>
	Location: Albany, NY<br>
	Occupation: Student<br>
	Technical Interests: web design, Bootstrap, SQL<br>
	Non-technical Interests: shopping, traveling, playing viola/piano, softball, gaming<br>
	Talk to me about: New technologies, tourist attractions
	</p><br><br>
  <h3>Posts:</h3><br><br>
  <p>None</p><br><br>
  <h3>Recent Activity</h3><br><br>
  <p>None...yet.</p>
  </div>
  <br><br>
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