package com.gdoj.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService; 
	private List<User> users;
	private User user;
	private String username;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String execute()throws Exception {
		users = userService.queryUsers(1,100);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("userlist", users);
		for(User u:users){
			System.out.println(u.getUsername());
		}
		return SUCCESS;
	}
	public String userList() throws Exception {
		users = userService.queryUsers(1,100);	
		return SUCCESS;
	}
	public String queryUsers() throws Exception {
		users = userService.queryUsers(1,100);
		return SUCCESS;
	}
	public String queryUser()  throws Exception {
		try {
			user = userService.queryUser(username);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}		
}
