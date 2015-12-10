package com.foobar.gittalking;

public class User {
	private String firstName, lastName, email, accountType, userID, password, userLevel;
	
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
	
	public void setUserLevel(String UL) {
		userLevel = UL;
	}
	
	public String getUserLevel() {
		return userLevel;
	}
	
	@Override
	public String toString() {
		return firstName + " " + lastName + ", " + userID;
	}
}
