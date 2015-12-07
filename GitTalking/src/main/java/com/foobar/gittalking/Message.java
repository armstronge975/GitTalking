package com.foobar.gittalking;

import java.sql.Timestamp;

public class Message {
	public int ID;
	public String toUser;
	public String fromUser;
	public String content;
	public Timestamp timeSent;
	public int likes;
	public int comments;
	
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
	
	public Timestamp getTimeSent() {
		return timeSent;
	}
	
	public void setTimeSent(Timestamp ts) {
		timeSent = ts;
	}
	
	public int getLikes() {
		return likes;
	}
	
	public void setLikes(int like) {
		likes = like;
	}
	
	public int getComments() {
		return comments;
	}
	
	public void setComments(int c) {
		comments = c;
	}
	
	public void incrementLikes() {
		likes++;
	}
	
	public void incrementComments() {
		comments++;
	}
}
