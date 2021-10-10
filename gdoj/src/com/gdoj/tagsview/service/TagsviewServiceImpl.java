package com.gdoj.tagsview.service;

import java.util.List;

import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.dao.TagsviewDAO;
import com.gdoj.tagsview.vo.Tagsview;

public class TagsviewServiceImpl implements TagsviewService {

	private TagsviewDAO tagsviewDao;	
	
	public TagsviewDAO getTagsviewDao() {
		return tagsviewDao;
	}

	public void setTagsviewDao(TagsviewDAO tagsviewDao) {
		this.tagsviewDao = tagsviewDao;
	}

	public Integer counts(String sql) {
		// TODO Auto-generated method stub
		return tagsviewDao.counts(sql);
	}

	public Integer getTagsCountbyId(Integer tagId){
		// TODO Auto-generated method stub
		return tagsviewDao.getTagsCountbyId(tagId);
	}
	
	public boolean isExistByMessages(Integer tagId, Integer messageId) {
		// TODO Auto-generated method stub
		return tagsviewDao.isExistByMessages(tagId, messageId);
	}

	public boolean isExistByProblems(Integer tagId, Integer problemId) {
		// TODO Auto-generated method stub
		return tagsviewDao.isExistByProblems(tagId, problemId);
	}

	public List<Tagsview> queryByMessages(Integer messageId) {
		// TODO Auto-generated method stub
		return tagsviewDao.queryByMessages(messageId);
	}

	public List<Tagsview> queryByProblems(Integer problemId) {
		// TODO Auto-generated method stub
		return tagsviewDao.queryByProblems(problemId);
	}

	public void save(Tagsview tagsview) {
		// TODO Auto-generated method stub
		tagsviewDao.save(tagsview);
	}
	public void removeProblemTag(Integer tagId,Integer problemId){
		tagsviewDao.removeProblemTag(tagId, problemId);
	}
	public void removeMessageTag(Integer tagId,Integer messageId){
		tagsviewDao.removeMessageTag(tagId, messageId);
	}
	
	public void removeProblemsTag(Integer problemId){
		tagsviewDao.removeProblemsTag(problemId);
	}
	public void removeMessagesTag(Integer messageId){
		tagsviewDao.removeMessagesTag(messageId);
	}
}
