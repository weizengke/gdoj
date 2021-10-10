package com.gdoj.message.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.util.DateUtil;
import org.apache.struts2.ServletActionContext;

import com.gdoj.bean.LatestTopicBean;
import com.gdoj.bean.MessageBean;
import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Html2Text;
import com.util.freemarker.MyFreeMarker;

public class MessageListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessageService messageService;
	private UserService userService;
	private List<Integer> pageList;
	private Integer page=1;	
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	private Integer pageSize = 20;
	private List<MessageBean> messages;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String topicList()throws Exception {
		
		if(pageSize>20){
			pageSize=20;
		}
		intRowCount = messageService.countRootMessages();
		pageCount = ((intRowCount + pageSize - 1) / pageSize);//�������ҳ��
		if (page< 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		List<Message> messages_ = new ArrayList<Message>();
		messages_ = messageService.queryRootMessages(page,pageSize);
	
		messages = new ArrayList<MessageBean>();
		
		for(Message m_:messages_){
			MessageBean mb_ = new MessageBean();
			mb_.setMessageId(m_.getMessage_id());
			mb_.setAuthor(m_.getCreate_user());
			mb_.setTitle(m_.getTitle());
			mb_.setOrderNum(m_.getOrderNum());
			mb_.setViews(m_.getViews());
			mb_.setVotes(m_.getVotes());
			mb_.setIn_date(m_.getIn_date());
			mb_.setFriendly_Date(DateUtil.toFriendlyDate(m_.getIn_date()));
			String bufString = new String();
		 	bufString = Html2Text.RemoveHtml(((m_.getContent().length()>2000)?(m_.getContent()).substring(0, 2000):m_.getContent()));
			
			mb_.setContent_abstract(((bufString.length()>500)?(bufString).substring(0, 500)+"...":bufString));
			
			String sql = "select count(m.message_id) from Message m where m.root_id="+m_.getMessage_id();
			
			mb_.setComments(messageService.count(sql)-1);
			
			Message lm = new Message();
			lm = messageService.getLatestReply(m_.getMessage_id());
			if(lm!=null){
			   mb_.setLastReplyId(lm.getMessage_id());
			   mb_.setLastReplyUser(lm.getCreate_user());
			   mb_.setLastReplyDate(lm.getIn_date());
			   mb_.setLastReplyFriendlyDate(DateUtil.toFriendlyDate(lm.getIn_date()));
			   
			   User rplu = new User();
			   rplu = userService.queryUser(mb_.getLastReplyUser());
			    if(rplu != null){
					mb_.setLastRplUser(rplu);
				}			   
			}
			
			User u = new User();
			u = userService.queryUser(m_.getCreate_user());
			if(u!=null){
				mb_.setAvatar(u.getAvatar());
				mb_.setUser(u);
			}
			messages.add(mb_);
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
				volume.add(0); //ʡ�Ժ�	
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
				volume.add(0); //ʡ�Ժ�
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

	public List<MessageBean> getMessages() {
		return messages;
	}
	public void setMessages(List<MessageBean> messages) {
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

}
