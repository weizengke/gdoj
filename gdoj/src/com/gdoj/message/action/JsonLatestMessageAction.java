package com.gdoj.message.action;


import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.json.annotations.JSON;
import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.opensymphony.xwork2.ActionSupport;
public class JsonLatestMessageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessageService messageService;
	private List<Message> latestMessages;
	private boolean success;
	private String error;

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String latestMessages()throws Exception {
		try {
			latestMessages = new ArrayList<Message>();
			latestMessages = messageService.queryLatestMessages(null,1,20);
		} catch (Exception e) {
			// TODO: handle exception
			success=false;error="load latest topic failed.";
			return SUCCESS;
		}
		success=true;
		return SUCCESS;
	}
	public List<Message> getLatestMessages() {
		return latestMessages;
	}
	public void setLatestMessages(List<Message> latestMessages) {
		this.latestMessages = latestMessages;
	}

	@JSON(deserialize=false,serialize=false) 
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
}
