package com.library;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Login_details {
	@Id
	private String username;
	private String password;
	public Login_details() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Login_details(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}
