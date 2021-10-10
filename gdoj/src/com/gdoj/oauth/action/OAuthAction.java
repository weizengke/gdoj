package com.gdoj.oauth.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.oauth.service.OAuthService;
import com.gdoj.oauth.vo.OAuth;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.GiteeOAuth;
import com.util.GithubOAuth;
import com.util.OnlineUsers;

public class OAuthAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OAuthService oauthService;
	private UserService userService;
	private String code;
	private String provider;

	public OAuth openAuthGitee(String code)throws Exception {
		GiteeOAuth gitee = new GiteeOAuth();
		String client_id = Config.getValue("GITEE_CLIENT_ID");
		String client_sec = Config.getValue("GITEE_CLIENT_SECRET");
		OAuth user = gitee.login(client_id, client_sec, code);
		return user;
	}

	public OAuth openAuthGithub(String code) {
		GithubOAuth github = new GithubOAuth();
		String client_id = Config.getValue("GITHUB_CLIENT_ID");
		String client_sec = Config.getValue("GITHUB_CLIENT_SECRET");
		OAuth user = github.login(client_id, client_sec, code);
		return user;
	}
	public String oauthUnbind()throws Exception {
		String currentUsername = (String) ActionContext.getContext().getSession()
				.get("session_username");
		if (null == currentUsername || "".equals(currentUsername)) {
			return LOGIN;
		}

		User user_ = userService.queryUser(currentUsername);
		if (null == user_) {
			return LOGIN;
		}

		OAuth oauth_ = oauthService.queryOAuthByUser(provider, currentUsername);
		if (oauth_ != null) {
			oauthService.delete(oauth_);
		}
		return SUCCESS;
	}

	public String oauth() throws Exception{
		System.out.println(provider + "&code="+code);
		OAuth oauth = new OAuth();
		if (provider.equals("github")) {
			oauth = openAuthGithub(code);
		} else if (provider.equals("gitee")) {
			oauth = openAuthGitee(code);
		} else {
			return INPUT;
		}
		if (oauth == null) {
			this.addFieldError("open-auth", "Login timeout, please try again.");
			return INPUT;
		}

		System.out.println(oauth.getProvider() + " " + oauth.getLogin());

		User user_ = new User();
		OAuth oauth_ = oauthService.queryOAuthByLoginName(oauth.getProvider(), oauth.getLogin());
		if (oauth_ == null) {
			/* 该账号未绑定，走绑定流程 */
			System.out.println(oauth.getProvider() + " " + oauth.getLogin() + " binding.");

			/* 检查是否已经登录 */
			String currentUsername = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (null == currentUsername || "".equals(currentUsername)) {
				this.addFieldError("open-auth",
						"The " + provider + " login "+oauth.getLogin()+" is not binding to any account.");
				return INPUT;
			}

			/* 已登录，账号绑定 */
			user_ = userService.queryUser(currentUsername);
			if (user_ == null) {
				return INPUT;
			}

			oauth_ = new OAuth();
			oauth_.setUsername(currentUsername);
			oauth_.setLogin(oauth.getLogin());
			oauth_.setProvider(oauth.getProvider());
			oauth_.setAvatar_url(oauth.getAvatar_url());
			oauth_.setNickname(oauth.getNickname());
			Date dt = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			oauth_.setCreate_date(Timestamp.valueOf(simpleDate.format(dt)));

			oauthService.save(oauth_);
		} else {
			/* 账号已绑定，查找登录用户 */
			System.out.println(oauth_.getProvider() + " " + oauth_.getLogin() + " " + oauth_.getUsername() +" login.");

			user_ = userService.queryUser(oauth_.getUsername());
			if (user_ == null) {
				return INPUT;
			}
		}

		ActionContext.getContext().getSession().put("session_username",user_.getUsername());
		ActionContext.getContext().getSession().put("session_avatar",user_.getAvatar());
		ActionContext.getContext().getSession().put("session_lang",user_.getLanguage());

		OnlineUsers.onlineUser(user_.getUsername());
		user_.setLastlogin(new Date());
		userService.save(user_);
		return SUCCESS;
	}

	public OAuthService getOauthService() {
		return oauthService;
	}

	public void setOauthService(OAuthService oauthService) {
		this.oauthService = oauthService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

}
