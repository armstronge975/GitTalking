package com.foobar.gittalking;

public class Timeline {
	public int ID;
	public String content;
	public String userID;
	
	public int getID() {
		return ID;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setID(int id) {
		ID = id;
	}
	
	public void setContent(String c) {
		content = c;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String user) {
		userID = user;
	}
}
