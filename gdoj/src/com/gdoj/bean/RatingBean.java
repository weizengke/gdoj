package com.gdoj.bean;

import java.util.Date;

public class RatingBean {
	private String username;
	private Integer contest_id;
	private Integer delta;
	private Integer rating;	
	private Date rating_date;
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public void setContest_id(Integer contest_id) {
		this.contest_id = contest_id;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setDelta(Integer delta) {
		this.delta = delta;
	}
	public Integer getDelta() {
		return delta;
	}
	public void setRating_date(Date rating_date) {
		this.rating_date = rating_date;
	}
	public Date getRating_date() {
		return rating_date;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Integer getRating() {
		return rating;
	}
	
	
}
