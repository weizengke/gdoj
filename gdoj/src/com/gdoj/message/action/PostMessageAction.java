package com.gdoj.message.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.gdoj.bean.LatestTopicBean;
import com.gdoj.bean.MessageBean;
import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.Html2Text;
import com.util.MailUtil;
import com.util.freemarker.MyFreeMarker;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;

public class PostMessageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessageService messageService;
	private Message message;
	private Integer messageId;
	private Integer problemId;
	private Integer contestId;
	private Integer moduleId=0;
	private Integer parentId;
	private Integer rootId;
	private Integer orderNum;
	private String title="";
	private String content;
	private String createUser;
	private String type="new";

	private boolean success;
	private String error;
	
	private TagsviewService tagsviewService;
	private TagsService tagsService;
	private List<String> tag;
	private Integer tagsCount=0;
	
	private UserService userService;
	
	@JSON(deserialize=false,serialize=false) 
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@JSON(deserialize=false,serialize=false)   
	public TagsviewService getTagsviewService() {
		return tagsviewService;
	}
	public void setTagsviewService(TagsviewService tagsviewService) {
		this.tagsviewService = tagsviewService;
	}
	@JSON(deserialize=false,serialize=false)   
	public TagsService getTagsService() {
		return tagsService;
	}
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	
	public List<String> getTag() {
		return tag;
	}
	public void setTag(List<String> tag) {
		this.tag = tag;
	}
	public Integer getTagsCount() {
		return tagsCount;
	}
	public void setTagsCount(Integer tagsCount) {
		this.tagsCount = tagsCount;
	}
	private List<Message> latestMessages;
	
	@JSON(deserialize=false,serialize=false)   
	public List<Message> getLatestMessages() {
		return latestMessages;
	}
	public void setLatestMessages(List<Message> latestMessages) {
		this.latestMessages = latestMessages;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

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

	public String postMessage()throws Exception{
		
		try {

			success = true;
			createUser = (String)ActionContext.getContext().getSession().get("session_username");
			  if(null==createUser||"".equals(createUser)){
				  	success = false;error="You must login first.";	
				  	return SUCCESS;
		        }
			  if("new".equals(type)){
				  if(rootId!=null&&rootId.equals(0)){ 
					  if(null==title||title.trim().length()==0){
						 	success = false;error="Title shouldn't be empty.";
						 	return SUCCESS;
						}
				  }
			  }else if("edit".equals(type)){
				  if(null==title||title.trim().length()==0){
					 	success = false;error="Title shouldn't be empty.";
					 	return SUCCESS;
					}
			  }
			 	
				if(null==content||content.trim().length()==0){
				 	success = false; error="Content shouldn't be empty.";
				 	return SUCCESS;
				}
				
				//System.out.println(title+content);
				
				Date dt_prevSubmit = (Date)ActionContext.getContext().getSession().get("session_submit");
				Date dt = new Date(); 
				
				if(dt_prevSubmit!=null){
					//System.out.println(dt.getTime()-dt_prevSubmit.getTime());
					if(dt.getTime()-dt_prevSubmit.getTime()<10000){  //限制5s一次提交
						System.out.println(createUser+" submit-topic twice at 5 second.");
					//	this.addFieldError("tip", "");
						success = true;
						return SUCCESS;
					}
				}
			ActionContext.getContext().getSession().put("session_submit", dt);
			
			Message message_ = new Message();
			Message message_parent = new Message();
			Message message_root = new Message();
			
			//System.out.println(messageId+title+content);
			if("new".equals(type)){ //新建
				message_.setProblem_id(problemId);
				message_.setContest_id(contestId);
				message_.setModule_id(moduleId);
				message_.setParent_id(parentId);
				message_.setRoot_id(rootId);
				message_.setContent(content);
				if(!parentId.equals(0)){
					message_root = messageService.queryMessage(rootId);
					if (null == message_root){
						success = false; error="post topic failed.";
					 	return SUCCESS;
					}
					message_.setTitle(message_root.getTitle());
				}else{
					message_.setTitle(title);
				}
				
				message_.setCreate_user(createUser);
			//	Date dt = new Date();
				
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				message_.setIn_date(Timestamp.valueOf(simpleDate.format(dt)));
				
				message = message_;
				messageService.saveMessage(message);
				if(rootId.equals(0)){//是楼主，设置rootID为自己
					message.setRoot_id(message.getMessage_id());
					messageService.saveMessage(message);
				}
				messageId = message.getMessage_id();
				
				/* 发送到被评论用户注册邮箱*/
				if(!parentId.equals(0)){
					try {
						/* 提醒用户注册邮箱 */
						message_parent = messageService.queryMessage(parentId);
						if (null == message_parent){
							success = false; error="post topic failed.";
						 	return SUCCESS;
						}
						
						User user_ = new User(); /* 获取被评论的用户*/
						user_ = userService.queryUser(message_parent.getCreate_user());
						if (null == user_){
							success = false; error="post topic failed.";
						 	return SUCCESS;
						}
						
						MailUtil sendmail = new MailUtil();
						sendmail.setHost(Config.getValue("MAIL_HOST")); //发邮件服务器
						sendmail.setUserName(Config.getValue("MAIL_USERNAME")); //用户名
						sendmail.setPassWord(Config.getValue("MAIL_PSW")); //密码
						sendmail.setTo(user_.getEmail()); //发送到
						sendmail.setFrom(Config.getValue("MAIL_FROM")); //发送邮箱
						sendmail.setSubject(message_root.getTitle()); //标题
						String content_ = new String();
						content_ = "Hi! " + user_.getUsername() + " , new reply from "
								+ createUser + "\n " + Config.getValue("DOMAIN")
								+ "/topic/"+ message_root.getMessage_id() +"#rpl_" + messageId + 
								"\n\n" + Html2Text.RemoveHtml(content);
						
						sendmail.setContent(content_); //邮件内容
						sendmail.sendMail();
						
						System.out.println(createUser + "sendmail.sendMail() ok.. ");
						
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("sendmail.sendMail() failed [line:245].. ");
						//success = false; error="post topic failed.";
						//return SUCCESS;
					}
				}
				
			}else{  //修改
				
				message_ = messageService.queryMessage(messageId);
				message_.setContent(content);				
				message_.setTitle(title);
				message = message_;
				messageService.saveMessage(message);
			}	
			
			//tags
			//tags = new ArrayList<String>();			
			tagsviewService.removeMessagesTag(message.getMessage_id());
			
			String tagString = new String();
			if(tag!=null){
				System.out.println(tag.size());
				for(String t_:tag){
					System.out.println(t_);
					Tags tag_ = new Tags();
					tag_ = tagsService.queryTag(t_);
					System.out.println(tag_.getName());
					tagString+=t_+" ";
					
					if(tag_==null){
						//no such tag	
						tag_ = new Tags();
						tag_.setCreate_user(createUser);					 
						tag_.setIndate(new Date());
						tag_.setName(t_);
						tagsService.save(tag_);
					}
					Tagsview tagsview_ = new Tagsview();
					tagsview_.setTag_id(tag_.getTag_id());
					tagsview_.setMessage_id(message.getMessage_id());
					tagsviewService.save(tagsview_);
				}
			}
			
			//latest topic
			latestMessages = new ArrayList<Message>();
			latestMessages = messageService.queryLatestMessages(null,0,20);
			List<MessageBean> topics = new ArrayList<MessageBean>();

			for(Message m_:latestMessages){
				MessageBean mb = new MessageBean();
				mb.setAuthor(m_.getCreate_user());
				mb.setTitle(m_.getTitle());
				mb.setIn_date(m_.getIn_date());
				mb.setFriendly_Date(getFriendlyDate(m_.getIn_date()));
				mb.setMessageId(m_.getMessage_id());
				mb.setParentId(m_.getParent_id());
				mb.setRootId(m_.getRoot_id());
				topics.add(mb);
			}
			Map map = new HashMap();
			map.put("topics", topics);
			//ActionContext.getContext().get
			String root = ServletActionContext.getRequest().getRealPath("/WEB-INF");			
			 	
			MyFreeMarker.generator(root,"latesttopic.ftl","latesttopic.html","topics",map);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("save topic error..");
			success = false; error="Unknown error.";
			return SUCCESS;
		}
		
		success = true;
		System.out.println("post topic ok. ");
		return SUCCESS;
	}
	
	public String getFriendlyDate(Date time){
		if(time == null) return getText("unknown");
		int ct = (int)((System.currentTimeMillis() - time.getTime())/1000);
		if(ct < 3600)
			return Math.max(ct / 60,1) +getText("minutes_before");
		if(ct >= 3600 && ct < 86400)
			return ct / 3600 +getText("hours_before");
		if(ct >= 86400 && ct < 2592000){ //86400 * 30
			int day = ct / 86400 ;	
			if(day>1){
				return day +getText("days_before");	
			}
			return getText("yesterday");			
		}
		if(ct >= 2592000 && ct < 31104000) //86400 * 30
			return ct / 2592000 +getText("months_before");
		return ct / 31104000 + getText("years_before");
	}
	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getRootId() {
		return rootId;
	}

	public void setRootId(Integer rootId) {
		this.rootId = rootId;
	}
	
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	public Integer getModuleId() {
		return moduleId;
	}
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	@JSON(deserialize=false,serialize=false)   
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}


}
