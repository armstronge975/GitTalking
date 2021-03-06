<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<! Doctype html>
<!-- This is GitTalking's Git tutorial. Users will see this automatically after creating an account and can view this from the home page after login. -->

<html>
 <head>
  <meta charset="utf-8">
  <title>GitTalking Tutorial</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 </head>
 
 <!-- Beginning of Content -->
 <body>
  <a href="http://strose.edu">
   <img id="srLogo" src="<%=request.getContextPath()%>/resources/images/stroseLogo.jpeg" alt="Where is my logo!?">
  </a>
  <img id="gtLogo" src="<%=request.getContextPath()%>/resources/images/gitTalkingLogo.png" alt="Where is my logo!?">
  <h1>Git Tutorial</h1>
  <hr>
  <br><br><br>
  
  <!-- Links to login and registration -->
  <ul class="topnavbar">
	<li class="navbar"> <a href="<%=request.getContextPath()%>/welcome">I already know Git! Skip this.</a></li>
  </ul>
  
  <br>
  
  <!-- Intro -->
  <h2> To use GitTalking, you should know a couple things about Git first.</h2>
  <p> Git is a very helpful language when collaborating with project groups. It provides a series of commands that assist GitTalking with its versioning and 
  source control system. This means that all changes made to files will be recording and members will automatically see the most up-to-date versions of their
  files. They can even compare file versions, delete any unneeded changes and provide messages explaining the changes. This tutorial will teach you how you
  can use Git both on the website and locally via the command line. </p>
  <!-- Why use GitTalking? -->
  <h2> How it's Used</h2>
  <p> Git on GitTalking is very easy to use. Rather than manually typing in commands, users will interact with a graphical user interface (GUI) where the
  commands are replicated as buttons and other visible objects. The icons and text will make it very obvious which command is executing. On the command line,
  you will need to type in the commands and any additional information. Don't worry, it's quick to learn and we provided some examples below. </p>
  <br>
  <!-- Lists of GitTalking Features -->
  <div class="socialFeatures"GitTalking Social Features>
   <h3> Here are some common commands available for Git. </h3><br><br><br>
   <ul>
    <li> Add: A change was made but not ready to be integrated in the project. example) git add myFilename.ext **In GitTalking, add, commit and push are done together. </li>
    <li> Commit: Your change is correct and ready to be integrated. Include a message explaining your change. example) git commit myFilename.ext</li>
	<li> Push: Integrate your change into your team project. example) git push OR git push origin master (used to specify branches)</li>
	<li> Pull: Grab the latest updates and put them in your local project. example) git pull </li>
	<li> Status: Display the status and any changes for all files. example) git status </li>
	<li> Diff: Show the differences of modified files. example) git diff</li>
	<li> Reset: Remove the file's changes and restore it to a previous state. example) git reset HEAD file.ext **Hard resets can cause 
	permanent deletion. </li>
	<li>Branches: Create files on the side to test functionality and to not disrupt the project. <br>To create branch: git checkout -b branchName
	<br>To push the branch: git push origin branchName</li>
   </ul>
  </div>
  <br><p>As stated before, the website will perform these commands with buttons and other objects. It will be intuitive what an object
  does. For instance, creating a repository will include clicking a button with a plus sign and a form to indictate specific information.
  In addition, pull requests can be made website to suggest a user to merge your proposed changes to a project. The user can either accept
  or deny the request. </p>
 <p>To find additional information, visit Github's glossary <a href="https://help.github.com/articles/github-glossary/">here</a> to find more information</p>
 <br>
 <a id="cont" href="<%=request.getContextPath()%>/welcome">Continue</a>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>