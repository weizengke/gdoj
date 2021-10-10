package com.gdoj.rating.service;

import java.util.List;

import com.gdoj.rating.dao.RatingDAO;
import com.gdoj.rating.vo.Rating;

public class RatingServiceImpl implements RatingService {
	private RatingDAO ratingDao;

	public RatingDAO getRatingDAO() {
		return ratingDao;
	}
	public void setRatingDao(RatingDAO ratingDao) {
		this.ratingDao = ratingDao;
	}
	
	public List<Rating> query(String sql) {
		// TODO Auto-generated method stub
		return ratingDao.query(sql);
	}	
	
	public Rating queryUserContestRating(Integer contestId, String username) {
		return ratingDao.queryUserContestRating(contestId, username);
	}
}
