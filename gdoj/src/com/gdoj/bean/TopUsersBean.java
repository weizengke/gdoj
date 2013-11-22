package com.gdoj.bean;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.MyApplicationContextUtil;

public class TopUsersBean {
	
	public static List<User> getTopUsers(){
		List<User> users = new ArrayList<User>();
		
		UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
		//System.out.println("U:"+userService.countUsers());
		users = userService.getStandings(0, 10, "solved");
		return users;
	}
}
