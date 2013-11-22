package com.gdoj.news.vo;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {

	private Integer news_id;
	private String title;
	private String content;
	private Date date;
	private String create_user;
	private Integer orderNum;
	private String defunct;
	
	
	
	public News() {
		// TODO Auto-generated constructor stub
		this.orderNum=0;
		this.date=new Date();
		this.defunct="N";
	}
	public Integer getNews_id() {
		return news_id;
	}
	public void setNews_id(Integer newsId) {
		news_id = newsId;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String createUser) {
		create_user = createUser;
	}

	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	
}
