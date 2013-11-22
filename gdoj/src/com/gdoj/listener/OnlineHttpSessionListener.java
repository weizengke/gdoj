package com.gdoj.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.gdoj.user.service.UserService;
import com.util.OnlineUsers;

public class OnlineHttpSessionListener implements HttpSessionListener {
	private UserService userService;
	private static int count;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public static int getOnlineCount(){
		return count;
	}
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		//System.out.println("Someone visit:"+se.getSession().getAttribute("uname_session"));	
	}
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub	
		String name = se.getSession().getAttribute("session_username").toString();
		System.out.println(name+" Do Log out...");
		if(name!=null&&name.length()!=0){	
			//us.logout(name);
			OnlineUsers.removeUser(name);
		}
	}
}
