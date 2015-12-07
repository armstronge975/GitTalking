<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<! Doctype html>
<!-- This is GitTalking's Git tutorial. Users will see this automatically after creating an account and can view this from the home page after login. -->

<html>
 <head>
  <meta charset="utf-8">
  <title>View Public Repository</title>
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
  

  
  <br>
  
 <table width="657" border="1" cellpadding="1" style="color:gold;">
  <tbody>
    <tr>
      <td style="color:gold;">(Repository Name Here) </td>
    </tr>
  </tbody>
</table>
<table width="657" height="183" border="1" cellpadding="1" font-color="white">
  <tbody>
    <tr>
      <th width="4" scope="col" align="left" style="color:gold;"><img src="<%=request.getContextPath()%>/resources/images/GitMainFolder.jpg" width="22" height="22" align="left" style="color:gold;">(Repository name here)</th>
      <th width="21" scope="col" style="color:gold;">Description Here </th>
      <th width="22" scope="col" style="color:gold;">Timestamp Here </th>
    </tr>
    <tr>
      <td><img src="<%=request.getContextPath()%>/resources/images/GitDocIcon.jpg" width="22" height="23" alt=""/></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

 <p>To find additional information, visit Github's glossary <a href="https://help.github.com/articles/github-glossary/">here</a> to find more information</p>
 <br>
 <a id="cont" href="<%=request.getContextPath()%>/welcome">Back to Welcome Page</a>
  <hr>
  <!-- Links to other pages in Horizontal NavBar.--> 
  <!-- Links, in order: GitHub repository link, meet the team, about us page, and upcoming features page.-->
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming">Coming Up</a></li>
  </ul>
 </body>
</html>