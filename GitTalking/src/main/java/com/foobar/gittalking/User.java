package com.foobar.gittalking;

import org.springframework.beans.factory.annotation.Autowired;

public class User {
	private String firstName, lastName, email, accountType, userID, password;
	/*
	// FIX THIS LATER
	public User() {
		this.firstName = "";
		this.lastName = "";
		this.email = "";
		this.accountType = "";
		this.userID = "";
		this.password = "";
	}
	
	public User(String fName, String lName, String email, String aType, String UserID, String password) {		
		this.firstName = fName;
		this.lastName = lName;
		this.email = email;
		this.accountType = aType;
		this.userID = UserID;
		this.password = password;
	}
	*/
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getAccountType() {
		return accountType;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setFirstName(String fName) {
		firstName = fName;
	}
	
	public void setLastName(String lName) {
		lastName = lName;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setAccountType(String type) {
		accountType = type;
	}
	
	public void setUserID(String UID) {
		userID = UID;
	}
	
	public void setPassword(String pw) {
		password = pw;
	}
	
	@Override
	public String toString() {
		return firstName + " " + lastName + ", " + userID;
	}
}
