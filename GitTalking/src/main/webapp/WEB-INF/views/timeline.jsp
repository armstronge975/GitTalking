<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<! Doctype html>
<html>
 <head>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script type="text/javascript" src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <title>Timeline</title>
 </head>
 <body>
 <h1 class="userCntrls" id="welcomeMsg">Hello, ${username}!</h1>
 <input class="userCntrls" type="text" id="repoSearch" placeholder="Search a repository, username or full name" />
 <select class="userCntrls" id="userDropMenu" onchange="javascript:window.location.replace(this.options[this.selectedIndex].value);">
	 <option value="${username}" id="activeUser">${username}</option>	 
	 <option class="altOps" value="<%=request.getContextPath()%>/account">Your Account Settings</option>
	 <option class="altOps" value="<%=request.getContextPath()%>/">Logout</option>
  </select>
 <!-- the onclick event handler below will be replaced with a proper logout script at a later date -->
 <input class="userCntrls" type="button" id="logout" onclick="window.location.replace('<%=request.getContextPath()%>/');" value="Logout"><br><br>
   <h1 class="userCntrls" style="color:green">${message}</h1>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <br><br>
  <div style="display:inline-block;">
  <h3>About:</h3><br><br><br>
  <p>${timelineContent}	</p>
  <form:form method="POST" action="#" name="frmEdit" modelAttribute="timeline">
  <p class="centered">Edit your About section:</p><br>
  <form:input path="content" value="${timelineContent}"/>
  <br><br>
  <input type="submit" class="genBtn" value="Edit Information"/>
  </form:form>
  </div>
  <div style="display:inline-block; position: relative;left:25%;">
  <h3>Your public messages:</h3><br><br>
  <c:forEach items="${msgList}" var="msg">
  	<h2>From ${msg.fromUser}, sent at ${msg.timeSent}, ${msg.likes} likes, ${msg.comments} comments</h2> <br>
  	<input type="button" class="genBtn" value="Like" /><input type="button" class="genBtn" value="View Comments" /><br>
  	<h4 style="color:yellow" align="center">${msg.content}</h4><br><br>
  	<p style="color:yellow">Comment below:</p>
  	<textarea cols="50" rows="4"></textarea><br>
  	<input type="button" class="genBtn" value="Comment" /><br><br>
  </c:forEach>
  </div>
    <hr>
  <<ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>