package com.gdoj.tagsview.vo;

import java.io.Serializable;

public class Tagsview implements Serializable {
	private Integer id;
	private Integer tag_id;
	private Integer problem_id;
	private Integer message_id;
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTag_id() {
		return tag_id;
	}
	public void setTag_id(Integer tagId) {
		tag_id = tagId;
	}
	public Integer getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(Integer problemId) {
		problem_id = problemId;
	}
	public Integer getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Integer messageId) {
		message_id = messageId;
	}
	
}
