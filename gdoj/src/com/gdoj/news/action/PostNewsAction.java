package com.gdoj.news.action;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.news.service.NewsService;
import com.gdoj.news.vo.News;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PostNewsAction extends ActionSupport{
	
	private NewsService newsService;
	private Integer newsId;
	private String title;
	private String content;
	private Integer orderNum=0;
	private String defunct="N";
	private boolean success;
	private String error;
	private String type="new";
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String saveNews() throws Exception{
		
		try {
			//System.out.println("News................");
			News news_ = new News();
			String username = new String();
			username = (String) ActionContext.getContext().getSession().get(
					"session_username");
			if (username == null) {
				success = false; error="You must login first.";
				return SUCCESS;
			}
			if(title==null||title.trim().length()==0){
				success = false; error="Title should not be null.";
				return SUCCESS;
			}
			if(content==null||content.trim().length()==0){
				success = false; error="Content should not be null.";
				return SUCCESS;
			}
			
			
			
			Date dt_prevSubmit = (Date)ActionContext.getContext().getSession().get("session_submit");
			Date dt = new Date(); 
			
			if(dt_prevSubmit!=null){
				//System.out.println(dt.getTime()-dt_prevSubmit.getTime());
				if(dt.getTime()-dt_prevSubmit.getTime()<30000){  //限制30s一次提交
					System.out.println(username+" submit-news twice at 30 second.");
				//	this.addFieldError("tip", "");
					success = true;
					return SUCCESS;
				}
			}
			ActionContext.getContext().getSession().put("session_submit", dt);
			
			if("new".equals(type)){ //新建
				news_.setTitle(title);
				news_.setContent(content);
				news_.setCreate_user(username);
				news_.setOrderNum(orderNum);
				news_.setDefunct(defunct);
				newsService.save(news_);
			}else{  //修改
				String sql = "select n from News n where n.news_id="+newsId;
				news_ = newsService.queryNews(sql);
				if(news_==null){
					success = false; error="Post news fail.";
					return SUCCESS;
				}
				news_.setTitle(title);
				news_.setContent(content);
				news_.setOrderNum(orderNum);
				news_.setDefunct(defunct);
				newsService.save(news_);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			success = false; error="Post news fail.";
			return SUCCESS;
		}
		success = true;
		return SUCCESS;
	}
	
	@JSON(deserialize=false,serialize=false)  
	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
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
