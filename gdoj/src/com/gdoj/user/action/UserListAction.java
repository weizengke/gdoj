package com.gdoj.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

public class UserListAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService; 
	private List<String> users;
	private String q;
	
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public List<String> getUsers() {
		return users;
	}
	public void setUsers(List<String> users) {
		this.users = users;
	}
	
	@JSON(deserialize=false,serialize=false)   
	public UserService getUserService() {
		return userService;
	}  
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String execute()throws Exception {
		String q_ = new String();
		if (q != null){
			q_ = q;
		}else{
			return SUCCESS;
		}
		String sql = "select u.username from User u where u.username like ? and u.defunct='N' order by u.id ASC";
        users = userService.queryAllUserName(sql, q_, 20); 
        return SUCCESS;
	}
}
