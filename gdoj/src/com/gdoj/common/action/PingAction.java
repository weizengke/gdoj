package com.gdoj.common.action;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.OnlineUsers;

public class PingAction extends ActionSupport {

	/**
	 * 
	 */
	private boolean success;
	private String error;
	
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

	public void ping()throws Exception {
		try {
			
			String username = (String)ActionContext.getContext().getSession().get("session_username");
			if (username == null){
				success = false;
				error = "You have logout.";
			}
			else
			{
				OnlineUsers.onlineUser(username);
				success = true;
			}
			

		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error = "Unknown Error.";
			return ;
		}
	}
}
