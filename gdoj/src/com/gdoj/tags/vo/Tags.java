package com.gdoj.tags.vo;

import java.io.Serializable;
import java.util.Date;

public class Tags implements Serializable {

	private Integer tag_id;
	private String name;
	private String create_user;
	private Date indate;
	private String defunct;
	
	public Tags(){
		this.defunct="N";
	}
	
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	public Integer getTag_id() {
		return tag_id;
	}
	public void setTag_id(Integer tagId) {
		tag_id = tagId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String createUser) {
		create_user = createUser;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
}
