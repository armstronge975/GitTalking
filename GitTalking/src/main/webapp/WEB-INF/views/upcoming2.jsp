<! Doctype html>
<!-- A page which documents where we currently stand, and what we seek to add in the future. It also reiterates the waiting room section of the requirements doc. -->
<html>
 <head>
  <title>GitTalking's Upcoming Features</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 </head>
 
 <!-- Beginning of Content -->
 <body>

  <h1> Current Version : -0.01 </h1>
  
  <h2> Currently Implemented </h2>
  <ol class="techList">
   <li> Visual, yet minimally functional mockup of GitTalking site. </li>
   <li> Current site layout/underlying architecture is in place. </li>
  </ol>
  
  <h2> Coming Soon </h2>
  <ol class="techList">
   <li> Ability to register a profile and login to GitTalking via interactable user forms. </li>
   <li> Ability to create projects via backstage calls to GitHub, and its functions. </li>
   <li> Ability to send, receive, and view private messages with other users. </li>
   <li> Ability to view and create feedback on project contributions. </li>
   <li> Both regular and administrative users will have access to social and functional aspects of the site. </li>
   <li> Although payment is on hold, admin users will be able to specify private users for testing purposes. </li>
   <li> The functionality from Facebook and GitHub will begin to take form. </li>
  </ol>
  
  <h2> Backburner </h2>
  <ol class="techList">
   <li> Private projects and associated payment for them via Paypal. </li>
   <li> Profile pictures for user profiles. </li>
   <li> Internal text editor to edit project files within GitTalking. </li>
   <li> More advanced GitHub functions, such as branching.</li>
  </ol>
  
 <br><br>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
 <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	
  </ul>
 </body>
</html>