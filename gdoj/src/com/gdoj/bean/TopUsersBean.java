package com.gdoj.bean;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.Config;
import com.util.MyApplicationContextUtil;

public class TopUsersBean {
	
	public static List<User> getTopUsers() throws Exception{
		List<User> users = new ArrayList<User>();
		
		Integer topNum = 10;
		try {
			topNum = Integer.valueOf(Config.getValue("WEB_TOP_USER_NUM")).intValue();
			if (topNum < 10) {
				topNum = 10;
			} else if (topNum > 100) {
				topNum = 100;
			}
		}catch(Exception e) {
			topNum = 10;
		}
		
		UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
		//System.out.println("countUsers:"+userService.countUsers());
		users = userService.getStandings(0, topNum, "rating");
		
		return users;
	}
}
