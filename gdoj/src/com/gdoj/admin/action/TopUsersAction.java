package com.gdoj.admin.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.bean.TopUsersBean;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.quartz.SchedulerContext;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.freemarker.MyFreeMarker;

public class TopUsersAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	

	public String MakeTopUsers()throws Exception {
		
		try {
			List<User> users = new ArrayList<User>();
			users = TopUsersBean.getTopUsers();
			Map map = new HashMap();
			map.put("topusers", users);
			map.put("date", new Date());
			String root = ServletActionContext.getRequest().getRealPath("/WEB-INF");
			MyFreeMarker.generator(root, "topusers.ftl", "topusers.html",
					"topusers", map);
			
			
			
			/*
			 * OJ Contests 
			 * */
			
	        try { 
	            URL url = new URL(Config.getValue("OTHEROJ")); 
	            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream())); 
	            String line; 
	            String content = new String();
	            
	            while ((line = reader.readLine()) != null) { 
	                // ... 
	            	//System.out.println(line);
	            	content += line;
	            } 
	            reader.close(); 
	          
	            String path = ServletActionContext.getRequest()
				.getSession().getServletContext().getRealPath("/");
	            File f = new File(path + "otheroj.json");
	            
	            StreamHandler.write(f,content);
	 
	        } catch (MalformedURLException e) { 
	            // ... 
	        	
	        } catch (IOException e) { 
	            // ... 
	        }
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
        return SUCCESS;
	}
   
}
