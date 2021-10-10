package com.gdoj.rating.dao;

import java.util.List;

import com.gdoj.rating.vo.Rating;

public interface RatingDAO {
	public List<Rating> query(String sql);
	public Rating queryUserContestRating(Integer contestId, String username);
}
