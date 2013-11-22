package com.gdoj.news.service;

import java.util.List;

import com.gdoj.news.vo.News;

public interface NewsService {
	public void save(News news);
	public List<News> queryNews(int from,int pageSize,String sql);
	public News queryNews(String sql);
	public Integer countNews(String sql);
}
