package com.gdoj.common.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class RedirectAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6769837690387947674L;
	private String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void execute()throws Exception {
		
		  try {
			  url = (String) ActionContext.getContext().getSession().get(
				"session_url");
			  //	System.out.println(url);
			  	if(null==url){
			  		url=ServletActionContext.getRequest().getContextPath();
			  	}
				ServletActionContext.getResponse().sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
