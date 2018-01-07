package com.gdoj.common.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gdoj.message.service.MessageService;
import com.gdoj.message.vo.Message;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3552864426020089250L;
	private UserService userService; 
	private MessageService messageService;
	private ProblemService problemService;
	private String type="all";
	private String word;
	private Integer size=0;
	
	
	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	private List<Problem> problemList;
	private List<Message> messageList;
	private List<User> userList;
	

	public String search()throws Exception {
		
		try {
			if (word == null || word.trim().length() == 0) {
				this.addFieldError("word", "Input the keyword!");
				return INPUT;
			}
			String word_ = word;
			
			word = new String(word_.getBytes("ISO-8859-1"), "UTF8");
			//System.out.println(word+" "+word_);	
			
			userList = new ArrayList<User>();
			problemList = new ArrayList<Problem>();
			messageList = new ArrayList<Message>();
			String sql = new String();
			
			if(type.equals("user")){
				//user
				sql = "from User u where u.username like ? or u.nickname like ? or u.school like ? order by u.username ASC";
				userList = userService.query(sql,word);
			}else if(type.equals("problem")){
				//problem
				sql = "from Problem p where p.problem_id like ? or p.title like ? or p.tag like ? order by p.problem_id ASC";
				problemList = problemService.query(sql,word);
			}else if(type.equals("topic")){
				//topic
				sql = "from Message m where m.message_id=m.root_id and m.title like ? order by m.message_id DESC";
				messageList = messageService.query(sql,word);
			}else{
				//user
				sql = "from User u where u.username like ? or u.nickname like ? or u.school like ? order by u.username ASC";
				userList = userService.query(sql,word);
				//problem
				sql = "from Problem p where p.problem_id like ? or p.title like ? or p.tag like ? order by p.problem_id ASC";
				problemList = problemService.query(sql,word);
				//topic
				sql = "from Message m where m.message_id=m.root_id and m.title like ? order by m.message_id DESC";
				messageList = messageService.query(sql,word);
				type="all";
			}
			size = userList.size()+problemList.size()+messageList.size();
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Search Error!");
			return ERROR;
		}
		return SUCCESS;
	}
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public ProblemService getProblemService() {
		return problemService;
	}
	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	

	public List<Problem> getProblemList() {
		return problemList;
	}

	public void setProblemList(List<Problem> problemList) {
		this.problemList = problemList;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	
}
