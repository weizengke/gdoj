package com.gdoj.user.vo;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class User implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 397966021164257048L;
	private Integer id;
	private String username;
	private String password;
	private String nickname;
	private String email;
	private String school;
	private String motto;
	private String defunct;
	private String ip;
	private String opensource;
	private Date birthday;
	private Date regdate;
	private Date lastlogin;
	private Date lastaccesstime;
	private Integer language;
	private Integer solved;
	private Integer submit;
	private Integer rating;
	private String avatar;
	private Integer rate;

	public User() {
		this.avatar = "N";
		this.defunct = "N";
		this.opensource = "Y";
		this.language = 1;
		this.solved = 0;
		this.submit = 0;
		this.rating = 0;
		this.rate = 0;
	}
	@JSON(deserialize=false,serialize=false)
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	@JSON(deserialize=false,serialize=false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@JSON(deserialize=false,serialize=false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@JSON(deserialize=false,serialize=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	@JSON(deserialize=false,serialize=false)
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
	@JSON(deserialize=false,serialize=false)
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOpensource() {
		return opensource;
	}
	public void setOpensource(String opensource) {
		this.opensource = opensource;
	}
	@JSON(deserialize=false,serialize=false)
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public Integer getSolved() {
		return solved;
	}
	public void setSolved(Integer solved) {
		this.solved = solved;
	}
	public Integer getSubmit() {
		return submit;
	}
	public void setSubmit(Integer submit) {
		this.submit = submit;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	public Date getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}

	public Date getLastaccesstime() {
		return lastaccesstime;
	}

	public void setLastaccesstime(Date lastaccesstime) {
		this.lastaccesstime = lastaccesstime;
	}

	public void setRate(Integer rate) {
		this.rate = rate;
	}

	public Integer getRate() {
		return rate;
	}

}
