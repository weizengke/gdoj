package com.gdoj.contest.attend.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterContestAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AttendService attendService;
	private ContestService contestService;
	private Integer contestId=0;
	private String username;
	private boolean success;
	private String error;
	
	public String registerToContest() throws Exception{
		try {
			username = (String) ActionContext.getContext().getSession().get(
					"session_username");
			if (null == username) {
				success = false;
				error = "You must login first.";
				return SUCCESS;
			}
			Contest contest_ =new Contest();
			contest_ = contestService.queryContest(contestId,"USER");
			if (null == contest_) {
				//No such contest;
				success = false;
				error = "No such contest.";
				return SUCCESS;
			}
		
			if (null != attendService.queryUserAttend(contestId, username)) {
				success = false;
				error = "You have registered to this contest.";
				return SUCCESS;
			}
			
			//×¢²áÊ±¼ä
			Date nowDate=new Date(); 
			
			if(nowDate.getTime()<contest_.getStart_reg().getTime()){
				success = false;
				error = "Registration hasn't started.";
				return SUCCESS;
			}
			
			if(nowDate.getTime()>contest_.getEnd_reg().getTime()){
				success = false;
				error = "You missed the registration time.";
				return SUCCESS;
			}
		
			Attend attend_ = new Attend();
			attend_.setUsername(username);
			attend_.setContest_id(contestId);
			
			attendService.save(attend_);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error = "Unknown Error.";
			return SUCCESS;
		}
		success = true;
		return SUCCESS;
	}
	@JSON(deserialize=false,serialize=false)   
	public ContestService getContestService() {
		return contestService;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	@JSON(deserialize=false,serialize=false)   
	public AttendService getAttendService() {
		return attendService;
	}

	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}

	public Integer getContestId() {
		return contestId;
	}

	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
}
