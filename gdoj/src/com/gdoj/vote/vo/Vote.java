package com.gdoj.vote.vo;

import java.io.Serializable;
import java.util.Date;

public class Vote implements Serializable {
	private Integer vote_id;
	private String username;
	private Integer message_id;
	private Integer vote;
	private Date vote_date;
	

	public Integer getVote_id() {
		return vote_id;
	}
	public void setVote_id(Integer voteId) {
		vote_id = voteId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer messageId) {
		message_id = messageId;
	}
	public Integer getVote() {
		return vote;
	}
	public void setVote(Integer vote) {
		this.vote = vote;
	}
	public Date getVote_date() {
		return vote_date;
	}
	public void setVote_date(Date voteDate) {
		vote_date = voteDate;
	}
	
	
}
