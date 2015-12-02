<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <meta charset="utf-8">
  <title>GitTalking Homepage</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 </head>
 
 <!-- Beginning of Content -->
 <body>
   <!-- Links to login and registration -->
  <form id="userBtns" action="login" method="post">
	<button class="genBtn" id="btnLogin" type="submit">LOGIN</button>
	<button class="genBtn" id="btnSignup" type="submit" formaction="register">SIGNUP</button>
  </form>
  <br><br><br><br><br><br>
  <a href="http://strose.edu">
   <img id="srLogo" src="<%=request.getContextPath()%>/resources/images/stroseLogo.jpeg" alt="Where is my logo!?">
  </a>
  <img id="gtLogo" src="<%=request.getContextPath()%>/resources/images/gitTalkingLogo.png" alt="Where is my logo!?">
  <h1>GitTalking</h1>
  <h2>Developed by FOOBAR Inc.</h2>
  <h2> The College of Saint Rose </h2>
  <hr>
  <br>
  <!-- What is GitTalking -->
  <h2> What is GitTalking? </h2>
  <p> Welcome to GitTalking! This site embodies (or at least it will!) the unique fusion of the technical collaboration of GitHub, and the social interaction of
	   Facebook. This site is intended to be an informal, yet effective way for programmers to work together and communicate with each other. With this 
       site, we seek to bring users everything they need to work together on common projects, and provide feedback to each other's work in a usefully enjoyable
       setting.	</p>
  <br>
  <!-- Why use GitTalking? -->
  <h2> Why Should I Use GitTalking? </h2>
  <p> GitTalking allows one to experience all the social interaction and collaborative work on programming projects in one centralized location. There's no need
      to switch back and forth between dozens of tabs. You can submit your contributions to the work you need to do, and communicate with your team members all
	  in the same spot! GitTalking allows teammates to provide feedback on their friends' work, and keep in touch at the same time, with the same easy-to-use
	  interface. Best of all--it's free!
  </p>
  <br>
  <!-- Lists of GitTalking Features -->
  <div class="socialFeatures"GitTalking Social Features>
   <h2> GitTalking Social Features </h2>
   <ul>
    <li> Create and edit your own personal profile. </li>
    <li> View people who have worked, or are currently working with you on projects. </li>
	<li> View your activity on your wall, and your friends' on theirs. </li>
	<li> "Like" and "Dislike" that same activity. </li>
	<li> Keep in touch with friends via private messages. </li>
   </ul>

  </div>
  
  <div class="productiveFeatures">
   <h2> GitTalking Productive Features </h2>
   <ul>
    <li> Create public or private projects for you and others to work on. </li>
	<li> Add or remove other users as collaborators as you see fit. </li>
	<li> Work with others to contribute to any number projects from any location. </li>
	<li> View every iteration of each project, from start to finish. </li>
	<li> Keep track of each version of your project, and roll back as far as you need at any time </li>
   </ul>
  </div>
  
  <div class="gitFeatures">
   <h2> GitTalking GitHub Features </h2>
    <ul>
     <li> Utilize the following existing features of GitHub without leaving GitTalking: </li>
	  <ul>
		<li> Add </li>
		<li> Commit</li>
		<li> Push </li>
		<li> Pull </li>
		<li> Check Status </li>
		<li> Reset </li>
	  </ul>
	</ul>
  </div>
  
  <br><br>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="team.html">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="about.html">About</a></li>
	<li class="nvbr"> <a href="upcoming.html">Coming Up</a></li>
  </ul>
 </body>
</html>
