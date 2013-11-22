package com.gdoj.news.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.mail.vo.Mail;
import com.gdoj.news.service.NewsService;
import com.gdoj.news.vo.News;
import com.opensymphony.xwork2.ActionSupport;

public class NewsListAction extends ActionSupport{

	private NewsService newsService;
	private List<News> newsList;
	private List<Integer> pageList;
	private Integer page=1;	
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	private Integer pageSize=50;
	
	
	public String queryNews()throws Exception{
		
		try {
			String sql = new String();
			sql = "select count(n.news_id) from News n where n.defunct='N'";
			if (pageSize > 100) {
				pageSize = 100;
			}
			intRowCount = newsService.countNews(sql);
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			sql = "select n from News n where n.defunct='N' order by n.orderNum DESC, n.news_id DESC";
			newsList = new ArrayList<News>();
			newsList = newsService.queryNews(from, pageSize, sql);
			List<Integer> volume = new ArrayList<Integer>();
			if (pageCount < 7) {
				for (Integer i = 1; i <= pageCount; i++) {
					volume.add(i);
				}
			} else {
				volume.add(1);
				if (page > 4) {
					volume.add(0); //省略号	
				}
				Integer start_i = new Integer(2);
				Integer end_i = new Integer(pageCount - 1);
				if (page - 2 > 2) {
					start_i = page - 2;
				}
				if (page + 2 < pageCount) {
					end_i = page + 2;
				}

				for (Integer i = start_i; i <= end_i; i++) {
					volume.add(i);
				}
				if (page < pageCount - 3) {
					volume.add(0); //省略号
				}
				volume.add(pageCount);
			}
			pageList = volume;
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String queryNews_admin()throws Exception{
		
		String sql = new String();
		if (pageSize > 100) {
			pageSize = 100;
		}
		sql = "select count(n.news_id) from News n order by n.orderNum DESC";
		if (pageSize > 100) {
			pageSize = 100;
		}
		intRowCount = newsService.countNews(sql);
		pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
		
		if (page < 1) {
			page = 1;
		}
		if (page > pageCount) {
			page = pageCount;
		}
		Integer from = (page - 1) * pageSize;
		sql = "select n from News n order by n.news_id DESC";
		newsList = new ArrayList<News>();
		newsList = newsService.queryNews(from, pageSize, sql);
	
		List<Integer> volume = new ArrayList<Integer>();
		if (pageCount < 7) {
			for (Integer i = 1; i <= pageCount; i++) {
				volume.add(i);
			}
		} else {
			volume.add(1);
			if (page > 4) {
				volume.add(0); //省略号	
			}
			Integer start_i = new Integer(2);
			Integer end_i = new Integer(pageCount - 1);
			if (page - 2 > 2) {
				start_i = page - 2;
			}
			if (page + 2 < pageCount) {
				end_i = page + 2;
			}

			for (Integer i = start_i; i <= end_i; i++) {
				volume.add(i);
			}
			if (page < pageCount - 3) {
				volume.add(0); //省略号
			}
			volume.add(pageCount);
		}
		pageList = volume;
		
		return SUCCESS;
	}
	public NewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getIntRowCount() {
		return intRowCount;
	}
	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
