package com.gdoj.tags.action;


import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.tags.service.TagsService;
import com.opensymphony.xwork2.ActionSupport;

public class JsonTagsListAction extends ActionSupport{

	private TagsService tagsService;
	private List<String> tags;
	private String q;
 
	public String queryTags() throws Exception{
		
		String q_ = new String();
		tags = new ArrayList<String>();
		if(q!=null){
			q_ = q;
		}else{
			return SUCCESS;
		}
		String sql = "select t.name from Tags t where t.name like ? and t.defunct='N' order by t.name ASC";
		//System.out.println(q_); 
		tags = tagsService.queryAllTagsName(sql, q_,10);
		//System.out.println(tags.size()); 
		return SUCCESS;
	}
	
	@JSON(deserialize=false,serialize=false)   
	public TagsService getTagsService() {
		return tagsService;
	}
	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	
	
}
