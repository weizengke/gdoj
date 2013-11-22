package com.gdoj.news.service;

import java.util.List;

import com.gdoj.news.dao.NewsDAO;
import com.gdoj.news.vo.News;

public class NewsServiceImpl implements NewsService {

	private NewsDAO newsDao;
	
	public NewsDAO getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDAO newsDao) {
		this.newsDao = newsDao;
	}

	public Integer countNews(String sql) {
		// TODO Auto-generated method stub
		return newsDao.countNews(sql);
	}

	public List<News> queryNews(int from, int pageSize, String sql) {
		// TODO Auto-generated method stub
		return newsDao.queryNews(from, pageSize, sql);
	}

	public News queryNews(String sql) {
		// TODO Auto-generated method stub
		return newsDao.queryNews(sql);
	}

	public void save(News news) {
		// TODO Auto-generated method stub
		newsDao.save(news);
	}

}
