package com.gdoj.mail.action;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.mail.service.MailService;
import com.gdoj.mail.vo.Mail;
import com.gdoj.message.vo.Message;
import com.gdoj.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class JsonNewMailCountAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MailService mailService;
	private Integer nCount=0;
	private boolean success;
	private String error;
	
	public Integer getnCount() {
		return nCount;
	}

	public void setnCount(Integer nCount) {
		this.nCount = nCount;
	}

	public String countNewMails()throws Exception{
		
		try {
		    String username = new String();
		    username = (String)ActionContext.getContext().getSession().get("session_username");
		    if(username!=null){
		    	 String sql = "select count(m.mail_id) from Mail m where m.defunct='N' and m.isnew=1 and m.to_user='"+username+"'";
				 nCount = mailService.countMails(sql);	
		    }else{
		    	success = false; 
				return SUCCESS;
		    }
		} catch (Exception e) {
			// TODO: handle exception
			success = false; 
			return SUCCESS;
		}
		success = true;
		
		return SUCCESS;
	}
	
	@JSON(deserialize=false,serialize=false)  
	public MailService getMailService() {
		return mailService;
	}
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
	
}
