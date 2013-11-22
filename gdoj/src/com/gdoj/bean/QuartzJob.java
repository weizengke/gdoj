package com.gdoj.bean;

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

import org.apache.struts2.ServletActionContext;


import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.util.Config;
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.freemarker.MyFreeMarker;

public class QuartzJob {
	
	@SuppressWarnings("deprecation")
	public void work()  
    {  
	   // System.out.println(new Date()+":"+" Generate Top 10.");
	    try {
	    	//System.out.println(Thread.currentThread().getContextClassLoader().getResource("").toExternalForm());  
	    	String root =  Thread.currentThread().getContextClassLoader().getResource("").toString();
	    	
	    	root = root.replaceAll("file:/", "").replaceAll("%20", " ").replaceAll("/classes/", "");
	    	
	    	//System.out.println(root);
			List<User> users = new ArrayList<User>();
			UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
	  
			users = userService.getStandings(0, 10, "solved");
		
			Map map = new HashMap();
			map.put("topusers", users);
			map.put("date", new Date());
			MyFreeMarker.generator(root, "topusers.ftl", "topusers.html",
					"topusers", map);
			
			
			/*
			 * 
			 * Other OJ contests
			 * 
			 * */
			
			root = root.replaceAll("file:/", "").replaceAll("%20", " ").replaceAll("WEB-INF", "");
			
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
	          
	            //String path = ServletActionContext.getRequest()
				//.getSession().getServletContext().getRealPath("/");
	            File f = new File(root + "otheroj.json");
	            
	            StreamHandler.write(f,content);
	 
	        } catch (MalformedURLException e) { 
	            // ... 
	        	
	        } catch (IOException e) { 
	            // ... 
	        	System.out.println("get other oj contest error");  
	        }
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("top 10 error");  
		}
    }  
}
