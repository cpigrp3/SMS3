package com.entity;

public class HomepageUser {
	private String username;
	private String userlevel;
	
	
	public HomepageUser(String username, int loginCounter) {
		this.username = username;
		this.loginCounter = loginCounter;
	}
	private int loginCounter = 1;
	@Override
	public String toString() {
		return "HomepageUser [username=" + username + ", loginCounter=" + loginCounter + "]";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getLoginCounter() {
		return loginCounter;
	}
	public void setLoginCounter(int loginCounter) {
		this.loginCounter = loginCounter;
	}
	public String getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}
}
