package com.gdoj.admin.action;

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
import com.util.MyApplicationContextUtil;
import com.util.StreamHandler;
import com.util.freemarker.MyFreeMarker;

public class HomeMakerAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String content;
	private String sidebar_content;
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSidebar_content() {
		return sidebar_content;
	}

	public void setSidebar_content(String sidebarContent) {
		sidebar_content = sidebarContent;
	}

	public String homemaker()throws Exception {
		
		try {
			if(content == null) {
				content = "Welcome To GUET Online Judge";
				try {
					String path = ServletActionContext.getRequest()
							.getSession().getServletContext().getRealPath("/");
					//System.out.println(path+"WEB-INF\\templates\\homepage.html");
					content = StreamHandler.read(path
							+ "WEB-INF\\templates\\homepage.html");
				} catch (Exception e) {
					// TODO: handle exception
				}				
			}
			
			if(sidebar_content == null) {
				sidebar_content = "";
				try {
					String path = ServletActionContext.getRequest()
							.getSession().getServletContext().getRealPath("/");
					//System.out.println(path+"WEB-INF\\templates\\homepage.html");
					sidebar_content = StreamHandler.read(path
							+ "WEB-INF\\templates\\sidebarex.html");
				} catch (Exception e) {
					// TODO: handle exception
				}				
			}

			Map map = new HashMap();
			map.put("content", content);	
			String root = ServletActionContext.getRequest().getRealPath("/WEB-INF");
									
			MyFreeMarker.generator(root, "homepage.ftl", "homepage.html",
					"content", map);
			
			Map map_sidebar = new HashMap();
			map_sidebar.put("sidebar_content", sidebar_content);
					
			MyFreeMarker.generator(root, "sidebarex.ftl", "sidebarex.html",
					"sidebar_content", map_sidebar);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
        return SUCCESS;
	}
   
}
