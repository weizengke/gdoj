package com.gdoj.common.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.OnlineUsers;

public class RegisterAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	
	private UserService userService; 

	private String username;
	private String password;
	private String repeat_password;
	private String nickname;
	private String email;
	private String school;
	private String motto;
	private String opensource;
	private String ip;
	private Date birthday;
	private User user;
	private Integer language;
	
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
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
	public String getRepeat_password() {
		return repeat_password;
	}
	public void setRepeat_password(String repeatPassword) {
		repeat_password = repeatPassword;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	public String getOpensource() {
		return opensource;
	}
	public void setOpensource(String opensource) {
		this.opensource = opensource;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String execute()throws Exception {
		try {
			//System.out.println(username+" " + password+" " +email);
			if(true==userService.isUsernameExist(username)){
				//System.out.println(username+"用户名已被使用");
				this.addFieldError("username", "This username is currently in use.");
				return INPUT;
			}
			if( null!= userService.getUserByEmail(email)){
				this.addFieldError("email", "This email is currently in use.");
				return INPUT;
			}
			
			User user_ = new User();
			
			user_.setUsername(username);
			user_.setPassword(password);
			user_.setEmail(email);
			Date dt = new Date();
			
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			user_.setBirthday(Timestamp.valueOf(simpleDate.format(dt)));
			user_.setRegdate(Timestamp.valueOf(simpleDate.format(dt)));
			user_.setLastlogin(Timestamp.valueOf(simpleDate.format(dt)));
			
			userService.save(user_);
			
			ActionContext.getContext().getSession().put("session_username",username);
			OnlineUsers.onlineUser(username);
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			
			return ERROR;
		}
	}
}
