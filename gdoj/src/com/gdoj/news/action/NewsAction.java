package com.gdoj.news.action;

import com.gdoj.contest.vo.Contest;
import com.gdoj.news.service.NewsService;
import com.gdoj.news.vo.News;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport{
	
	private NewsService newsService;
	private News news;
	private Integer newsId;
	private String title;
	private String content;
	private Integer orderNum;
	private String defunct;

	public String showNews() throws Exception{
		news = new News();
		String sql = "select n from News n where n.defunct='N' and n.news_id="+newsId;
		news = newsService.queryNews(sql);
		if(news==null){
			return ERROR;
		}
		return SUCCESS;
	}
	public String showNews_admin() throws Exception{
		news = new News();
		String sql = "select n from News n where n.news_id="+newsId;
		news = newsService.queryNews(sql);
		if(news==null){
			return ERROR;
		}
		return SUCCESS;
	}
	public String saveNews() throws Exception{
		
		try {
			News news_ = new News();
			String username = new String();
			username = (String) ActionContext.getContext().getSession().get(
					"session_username");
			if (username == null) {
				return "login";
			}
			news_.setTitle(title);
			news_.setContent(content);
			news_.setCreate_user(username);
			news_.setOrderNum(orderNum);
			news_.setDefunct(defunct);
			newsService.save(news_);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String beforeModifyNews() throws Exception{
		try {
			String username = new String();
			username = (String) ActionContext.getContext().getSession().get(
					"session_username");
			if (username == null) {
				return "login";
			}
			String sql = "select n from News n where n.news_id=" + newsId;
			news = newsService.queryNews(sql);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}

	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
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
