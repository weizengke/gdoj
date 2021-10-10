package com.gdoj.rating.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.rating.service.RatingService;
import com.gdoj.rating.vo.Rating;
import com.opensymphony.xwork2.ActionSupport;

public class RatingAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RatingService ratingService;
	private List<Rating> ratingList;
	private String username;
	private AttendService attendService;
	private ContestService contestService;

	public Integer getRateByRating(Integer rating) {
		if (rating < 1200 && rating > 0) {			
			return 1;
		}
		if (rating < 1400) {
			return 2;			
		}
		if (rating < 1600) {
			return 3;			
		}
		if (rating < 1750) {
			return 4;			
		}
		if (rating < 1900) {
			return 5;			
		}
		if (rating < 2050) {
			return 6;			
		}
		if (rating < 2200) {
			return 7;			
		}
		if (rating < 2600) {
			return 8;			
		}
		if (rating < 3000) {
			return 9;			
		}
		if (rating >= 3000) {
			return 10;			
		}
		return 0;
	}	
	public String queryUserRatingList() throws Exception{
		try {
			if (null == username) {
				return SUCCESS;
			}
			
			ratingList = new ArrayList<Rating>();
			List<Attend> attendList = new ArrayList<Attend>();
			attendList = attendService.getUserAttends(username);
			if (attendList!=null){
				for(Attend attend:attendList){
					/* get contest name */
					Contest contest = contestService.queryContest(attend.getContest_id(), "USER");
					if (contest != null) {
						/* get rating info */
						Rating rating_ = ratingService.queryUserContestRating(attend.getContest_id(), username);					
						if (rating_ != null) {
							rating_.setContest_name(contest.getTitle());
							rating_.setRate(getRateByRating(rating_.getRating()));
							rating_.setRating_title(getText("user_rate" + rating_.getRate()));
							ratingList.add(rating_);
						}
					}
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
			
		return SUCCESS;
	}
	  
	public RatingService getRatingService() {
		return ratingService;
	}
	
	public void setRatingService(RatingService ratingService) {
		this.ratingService = ratingService;
	}

	public void setRatingList(List<Rating> ratingList) {
		this.ratingList = ratingList;
	}

	public List<Rating> getRatingList() {
		return ratingList;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	
	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}
  
	public AttendService getAttendService() {
		return attendService;
	}
}
