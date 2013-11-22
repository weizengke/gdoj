package com.gdoj.contest.action;

import java.util.Date;

import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class ContestAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ContestService contestService;
	private Contest contest;
	private Integer contestId;
	private String start_date;
	private Integer shour;
	private Integer sminute;
	private String end_date;
	private Integer ehour;
	private Integer eminute;
	
	private String start_reg_date;
	private Integer shour_reg;
	private Integer sminute_reg;
	private String end_reg_date;
	private Integer ehour_reg;
	private Integer eminute_reg;


	public String contestAdd()throws Exception {
		try {
			String username = (String)ActionContext.getContext().getSession().get("session_username");
			 if(null==username){			
				  	return LOGIN;
		    }	
			 
				if(contest.getTitle()==null||contest.getTitle().trim().equals("")){
					ActionContext.getContext().put("tip", "Title shouldn't be empty.");
					return "input";
				}
			 
				Date sDate = null;
				sDate = DateUtil.StringToDate(start_date+" "+shour+":"+sminute+":00", "yyyy-MM-dd HH:mm:ss");
				if(sDate==null){
					this.addFieldError("start_date", "start_date is invalid");			
					return INPUT;
				} 
				Date eDate = null;
				eDate = DateUtil.StringToDate(end_date+" "+ehour+":"+eminute+":00", "yyyy-MM-dd HH:mm:ss");
				if(sDate==null){
					this.addFieldError("end_date", "end_date is invalid");
					return INPUT;
				} 
			
				Date sDate_reg = null;
				sDate_reg = DateUtil.StringToDate(start_reg_date+" "+shour_reg+":"+sminute_reg+":00", "yyyy-MM-dd HH:mm:ss");
				if(sDate==null){
					this.addFieldError("start_reg_date", "start_reg_date is invalid");			
					return INPUT;
				} 
				Date eDate_reg = null;
				eDate_reg = DateUtil.StringToDate(end_reg_date+" "+ehour_reg+":"+eminute_reg+":00", "yyyy-MM-dd HH:mm:ss");
				if(sDate==null){
					this.addFieldError("end_reg_date", "end_reg_date is invalid");
					return INPUT;
				} 
				
			if(sDate.after(eDate)){
				this.addFieldError("end_date", "End Time must larger than Stant Time");
				return INPUT;
			}
	
			contest.setCreate_time(new Date());
			contest.setStart_time(sDate);	
			contest.setEnd_time(eDate);
			contest.setStart_reg(sDate_reg);
			contest.setEnd_reg(eDate_reg);
			contest.setCreate_user(username);
			contest.setPassword(contest.getPassword().trim());
			contestService.save(contest);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}

		return SUCCESS;
	}
	public String contestBeforeModify()throws Exception {
		try {
			
			contest = contestService.queryContest(contestId,"ADMIN");
			
			start_date = DateUtil.DateToString(contest.getStart_time(), "yyyy-MM-dd");
			end_date = DateUtil.DateToString(contest.getEnd_time(), "yyyy-MM-dd");
			
			shour = contest.getStart_time().getHours();
			sminute= contest.getStart_time().getMinutes();
			
			ehour=contest.getEnd_time().getHours();
			eminute=contest.getEnd_time().getMinutes();
			
			
			start_reg_date = DateUtil.DateToString(contest.getStart_reg(), "yyyy-MM-dd");
			end_reg_date = DateUtil.DateToString(contest.getEnd_reg(), "yyyy-MM-dd");
			
			shour_reg = contest.getStart_reg().getHours();
			sminute_reg= contest.getStart_reg().getMinutes();
			
			ehour_reg=contest.getEnd_reg().getHours();
			eminute_reg=contest.getEnd_reg().getMinutes();
				
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String contestModify()throws Exception {
		try {	
			Contest contest_ = new Contest();
			contest_ = contestService.queryContest(contest.getContest_id(),"ADMIN");
			if(null==contest_){
				return ERROR;
			}
			if(contest.getTitle()==null||contest.getTitle().trim().equals("")){
				ActionContext.getContext().put("tip", "Title shouldn't be empty.");
				return "input";
			}
			Date sDate = null;
			sDate = DateUtil.StringToDate(start_date+" "+shour+":"+sminute+":00", "yyyy-MM-dd HH:mm:ss");
			if(sDate==null){
				this.addFieldError("start_date", "start_date is invalid");
				
				return INPUT;
			} 
			Date eDate = null;
			eDate = DateUtil.StringToDate(end_date+" "+ehour+":"+eminute+":00", "yyyy-MM-dd HH:mm:ss");
			if(sDate==null){
				this.addFieldError("end_date", "end_date is invalid");
				
				return INPUT;
			} 
			
			Date sDate_reg = null;
			sDate_reg = DateUtil.StringToDate(start_reg_date+" "+shour_reg+":"+sminute_reg+":00", "yyyy-MM-dd HH:mm:ss");
			if(sDate==null){
				this.addFieldError("start_reg_date", "start_reg_date is invalid");			
				return INPUT;
			} 
			Date eDate_reg = null;
			eDate_reg = DateUtil.StringToDate(end_reg_date+" "+ehour_reg+":"+eminute_reg+":00", "yyyy-MM-dd HH:mm:ss");
			if(sDate==null){
				this.addFieldError("end_reg_date", "end_reg_date is invalid");
				return INPUT;
			} 
			
			if(sDate.after(eDate)){
				this.addFieldError("end_date", "End Time must larger than Stant Time");
				return INPUT;
			}

			contest_.setStart_time(sDate);	
			contest_.setEnd_time(eDate);
			contest_.setStart_reg(sDate_reg);
			contest_.setEnd_reg(eDate_reg);
			contest_.setTitle(contest.getTitle());
			contest_.setDescription(contest.getDescription());
			contest_.setType(contest.getType());
			contest_.setPassword(contest.getPassword().trim());
			contestService.save(contest_);			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String delContest()throws Exception {
		try {
			Contest contest_ = new Contest();
			contest_ = contestService.queryContest(contestId, "ADMIN");
			if (null == contest_) {
				return ERROR;
			}
			contest_.setDefunct("Y");
			contestService.save(contest_);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String resumeContest()throws Exception {
		try {
			Contest contest_ = new Contest();
			contest_ = contestService.queryContest(contestId, "ADMIN");
			if (null == contest_) {
				return ERROR;
			}
			contest_.setDefunct("N");
			contestService.save(contest_);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String startDate) {
		start_date = startDate;
	}
	public Integer getShour() {
		return shour;
	}
	public void setShour(Integer shour) {
		this.shour = shour;
	}
	public Integer getSminute() {
		return sminute;
	}
	public void setSminute(Integer sminute) {
		this.sminute = sminute;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String endDate) {
		end_date = endDate;
	}
	public Integer getEhour() {
		return ehour;
	}
	public void setEhour(Integer ehour) {
		this.ehour = ehour;
	}
	public Integer getEminute() {
		return eminute;
	}
	public void setEminute(Integer eminute) {
		this.eminute = eminute;
	}
	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	public Contest getContest() {
		return contest;
	}
	public void setContest(Contest contest) {
		this.contest = contest;
	}
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	public String getStart_reg_date() {
		return start_reg_date;
	}
	public void setStart_reg_date(String startRegDate) {
		start_reg_date = startRegDate;
	}
	public Integer getShour_reg() {
		return shour_reg;
	}
	public void setShour_reg(Integer shourReg) {
		shour_reg = shourReg;
	}
	public Integer getSminute_reg() {
		return sminute_reg;
	}
	public void setSminute_reg(Integer sminuteReg) {
		sminute_reg = sminuteReg;
	}
	public String getEnd_reg_date() {
		return end_reg_date;
	}
	public void setEnd_reg_date(String endRegDate) {
		end_reg_date = endRegDate;
	}
	public Integer getEhour_reg() {
		return ehour_reg;
	}
	public void setEhour_reg(Integer ehourReg) {
		ehour_reg = ehourReg;
	}
	public Integer getEminute_reg() {
		return eminute_reg;
	}
	public void setEminute_reg(Integer eminuteReg) {
		eminute_reg = eminuteReg;
	}
	
	
}
