package com.gdoj.tags.service;

import java.util.List;

import com.gdoj.tags.vo.Tags;

public interface TagsService {
	public void save(Tags tags);
	public List<Tags> query(String sql);
	public List<Tags> query(String sql,String keyword);
	public List<Tags> queryTags(Integer from,Integer pageSize,String order);
	public Integer counts(String sql);
	public Tags queryTag(Integer tagId);
	public Tags queryTag(String tagName);
	public List<String> queryAllTagsName(String sql,String keyword,Integer pageSize);
}
