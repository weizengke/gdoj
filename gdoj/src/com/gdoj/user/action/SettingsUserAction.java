package com.gdoj.user.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.oauth.service.OAuthService;
import com.gdoj.oauth.vo.OAuth;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class SettingsUserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	private UserService userService;
	private OAuthService oauthService;
	private String username;
	private User user;
	private String birthday;
	private List<OAuth> oauthList;

	public OAuthService getOauthService() {
		return oauthService;
	}
	public void setOauthService(OAuthService oauthService) {
		this.oauthService = oauthService;
	}
	public List<OAuth> getOauthList() {
		return oauthList;
	}
	public void setOauthList(List<OAuth> oauthList) {
		this.oauthList = oauthList;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
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
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String settings()throws Exception {
		try {
			username = (String) ActionContext.getContext().getSession().get(
					"session_username");	
			if (null == username || "".equals(username)) {
				return LOGIN;
			}
			user = userService.queryUser(username);
			try {
				birthday = DateUtil.DateToString(user.getBirthday(),"yyyy-MM-dd");
			} catch (Exception e) {
				// TODO: handle exception
			}

			oauthList = oauthService.queryByUser(username);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
}
