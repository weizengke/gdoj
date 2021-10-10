package com.gdoj.rating.vo;

import java.io.Serializable;
import java.util.Date;

public class Rating implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String username;
	private Integer contest_id;
	private Integer rank;
	private Integer delta;
	private Integer rating;
	private Date rating_date;
	private Integer rate;
	private String contest_name;
	private String rating_title;
	private String nickname;
	
	public Rating() {
		this.rate = 0;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
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
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public Integer getRank() {
		return rank;
	}
	public void setDelta(Integer delta) {
		this.delta = delta;
	}
	public Integer getDelta() {
		return delta;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating_date(Date rating_date) {
		this.rating_date = rating_date;
	}
	public Date getRating_date() {
		return rating_date;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public Integer getRate() {
		return rate;
	}

	public void setContest_name(String contest_name) {
		this.contest_name = contest_name;
	}

	public String getContest_name() {
		return contest_name;
	}

	public void setRating_title(String rating_title) {
		this.rating_title = rating_title;
	}

	public String getRating_title() {
		return rating_title;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname() {
		return nickname;
	}
	
}
