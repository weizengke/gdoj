package com.gdoj.privilege.vo;

import java.io.Serializable;

import com.gdoj.user.vo.User;

public class Privilege implements Serializable {

	private Integer id;
	private String username;
	private String rightstr;
	
	private User user;
	
	public Privilege() {
		super();
		// TODO Auto-generated constructor stub	
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRightstr() {
		return rightstr;
	}
	public void setRightstr(String rightstr) {
		this.rightstr = rightstr;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	
}
