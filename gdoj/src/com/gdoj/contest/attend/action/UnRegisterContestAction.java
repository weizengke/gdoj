package com.gdoj.contest.attend.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class UnRegisterContestAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AttendService attendService;
	private ContestService contestService;
	private Integer contestId=0;
	private Contest contest;


	public String UnRegisterContest() throws Exception{
		
		try {
			String username = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (null == username) {
				return LOGIN;
			}
			Contest contest_ = new Contest();
			contest_ = contestService.queryContest(contestId,"USER");
			if (null == contest_) {
				this.addFieldError("tip", "No such contest.");
				return ERROR;
			}
			
			if(contest_.getStart_time().before(new Date())){
				this.addFieldError("tip", "The contest has been start.");
				return ERROR;
			}
			
			Attend attend_ = new Attend();
			attend_ = attendService.queryUserAttend(contestId, username);
			if(attend_==null){
				return ERROR;
			}
			attendService.delete(attend_);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public Contest getContest() {
		return contest;
	}
	public void setContest(Contest contest) {
		this.contest = contest;
	}
	public AttendService getAttendService() {
		return attendService;
	}

	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}

	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}

	public Integer getContestId() {
		return contestId;
	}


	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}

}
