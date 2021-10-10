package com.gdoj.rating.service;

import java.util.List;
import com.gdoj.rating.vo.Rating;

public interface RatingService {
	public List<Rating> query(String sql);
	public Rating queryUserContestRating(Integer contestId, String username);
}
