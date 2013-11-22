package com.gdoj.message.vo;

import java.util.Date;

public class Message implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1622014827001457547L;
	private Integer message_id;
	private Integer problem_id;
	private Integer contest_id;
	private Integer module_id;
	private Integer parent_id;
	private Integer root_id;
	private Integer votes;
	private Integer views;
	private Integer orderNum;
	private String title;
	private String content;
	private String defunct;
	private Date in_date;
	private String create_user;
	
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getVotes() {
		return votes;
	}
	public void setVotes(Integer votes) {
		this.votes = votes;
	}
	public Message() {
		this.problem_id=0;
		this.contest_id=0;
		this.parent_id = 0;
		this.root_id = 0;
		this.votes=0;
		this.views=0;
		this.orderNum = 0;
		this.defunct="N";
		// TODO Auto-generated constructor stub
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date inDate) {
		in_date = inDate;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parentId) {
		parent_id = parentId;
	}
	public Integer getRoot_id() {
		return root_id;
	}
	public void setRoot_id(Integer rootId) {
		root_id = rootId;
	}
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer messageId) {
		message_id = messageId;
	}
	public Integer getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(Integer problemId) {
		problem_id = problemId;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setContest_id(Integer contestId) {
		contest_id = contestId;
	}
	public Integer getModule_id() {
		return module_id;
	}
	public void setModule_id(Integer moduleId) {
		module_id = moduleId;
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
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String createUser) {
		create_user = createUser;
	}
}
