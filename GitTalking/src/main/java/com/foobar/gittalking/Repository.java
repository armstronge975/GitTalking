package com.foobar.gittalking;

public class Repository {
	public int ID;
	public String URL;
	public String push, pull, openCase;
	
	public int getID() {
		return ID;
	}
	
	public String getURL() {
		return URL;
	}
	
	public String getPush() {
		return push;
	}
	
	public String getPull() {
		return pull;
	}
	
	public String getOpenCase() {
		return openCase;
	}
	
	public void setID(int id) {
		ID = id;
	}
	
	public void setURL(String url) {
		URL = url;
	}
	
	public void setPush(String ps) {
		push = ps;
	}
	
	public void setPull(String pl) {
		pull = pl;
	}
	
	public void setOpenCase(String oc) {
		openCase = oc;
	}
}
