package com.gdoj.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class OnlineUserBean {
	private String username;
	private Date loginDate;
	private Date lastAccessTime; /* �û����һ��pingʱ�� */
	private Integer statusFlag; /* ����(1) or ����(0) */
	private Integer level;
	private String levelTitle;
	
	public Integer getStatusFlag() {
		return statusFlag;
	}
	public void setStatusFlag(Integer statusFlag) {
		this.statusFlag = statusFlag;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	
	@JSON(format="yyyy-MM-dd HH:mm:ss")
	public Date getLastAccessTime() {
		return lastAccessTime;
	}
	public void setLastAccessTime(Date lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}
	
	public OnlineUserBean() {
		super();
		this.loginDate = new Date();
		this.lastAccessTime = new Date();
		this.statusFlag = 1;
	}
	
	public OnlineUserBean(String username, Date loginDate, Date lastAccessTime) {
		super();
		this.username = username;
		this.loginDate = loginDate;
		this.lastAccessTime = lastAccessTime;
		this.statusFlag = 1;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevelTitle(String levelTitle) {
		this.levelTitle = levelTitle;
	}
	public String getLevelTitle() {
		return levelTitle;
	}
	
}
