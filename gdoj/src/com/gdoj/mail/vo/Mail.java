package com.gdoj.mail.vo;

import java.io.Serializable;
import java.util.Date;

public class Mail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer mail_id;
	private String title;
	private String content;
	private String from_user;
	private String to_user;
	private Integer isnew;
	private Integer reply;
	private Date create_date;
	private String defunct;
	
	public Mail() {
		super();
		this.isnew=1;
		this.create_date=new Date();
		this.defunct="N";
	}
	public Integer getMail_id() {
		return mail_id;
	}
	public void setMail_id(Integer mailId) {
		mail_id = mailId;
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
	public String getFrom_user() {
		return from_user;
	}
	public void setFrom_user(String fromUser) {
		from_user = fromUser;
	}
	public String getTo_user() {
		return to_user;
	}
	public void setTo_user(String toUser) {
		to_user = toUser;
	}
	public Integer getIsnew() {
		return isnew;
	}
	public void setIsnew(Integer isnew) {
		this.isnew = isnew;
	}
	public Integer getReply() {
		return reply;
	}
	public void setReply(Integer reply) {
		this.reply = reply;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date createDate) {
		create_date = createDate;
	}
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	
	
}
