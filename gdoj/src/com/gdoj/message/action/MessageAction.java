package com.gdoj.message.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gdoj.bean.LatestTopicBean;
import com.gdoj.bean.MessageBean;
import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.gdoj.tags.service.TagsService;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Html2Text;
import com.util.freemarker.MyFreeMarker;

public class MessageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessageService messageService;
	private UserService userService;
	private List<Message> messages;
	
	private List<Message> latestMessages;
	private TagsService tagsService ;
	private TagsviewService tagsviewService ;
	private List<String> tagsList;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public TagsService getTagsService() {
		return tagsService;
	}
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	public TagsviewService getTagsviewService() {
		return tagsviewService;
	}
	public void setTagsviewService(TagsviewService tagsviewService) {
		this.tagsviewService = tagsviewService;
	}
	public List<String> getTagsList() {
		return tagsList;
	}
	public void setTagsList(List<String> tagsList) {
		this.tagsList = tagsList;
	}
	public List<Message> getLatestMessages() {
		return latestMessages;
	}
	public void setLatestMessages(List<Message> latestMessages) {
		this.latestMessages = latestMessages;
	}
	
	private List<Integer> pageList;
	private Integer page=1;	
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	
	
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
	private Integer tagsCount=0;
	

	public Integer getTagsCount() {
		return tagsCount;
	}
	public void setTagsCount(Integer tagsCount) {
		this.tagsCount = tagsCount;
	}
	private List<Message> messagesFollowedBy;
	private List<Integer> latestOrNot;
	private Message messageReplyTo;
	private Message message;
	private Integer messageId;
	private Integer problemId;
	private Integer contestId;
	private Integer moduleId;
	private Integer parentId;
	private Integer rootId;
	private Integer orderNum;
	private String title;
	private String content;
	private String createUser;
	private List<MessageBean> commentsList;
	private Integer comments;
	private MessageBean messagebean;
	
	public MessageBean getMessagebean() {
		return messagebean;
	}
	public void setMessagebean(MessageBean messagebean) {
		this.messagebean = messagebean;
	}
	public List<MessageBean> getCommentsList() {
		return commentsList;
	}
	public void setCommentsList(List<MessageBean> commentsList) {
		this.commentsList = commentsList;
	}

	private int pageSize=10;
	private int maxFloor=5; //限制最高楼层
	
	
	public Integer getComments() {
		return comments;
	}
	public void setComments(Integer comments) {
		this.comments = comments;
	}
	public int getMaxFloor() {
		return maxFloor;
	}
	public void setMaxFloor(int maxFloor) {
		this.maxFloor = maxFloor;
	}

	private List<String> prevUL;  //改为节点后了，命名有误
	private List<String> nodeID;
	

	
	public String execute()throws Exception {
		
		if(pageSize>100){
			pageSize=100;
		}
		intRowCount = messageService.countRootMessages();
		
		pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
		
		//System.out.println(page+" "+pageSize+" "+intRowCount+" "+pageCount);
		
		if (page< 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		List<Message> rootsMessages = new ArrayList<Message>();
		rootsMessages = messageService.queryRootMessages(page,pageSize);
		List<Message> messageList =  new ArrayList<Message>();
		List<Message> messageQueue_ =  new ArrayList<Message>();
	
		
		//需要反过来压栈
		for(Integer ri=rootsMessages.size()-1;ri>=0;--ri){
			messageQueue_.add(rootsMessages.get(ri));
		}
		
		//深度搜索
		while(messageQueue_.size()!=0){
			Integer size_ = messageQueue_.size();
			//System.out.println(messageQueue_.get(size_-1).getTitle());
			messageList.add(messageQueue_.get(size_-1));
			
			List<Message> messageList__ =  new ArrayList<Message>();
			messageList__ = messageService.queryChildMessages(messageQueue_.get(size_-1).getMessage_id());
			messageQueue_.remove(size_-1);
			if(messageList__!=null){
				messageQueue_.addAll(messageList__);
			}
		}
		
		
		messages = messageList;
		
		Integer size = messageList.size();
		Integer a =null;
		Integer b = null;
		Integer nLeftUL = null;
		List<Integer> nodeULPre = new ArrayList<Integer>();  //此节点前有几个UL没有被匹配
		List<String> nodeUL = new ArrayList<String>();  //此节点后应该有几个/UL
		List<String> nodeID_ = new ArrayList<String>(); //此节点ID
		
		
		a = 1;
		b = 0;
		nLeftUL = 0;
		//nodeID_.add(a+"_"+b);
		nodeULPre.add(b);
		
		List<Integer> latestOrNot_ = new ArrayList<Integer>();
		Date nowDate = new Date();	
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dfs.format(nowDate);		
		
		
		commentsList = new ArrayList<MessageBean>();
		for(Integer i=1;i<size;i++){
			
			MessageBean mb_ = new MessageBean();
			mb_.setAuthor(messageList.get(i).getCreate_user());
			mb_.setContent(messageList.get(i).getContent());
			mb_.setIn_date(messageList.get(i).getIn_date());
			mb_.setMessageId(messageList.get(i).getMessage_id());
			mb_.setParentId(messageList.get(i).getParent_id());
			mb_.setRootId(messageList.get(i).getRoot_id());
			mb_.setViews(messageList.get(i).getViews());
			mb_.setVotes(messageList.get(i).getVotes());

			User u = new User();
			u = userService.queryUser(messageList.get(i).getCreate_user());
			if(u!=null){
				mb_.setAvatar(u.getAvatar());
			}				
			commentsList.add(mb_);
			
			if(messageList.get(i).getMessage_id().equals(messageList.get(i).getRoot_id())){
				
				a++;b=0;
				String strUL__ = new String();
				for(int ii=0;ii<nLeftUL;ii++){
					strUL__+="</UL>";
				}
				nodeUL.add(strUL__);
				nodeULPre.add(0);
				nodeID_.add("");
				nLeftUL = 0;
			}else{
				if(messageList.get(i).getParent_id()>messageList.get(i-1).getParent_id()){
					nodeUL.add("");
					nodeID_.add(a+"_"+b);
					b++;
					nLeftUL++;
					
					nodeULPre.add(nLeftUL);	
				}else if(messageList.get(i).getParent_id()<messageList.get(i-1).getParent_id()){
					
					int j=0;
					for(j=i-1;j>=0;j--){
						if(messageList.get(i).getParent_id().equals(messageList.get(j).getParent_id())){
							//System.out.println(nodeULPre.get(i-1)+" | "+nodeULPre.get(j));
							nLeftUL  = nLeftUL -(nodeULPre.get(i-1)-nodeULPre.get(j));
							nodeULPre.add(nLeftUL);
							
							String strUL__ = new String();
							for(int ii=0;ii<nodeULPre.get(i-1)-nodeULPre.get(j);ii++){
								strUL__+="</UL>";
							}
							nodeUL.add(strUL__);		
							nodeID_.add("");
							break;
						}
					}
				}else{
					
					nodeULPre.add(nLeftUL);
					nodeUL.add("");nodeID_.add("");
				}
			}
			//System.out.println("nLeftUL:"+nLeftUL);
		}
		String strUL__ = new String();
		for(int ii=0;ii<nLeftUL;ii++){
			strUL__+="</UL>";
		}
		nodeUL.add(strUL__);
		nodeID_.add("");
		prevUL = nodeUL;
		nodeID = nodeID_; 
		latestOrNot = latestOrNot_;

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

	public String postMessage()throws Exception{
		
		try {
			Message message_ = new Message();
			
			
			createUser = (String)ActionContext.getContext().getSession().get("session_username");
			System.out.println(moduleId+" "+parentId+" "+rootId+" "+createUser);
			  if(null==createUser||"".equals(createUser)){				  		
				  	return LOGIN;
		        }	
			if(null==title||title.trim().length()==0){
				this.addFieldError("title", "Title shouldn't be empty.");
				return INPUT;
			}
			if(null==content||content.trim().length()==0){
				this.addFieldError("content", "Content shouldn't be empty.");
				return INPUT;
			}
			
			message_.setProblem_id(problemId);
			message_.setContest_id(contestId);
			message_.setModule_id(moduleId);
			message_.setParent_id(parentId);
			message_.setRoot_id(rootId);
			message_.setContent(content);
			message_.setTitle(title);
			message_.setCreate_user(createUser);
			Date dt = new Date();
			message_.setIn_date(dt);
			
			message = message_;
			//System.out.println(message_.getModule_id()+" "+ message_.getContent());
			messageService.saveMessage(message);
			
			if(rootId.equals(0)){//是楼主，设置rootID为自己
				message.setRoot_id(message.getMessage_id());
				messageService.saveMessage(message);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String showMessage()throws Exception{
		
		try {
			 Message message_ = messageService.queryMessage(messageId);	
			 
			 if(message_==null||!message_.getRoot_id().equals(message_.getMessage_id())){
				 ActionContext.getContext().put("tip", "No such topic.");
				 return ERROR;
			 }

			 parentId=messageId; //for reply
			 rootId=message_.getRoot_id();//for reply
			 
		
			 message_.setViews(message_.getViews()+1);
			 messageService.saveMessage(message_);				 
			// message = message_;
			
			 
			 
			//tags
				List<Tagsview> tagsviewsList_ = new ArrayList<Tagsview>();
				tagsList = new ArrayList<String>();
				tagsviewsList_ = tagsviewService.queryByMessages(messageId);
				if(tagsviewsList_!=null){
					for (Tagsview t_ : tagsviewsList_) {
						tagsList.add(tagsService.queryTag(
								t_.getTag_id()).getName());
					}
				}
			  
			 
		//	 System.out.println(messageId+" "+message_.getTitle()+" "+ message_.getContent());
			 if(message_.getParent_id()>0){
				 Message messageReplyTo_ = messageService.queryMessage(message_.getParent_id());	
				 if(messageReplyTo_==null){
					 return ERROR;
				 }else {
					 messageReplyTo = messageReplyTo_;
				 }
			 } 
			
			
			
			 List<Message> messageListOri =  new ArrayList<Message>();
			 List<Message> messageList =  new ArrayList<Message>();
			 List<Message> messageQueue_ =  new ArrayList<Message>();
		
			 messageListOri.add(message_);
			 
				messageQueue_.addAll(messageListOri);
				//深度搜索
				while(messageQueue_.size()!=0){
					Integer size_ = messageQueue_.size();
					//System.out.println(messageQueue_.get(size_-1).getTitle());
					messageList.add(messageQueue_.get(size_-1));
					List<Message> messageList__ =  new ArrayList<Message>();
					messageList__ = messageService.queryChildMessages(messageQueue_.get(size_-1).getMessage_id());
					messageQueue_.remove(size_-1);
					if(messageList__!=null){
						messageQueue_.addAll(messageList__);
					}
				}
				
				messageList.remove(0); //删除自己////////////////////////////////////////////////
				
				//messagesFollowedBy = messageList;
				
				
				
				Integer size = messageList.size();
				Integer a =null;
				Integer b = null;
				Integer nLeftUL = null;
				List<Integer> nodeULPre = new ArrayList<Integer>();  //此节点前有几个UL没有被匹配
				List<String> nodeUL = new ArrayList<String>();  //此节点前应该有几个/UL
				List<String> nodeID_ = new ArrayList<String>(); //此节点ID
				
				
				a = 1;
				b = 0;
				nLeftUL = 0;
				nodeULPre.add(b);
				Date nowDate = new Date();	
				SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				dfs.format(nowDate);	
				
				comments = size;
				commentsList = new ArrayList<MessageBean>();
				
				for(Integer i=0;i<size;i++){
					
					MessageBean mb_ = new MessageBean();
					mb_.setAuthor(messageList.get(i).getCreate_user());
					mb_.setContent(messageList.get(i).getContent());
					mb_.setIn_date(messageList.get(i).getIn_date());
					mb_.setMessageId(messageList.get(i).getMessage_id());
					mb_.setParentId(messageList.get(i).getParent_id());
					mb_.setRootId(messageList.get(i).getRoot_id());
					mb_.setViews(messageList.get(i).getViews());
					mb_.setVotes(messageList.get(i).getVotes());

					User u = new User();
					u = userService.queryUser(messageList.get(i).getCreate_user());
					if(u!=null){
						mb_.setAvatar(u.getAvatar());
					}				
					commentsList.add(mb_);
					
					if(i<1){
						continue;
					}
					
					if(messageList.get(i).getMessage_id().equals(messageList.get(i).getRoot_id())){
						
						a++;b=0;
						String strUL__ = new String();
						for(int ii=0;ii<nLeftUL;ii++){
							strUL__+="</UL>";
						}
						nodeUL.add(strUL__);
						nodeULPre.add(0);
						nodeID_.add("");
						nLeftUL = 0;
					}else{
						if(messageList.get(i).getParent_id()>messageList.get(i-1).getParent_id()){
							nodeUL.add("");
							nodeID_.add(a+"_"+b);
							b++;nLeftUL++;
							nodeULPre.add(nLeftUL);	
						}else if(messageList.get(i).getParent_id()<messageList.get(i-1).getParent_id()){
							
							int j=0;
							for(j=i-1;j>=0;j--){
								if(messageList.get(i).getParent_id().equals(messageList.get(j).getParent_id())){
									//System.out.println(nodeULPre.get(i-1)+" | "+nodeULPre.get(j));
									nLeftUL  = nLeftUL -(nodeULPre.get(i-1)-nodeULPre.get(j));
									nodeULPre.add(nLeftUL);
									
									String strUL__ = new String();
									for(int ii=0;ii<nodeULPre.get(i-1)-nodeULPre.get(j);ii++){
										strUL__+="</UL>";
									}
									nodeUL.add(strUL__);		
									nodeID_.add("");
									break;
								}
							}
						}else{
							
							nodeULPre.add(nLeftUL);
							nodeUL.add("");nodeID_.add("");
						}
					}
					
				}
				
				String strUL__ = new String();
				for(int ii=0;ii<nLeftUL;ii++){
					strUL__+="</UL>";
				}
				nodeUL.add(strUL__);
				nodeID_.add("");
				prevUL = nodeUL;
				nodeID = nodeID_; 	 
			
				messagebean = new MessageBean();
				messagebean.setAuthor(message_.getCreate_user());
				messagebean.setComments(comments);
				messagebean.setContent(message_.getContent());
				messagebean.setIn_date(message_.getIn_date());
				messagebean.setMessageId(message_.getMessage_id());
				messagebean.setParentId(message_.getParent_id());
				messagebean.setRootId(message_.getRoot_id());
				messagebean.setTitle(message_.getTitle());
				messagebean.setFriendly_Date(getFriendlyDate(message_.getIn_date()));
				messagebean.setViews(message_.getViews());
				messagebean.setVotes(message_.getVotes());
				
				String bufString = new String();
			 	bufString = Html2Text.RemoveHtml(((message_.getContent().length()>2000)?(message_.getContent()).substring(0, 2000):message_.getContent()));
				
			 	messagebean.setContent_abstract(((bufString.length()>200)?(bufString).substring(0, 200)+"...":bufString));
				
				
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String editMessage()throws Exception{
		
		try {
			
			String username_ = (String) ActionContext.getContext().getSession().get("session_username");
			if (username_ == null) {
				ActionContext.getContext().put("tip", "You must login first.");
				return LOGIN;
			}	
			 Message message_ = messageService.queryMessage(messageId);	
			
			 if(message_==null||!message_.getParent_id().equals(0)){
				 ActionContext.getContext().put("tip", "No such topic.");
				 return ERROR;
			 }
			 if(!message_.getCreate_user().equals(username_)){
				 ActionContext.getContext().put("tip", "You can't edit such topic.");
				return ERROR;
			 }
			 parentId=messageId; //for reply
			 rootId=message_.getRoot_id();//for reply
			 message = message_;
			
			 try {
					List<Tagsview> tagsview_ = new ArrayList<Tagsview>();
					// System.out.println("eeeeeeeeeeee2333e");
					tagsview_ = tagsviewService.queryByMessages(messageId);
					if(tagsview_!=null){
						System.out.println(tagsview_.size());
						tagsList = new ArrayList<String>();
						for (Tagsview t : tagsview_) {
							String tString_ = new String();
							tString_= tagsService.queryTag(t.getTag_id()).getName();
							tagsList.add(tString_);
								
							System.out.println(tagsService.queryTag(t.getTag_id()).getName());
						}
						 tagsCount = tagsList.size();
					}
					
			 } catch (Exception e) {
					// TODO: handle exception
					return ERROR;
				}

		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
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
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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
	public List<String> getPrevUL() {
		return prevUL;
	}

	public void setPrevUL(List<String> prevUL) {
		this.prevUL = prevUL;
	}

	public List<String> getNodeID() {
		return nodeID;
	}

	public void setNodeID(List<String> nodeID) {
		this.nodeID = nodeID;
	}
	public List<Message> getMessagesFollowedBy() {
		return messagesFollowedBy;
	}

	public void setMessagesFollowedBy(List<Message> messagesFollowedBy) {
		this.messagesFollowedBy = messagesFollowedBy;
	}

	public Message getMessageReplyTo() {
		return messageReplyTo;
	}

	public void setMessageReplyTo(Message messageReplyTo) {
		this.messageReplyTo = messageReplyTo;
	}
	public List<Integer> getLatestOrNot() {
		return latestOrNot;
	}

	public void setLatestOrNot(List<Integer> latestOrNot) {
		this.latestOrNot = latestOrNot;
	}
}
