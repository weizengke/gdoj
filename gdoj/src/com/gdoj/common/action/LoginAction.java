package com.gdoj.common.action;

import java.util.Date;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.OnlineUsers;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3552864426020089250L;
	private UserService userService; 
	private String handle;
	private String password;
	private String url;
	private String remember;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String execute()throws Exception {
		try {
			if(false==userService.isUsernameExist(handle)){
				System.out.println(new Date()+":"+handle + " is not exist.");
				this.addFieldError("handle", "username is not exist.");
				return INPUT;
			}
			
			User user_ = new User();
			user_ = userService.checkLogin(handle, password);
			if (null != user_) {
				ActionContext.getContext().getSession().put("session_username",user_.getUsername());
				OnlineUsers.onlineUser(user_.getUsername());
				user_.setLastlogin(new Date());
				userService.save(user_);
				
				if (null != remember)
				{
					Cookie cookie = new Cookie("cookieOnlineJudgeUsername", handle);
					cookie.setMaxAge(60*60*24*30); //设置cookie有效期为30天
					Cookie cookie_ = new Cookie("cookieOnlineJudgePassword", password);
					cookie_.setMaxAge(60*60*24*30);
					ServletActionContext.getResponse().addCookie(cookie);
					ServletActionContext.getResponse().addCookie(cookie_);					
				}
				
				return SUCCESS;
			}else{
				System.out.println(new Date()+":"+handle+" login ,but password is invalid.");
				this.addFieldError("password", "password is invalid.");
				return INPUT;
			}
		} catch (Exception e) {
			// TODO: handle exception
			
			return ERROR;
		}
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}
	public String getRemember() {
		return remember;
	}
}
