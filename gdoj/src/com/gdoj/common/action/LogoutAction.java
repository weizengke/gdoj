package com.gdoj.common.action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.OnlineUsers;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

public class LogoutAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3552864426020089250L;
	public String execute()throws Exception {
		try {	
				String url = new String();
				url =(String)ActionContext.getContext().getSession().get("session_url");
				if(url==null||"".equals(url)){
					url="enter";
				}
				String name = (String)ActionContext.getContext().getSession().get("session_username").toString();
				if(name!=null&&name.length()!=0){						
					OnlineUsers.offlineUser(name);
				}
				
				ActionContext actionContext = ActionContext.getContext();
				
				actionContext.getSession().clear();
				
				Cookie cookie = new Cookie("cookieOnlineJudgeUsername", null);
				cookie.setMaxAge(0);
				Cookie cookie_ = new Cookie("cookieOnlineJudgePassword", null);
				cookie_.setMaxAge(0);
				ServletActionContext.getResponse().addCookie(cookie);
				ServletActionContext.getResponse().addCookie(cookie_);
				
				ActionContext.getContext().getSession().put("session_url",url);  
				return SUCCESS;
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
	}
}
