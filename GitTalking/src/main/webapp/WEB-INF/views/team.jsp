<! Doctype html>
<!-- A page which identifies all members participating in the developments of GitTalking -->
<html>
 <head>
  
  <title>GitTalking Team</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 </head>
 
 <!-- Beginning of Content -->
 <body>
  <form id="userBtns" action="login.html">
	<button class="genBtn" id="btnLogin" type="submit">Login</button>
	<button class="genBtn" id="btnSignup" type="submit" formaction="register.html">Signup</button>
  </form>
  <br><br><br><br><br><br>
  <h1>Meet the GitTalking Development Team!
   <h2> (and the founding members of FOOBAR Inc.) </h2>
  </h1>
  
  <div class="devTeam">
   <h3> Emily "Strong-Arm" Armstrong</h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight1.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  
  <div class="devTeam">
   <h3> Eric "Cisco Tamer" Cislo </h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight3.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  
  <div class="devTeam">
   <h3> Iain "That Guy" St. John </h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight6.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  
  <div class="devTeam">
   <h3> Irani "Impervious to Wordplay" Paiman </h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight2.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  
  <div class="devTeam">
   <h3> Michael "Jejunum" Kidney </h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight4.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  
  <div class="devTeam">
   <h3> Richard "Colonel Rick" Connell </h3>
   <br>
   <img src="<%=request.getContextPath()%>/resources/images/knight5.jpg" alt="Oops. No image here. Move along." id="teamPic">
  </div>
  <br><br><br><br>
  
  <br><br>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming">Coming Up</a></li>
  </ul>
 </body>
</html>