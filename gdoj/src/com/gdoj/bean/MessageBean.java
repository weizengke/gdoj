package com.gdoj.bean;

import java.util.Date;

public class MessageBean {
	private Integer messageId;
	private Integer problemId;
	private Integer contestId;
	private Integer moduleId;
	private Integer parentId;
	private Integer rootId;
	private Integer votes;
	private Integer views;
	private Integer orderNum;
	private String title;
	private String content;
	private String defunct;
	private Date in_date;
	private String author;
	
	private String avatar;
	
	private Integer comments;
	private Integer lastReplyId;
	private String content_abstract;
	private String friendly_Date;
	private String lastReplyUser;
	private Date lastReplyDate;
	private String lastReplyFriendlyDate;
	
	
	
	public MessageBean() {
		this.problemId=0;
		this.contestId=0;
		this.parentId = 0;
		this.rootId = 0;
		this.votes=0;
		this.views=0;
		this.orderNum = 0;
		this.defunct="N";
		this.avatar = "N";
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Integer getLastReplyId() {
		return lastReplyId;
	}
	public void setLastReplyId(Integer lastReplyId) {
		this.lastReplyId = lastReplyId;
	}
	public String getLastReplyUser() {
		return lastReplyUser;
	}
	public void setLastReplyUser(String lastReplyUser) {
		this.lastReplyUser = lastReplyUser;
	}
	
	public Date getLastReplyDate() {
		return lastReplyDate;
	}
	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}
	public String getLastReplyFriendlyDate() {
		return lastReplyFriendlyDate;
	}
	public void setLastReplyFriendlyDate(String lastReplyFriendlyDate) {
		this.lastReplyFriendlyDate = lastReplyFriendlyDate;
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
	public Integer getVotes() {
		return votes;
	}
	public void setVotes(Integer votes) {
		this.votes = votes;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
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
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date inDate) {
		in_date = inDate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent_abstract() {
		return content_abstract;
	}
	public void setContent_abstract(String contentAbstract) {
		content_abstract = contentAbstract;
	}
	public String getFriendly_Date() {
		return friendly_Date;
	}
	public void setFriendly_Date(String friendlyDate) {
		friendly_Date = friendlyDate;
	}
	public Integer getComments() {
		return comments;
	}
	public void setComments(Integer comments) {
		this.comments = comments;
	}

}
