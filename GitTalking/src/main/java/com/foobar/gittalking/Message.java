package com.foobar.gittalking;

public class Message {
	public int ID;
	public String toUser;
	public String fromUser;
	public String content;
	
	public int getID() {
		return ID;
	}
	
	public String getToUser() {
		return toUser;
	}
	
	public String getFromUser() {
		return fromUser;
	}
	
	public void setID(int id) {
		ID = id;
	}
	
	public void setToUser(String to) {
		toUser = to;
	}
	
	public void setFromUser(String from) {
		fromUser = from;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
}
