package com.gdoj.tagsview.action;

import java.util.Date;

import com.gdoj.tags.service.TagsService;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.service.TagsviewService;
import com.gdoj.tagsview.vo.Tagsview;
import com.opensymphony.xwork2.ActionSupport;

public class TagsviewAction extends ActionSupport{

	private TagsviewService tagsviewService;
	private TagsService tagsService;
	private Integer problemId;
	private Integer messageId;
	private Integer tagId;
	
	public String saveProblemTags() throws Exception{
		
		try {
			
			if(true==tagsviewService.isExistByProblems(tagId, problemId)){
				this.addFieldError("tip", "This tag has existed.");
				return ERROR;
			}
			
			Tagsview tagsview_ = new Tagsview();
			tagsview_.setTag_id(tagId);
			tagsview_.setProblem_id(problemId);
			tagsviewService.save(tagsview_);
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Save tag error.");
			return ERROR;
		}
		return SUCCESS;
	}
	public String saveMessageTags() throws Exception{
		
		try {
			if(true==tagsviewService.isExistByMessages(tagId, messageId)){
				this.addFieldError("tip", "This tag has existed.");
				return ERROR;
			}
			Tagsview tagsview_ = new Tagsview();
			tagsview_.setTag_id(tagId);
			tagsview_.setMessage_id(messageId);
			tagsviewService.save(tagsview_);
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Save tag error.");
			return ERROR;
		}
		return SUCCESS;
	}
	public TagsviewService getTagsviewService() {
		return tagsviewService;
	}
	public void setTagsviewService(TagsviewService tagsviewService) {
		this.tagsviewService = tagsviewService;
	}
	public TagsService getTagsService() {
		return tagsService;
	}
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getTagId() {
		return tagId;
	}
	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}
	
}
