package com.gdoj.news.dao;

import java.util.List;

import com.gdoj.news.vo.News;

public interface NewsDAO {
	public void save(News news);
	public List<News> queryNews(int from,int pageSize,String sql);
	public News queryNews(String sql);
	public Integer countNews(String sql);

}
