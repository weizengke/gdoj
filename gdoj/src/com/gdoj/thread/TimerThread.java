
package com.gdoj.thread;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.gdoj.bean.TopUsersBean;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.MyApplicationContextUtil;
import com.util.freemarker.MyFreeMarker;

import freemarker.template.TemplateException;

public class TimerThread extends Thread {
	public void run() {
		
		while (true) {				
		

			List<User> users = new ArrayList<User>();
			try {
				users = TopUsersBean.getTopUsers();
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			Map map = new HashMap();
			map.put("topusers", users);
			
			try {
				MyFreeMarker.generator("NULL","topusers.ftl", "topusers.html", "topusers", map);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (TemplateException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {		
				Thread.sleep(60000);
			}catch(Exception e) {
				
			}
		}	
	}
}
