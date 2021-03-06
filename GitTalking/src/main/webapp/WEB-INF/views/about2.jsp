<! Doctype html>
<!-- A page which describes some info about our group, our project, its purpose, and the tools used in implementation. -->
<html>
 <head>
  <meta charset="utf-8">
  <title>About Us</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 </head>
 
 <!-- Beginning of Content -->
 <body>

  <h1> The Purpose of GitTalking </h1>
  <br> <hr>
  <p> The task of implementing GitTalking as our own fusion of GitHub and Facebook was commissioned for our Software Engineering class, here at the College of 
  Saint Rose. Upon completion, the site will serve as a fully functional social networking and software versioning site, available to programmers of any skill
  level, affiliated with this school, or otherwise.
  </p>
  
  <h1> Technologies Used </h1>
  <br> 
  <hr>
  <!-- Tech -->
  <h2> Technologies Utilized in Implementation </h2>
  <dl class="techList">
	<dt> Spring Tool Suite 4.0 </dt>
	<dd>- a Java MVC Framework used in the implementation of both client-side and server-side server communications. </dd>
	<dt> JQuery </dt>
	<dd>- a JavaScript library used to simplify the scripting of the site's front-end, user interface design.</dd>
	<dt> Apache Tomcat 8 </dt>
	<dd>- a free and open-source Java servlet container and web-server. </dd>
	<dt> JDBC (Java Database Connectivity)</dt>
	<dd>- API used to implement the communication and connectivity between Java applications and SQL databases.  </dd>
	<dt> My SQL </dt>
	<dd>- a free and open-source RDBMS (Relational Database Management System) allowing for the external storage of user-related data. </dd>
	<dt> Java JRE and JDK </dt>
	<dd>- Spring, Tomcat, Eclipse, and JDBC all require working versions of the Java Runtime Environment and Java Development Kit. </dd>
	<dt> Eclipse Mars </dt>
	<dd>- a Java-native IDE (Integrated Development Environment) that permits the integration of various tools involved in development, such as Spring and GitHub.</dd>
	<dt> GitHub </dt>
	<dd>- collaborative versioning software, in which GitTalking was developed. </dd>
  </dl>
  
  <!-- Languages -->
  <h2> Languages Utilized in Implementation </h2>
  <ul>
	<li id="lang"> Java </li>
	<li id="lang"> SQL </li>
	<li id="lang"> HTML</li>
	<li id="lang"> CSS</li>
	<li id="lang"> Javascript </li>
  </ul>
  
  <h1> The Proud History of FOOBAR Inc. </h1>
  <p> The legacy of FOOBAR Inc. began on the fateful day on which we were all assigned to the same group, and spoke a collective, "Wait...what?" upon learning
  exactly what our assignment entailed, and subsequently realizing that we <strike> have no idea what we're doing </strike> have an excellent handle on everything.
  </p>
  
 <br><br>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
		<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>