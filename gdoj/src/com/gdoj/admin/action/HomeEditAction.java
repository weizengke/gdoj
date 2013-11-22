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

public class HomeEditAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String content;
	private String sidebar_content;
	
	public String getSidebar_content() {
		return sidebar_content;
	}

	public void setSidebar_content(String sidebarContent) {
		sidebar_content = sidebarContent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String homeedit()throws Exception {
		
		try {
			String path = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
			//System.out.println(path+"WEB-INF\\templates\\homepage.html");
			content = StreamHandler.read(path+"WEB-INF\\templates\\homepage.html");
			sidebar_content = StreamHandler.read(path+"WEB-INF\\templates\\sidebarex.html");
			//System.out.println(content);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
        return SUCCESS;
	}
   
}
