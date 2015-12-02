<! Doctype html>
<!-- This page serves as a place holder for a functional registration page. -->
<!-- The page is simply an empty html document with a backround-image of a wireframe mockup -->
<html>
 <head>
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="styles/ui.css">
 <link rel="stylesheet" type="text/css" href="styles/links.css">
 <link rel="stylesheet" type="text/css" href="styles/info.css">
 <script type="text/javascript" src="scripts/jquery.js"></script>
 <title>Account Settings</title>
 </head>
 <body>
 <h1>Edit Your Account Settings</h1>
 <a href="index.html"><h2 align="center">Go back</h2></a>
 <p id="regNote"><strong>Fill in the needed information below. All fields are required.</strong></p>
  <hr>
  <br><br>
  <form id="regFrm" action="tutorial.html" method="post">
	<label class="lbl" for="txtFirst">First Name:</label>
	<input class="inField" type="text" class="txt" name="firstName" maxlength="50" required>
	<br><br>
	<label class="lbl" for="txtLast">Last Name:</label>
	<input class="inField" type="text" name="lastName" id="txtLast" maxlength="50" required>
	<br><br>
	<label class="lbl" for="txtEmail">Email:</label>
	<input class="inField" type="email" name="email" id="txtEmail" maxlength="35" required>
	<br><br>
	<label class="lbl" for="txtUser">Username:</label>
	<input class="inField" type="text" name="username" id="txtUser" maxlength="25" required>
	<br><br>
	<label class="lbl" for="txtPass">Password:</label>
	<input class="inField" type="password" name="password" id="txtPass" maxlength="15" required>
	<br><br>
	<label class="lbl" for="txtCheck">Confirm Password:</label>
	<input class="inField" type="password" name="passwordCheck" id="txtCheck" maxlength="15" required>
	<br><br>
	<fieldset id="regFld">
	  <legend class="cLbl">Select Account Type</legend>
	  <label class="cLbl" for="radPub">Public</label>
	  <input type="radio" name="acctType" id="radPub" checked>
	  <label class="cLbl" for="radPvt">Private</label>
	  <input type="radio" name="acctType" id="radPvt">
  	</fieldset>
	<br><br>
	<input type="submit" class="genBtn" id="regSub" value="Save Settings">
  </form>
  <br><br><br>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="team.html">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="index.html">Back to Home Page</a></li>
	<li class="nvbr"> <a href="about.html">About</a></li>
	<li class="nvbr"> <a href="upcoming.html">Coming Up</a></li>
  </ul>
  </ul>
 </body>
</html>