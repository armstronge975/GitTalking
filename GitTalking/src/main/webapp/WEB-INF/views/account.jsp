<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<! Doctype html>
<!-- This page serves as a place holder for a functional registration page. -->
<!-- The page is simply an empty html document with a backround-image of a wireframe mockup -->
<html xmlns:th="http://www.thymeleaf.org">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/info.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/links.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/styles/ui.css">
 <script src="<%=request.getContextPath()%>/resources/scripts/jquery.js"></script>
 <script type="text/javascript">
 	function checkPW(txt1, txt2) {
 		if(txt1.value != txt2.value){
 			alert('Please enter matching passwords in the input boxes.');
 			return false;
 		}
 		return true;
 	}
 </script>
 <title>Account Settings</title>
 </head>
 <body>
 <h1 style="color:red">${message} </h1>
 <h1>Edit Your Account Settings</h1>
 <a href="<%=request.getContextPath()%>/welcome"><h2 align="center">Go back</h2></a>
  <hr>
  <br><br>
  <form:form action="#" method="POST" onsubmit="return checkPW(txtPass, txtCheck);" modelAttribute="user">
	<label class="lbl" for="txtFirst">First Name:</label>
	<form:input class="inField" type="text" name="firstName" maxlength="50" required="required" value="${user.firstName}" path="firstName" />
	<br><br>
	<label class="lbl" for="txtLast">Last Name:</label>
	<form:input class="inField" type="text" path="lastName" name="lastName" id="txtLast" maxlength="50" required="required" value="${user.lastName}"/>
	<br><br>
	<label class="lbl" for="txtEmail">Email:</label>
	<form:input class="inField" type="email" path="email" name="email" id="txtEmail" maxlength="35" required="required" value="${user.email}"/>
	<br><br>
	<label class="lbl" for="txtUser">Username:</label>
	<form:input class="inField" type="text" path="userID" name="userID" id="txtUser" maxlength="25" required="required" value="${user.userID}"/>
	<br><br>
	<label class="lbl" for="txtPass">Password:</label>
	<form:input class="inField" type="password" path="password" name="password" id="txtPass" maxlength="15" required="required" value="${user.password}"/>
	<br><br>
	<label class="lbl" for="txtCheck">Confirm Password:</label>
	<input class="inField" type="password" name="passwordCheck" id="txtCheck" maxlength="15" required="required" value="${user.password}" />
	<br><br>
	<fieldset id="regFld">
	  <legend class="cLbl">Select Account Type</legend>
	  <label class="cLbl" for="radPub">Public</label>
	  <form:radiobutton name="accountType" path="accountType" value="public" id="radPub" checked="${user.accountType}=='public'?'checked':''" />
	  <label class="cLbl" for="radPvt">Private</label>
	  <form:radiobutton name="accountType" path="accountType" value ="private" id="radPvt" checked="${user.accountType}=='private'?'checked':''" />
  	</fieldset>
	<br><br>
	<input type="submit" class="genBtn" id="regSub" value="Save Settings"/>
  </form:form>
  <ul class="bottomnavbar">
	<li class="nvbr"> <a target="_blank" href="https://github.com/armstronge975/GitTalking">Project on GitHub</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/team2">The GitTalking Team</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/welcome">Back to Home Page</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/about2">About</a></li>
	<li class="nvbr"> <a href="<%=request.getContextPath()%>/upcoming2">Coming Up</a></li>
  </ul>
 </body>
</html>