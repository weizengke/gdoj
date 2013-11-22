package com.gdoj.common.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShowImageAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6769837690387947674L;
	private String message;
	
	
	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public void showImage()throws Exception {
		 ActionContext context = ActionContext.getContext();
		 HttpServletResponse response = (HttpServletResponse) context.get(ServletActionContext.HTTP_RESPONSE);  
		 
		 //response.getOutputStream().write("image/userphoto/ACSolo/photo_big.jpg");
		 //System.out.print("image/userphoto/ACSolo/photo_big.jpg");
		 response.getWriter().print("image/userphoto/ACSolo/photo_big.jpg");
			//System.out.println(message);
	}
}
