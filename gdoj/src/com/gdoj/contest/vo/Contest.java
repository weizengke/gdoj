package com.gdoj.contest.vo;

import java.io.Serializable;
import java.util.Date;

public class Contest implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer contest_id;
	private String title;
	private String description;
	private Date start_time;
	private Date end_time;
	private Date start_reg;
	private Date end_reg;
	private Date create_time;
	private String password;
	private String create_user;
	private String defunct;
	private Integer type;
	
	public Contest() {
		this.defunct = "Y";
		this.type=0;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Date getStart_reg() {
		return start_reg;
	}
	public void setStart_reg(Date startReg) {
		start_reg = startReg;
	}
	public Date getEnd_reg() {
		return end_reg;
	}
	public void setEnd_reg(Date endReg) {
		end_reg = endReg;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date createTime) {
		create_time = createTime;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setContest_id(Integer contestId) {
		contest_id = contestId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date startTime) {
		start_time = startTime;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date endTime) {
		end_time = endTime;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String createUser) {
		create_user = createUser;
	}
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	
}
