package com.gdoj.message.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gdoj.bean.LatestTopicBean;
import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.opensymphony.xwork2.ActionSupport;
import com.util.freemarker.MyFreeMarker;

public class LatestMessageListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessageService messageService;
	private List<Message> messages;
	private List<Integer> pageList;
	private Integer page=1;	
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	private List<Integer> commentList;
	private Integer pageSize = 100;
	
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String recentAction()throws Exception {
		
		if(pageSize>100){
			pageSize=100;
		}
		intRowCount = messageService.countMessages();
		pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
		if (page< 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		messages = new ArrayList<Message>();
		messages = messageService.queryLatestMessages(null,page,pageSize);
		
		commentList = new ArrayList<Integer>();
		for(int i=0;i<messages.size();i++){
			String sql = new String();
			if(messages.get(i).getRoot_id().equals(messages.get(i).getMessage_id())){ 
				sql= "select count(m.message_id) from Message m where m.root_id="+messages.get(i).getMessage_id();
				commentList.add(messageService.count(sql)-1);
			}else{
				sql= "select count(m.message_id) from Message m where m.parent_id="+messages.get(i).getMessage_id();
				commentList.add(messageService.count(sql));
			}
			//System.out.println(messages.get(i).getTitle());
		}	
		
		List<Integer> volume = new ArrayList<Integer>();
		if(pageCount<7){
			for (Integer i = 1; i <= pageCount; i++) {
				volume.add(i);
			}
		}
		else
		{
			volume.add(1);
			if(page>4){
				volume.add(0); //省略号	
			}
			Integer start_i = new Integer(2);
			Integer end_i = new Integer(pageCount-1);
			if(page-2>2){
				start_i = page-2;
			}
			if(page+2<pageCount){
				end_i = page+2;
			}
			
			for(Integer i=start_i;i<= end_i;i++){
					volume.add(i);
			}	
			
			if(page<pageCount-3){ 		
				volume.add(0); //省略号
			}
			
			volume.add(pageCount);
		}
		
		pageList = volume;
		
	
		
		return SUCCESS;
	}
	
	
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public List<Message> getMessages() {
		return messages;
	}
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getIntRowCount() {
		return intRowCount;
	}
	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public List<Integer> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Integer> commentList) {
		this.commentList = commentList;
	}
}
