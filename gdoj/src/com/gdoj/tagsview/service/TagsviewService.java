package com.gdoj.tagsview.service;

import java.util.List;

import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.vo.Tagsview;

public interface TagsviewService {
	public void save(Tagsview tagsview);
	public List<Tagsview> queryByProblems(Integer problemId);
	public List<Tagsview> queryByMessages(Integer messageId);
	public Integer counts(String sql);
	public boolean isExistByProblems(Integer tagId,Integer problemId);
	public boolean isExistByMessages(Integer tagId,Integer messageId);
	
	public void removeProblemTag(Integer tagId,Integer problemId);
	public void removeMessageTag(Integer tagId,Integer messageId);
	
	public void removeProblemsTag(Integer problemId);
	public void removeMessagesTag(Integer messageId);
}
