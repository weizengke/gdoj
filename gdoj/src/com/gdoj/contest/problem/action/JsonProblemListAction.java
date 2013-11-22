package com.gdoj.contest.problem.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.opensymphony.xwork2.ActionSupport;

public class JsonProblemListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ContestService contestService;
	private CProblemService cproblemService;
	private Integer contestId=0;
	private List<String> cproblemNum;
	private List<String> cproblemTitle;
	private boolean success;
	private String error;
	

	public String jsonProblems()throws Exception {
		try {
			if(null==contestService.queryContest(contestId,"USER")){
				success = false;
				error="No such contest.";
				return SUCCESS;
			}
			
			List<CProblem> problemList_ = new ArrayList<CProblem>();
			List<String> cproblemNum_ = new ArrayList<String>();
			List<String> cproblemTitle_ = new ArrayList<String>();
			problemList_ = cproblemService.queryProblems(contestId);
			for(CProblem p:problemList_){
				cproblemNum_.add(p.getNum());
				cproblemTitle_.add(p.getTitle());
			}
			cproblemNum = cproblemNum_;
			cproblemTitle = cproblemTitle_;
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error="Unknown Error.";
			return SUCCESS;
		}
		success = true;
		
		return SUCCESS;
	}

	@JSON(deserialize=false,serialize=false)   
	public CProblemService getCproblemService() {
		return cproblemService;
	}
	public void setCproblemService(CProblemService cproblemService) {
		this.cproblemService = cproblemService;
	}
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	@JSON(deserialize=false,serialize=false)  
	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}


	public List<String> getCproblemNum() {
		return cproblemNum;
	}


	public void setCproblemNum(List<String> cproblemNum) {
		this.cproblemNum = cproblemNum;
	}


	public List<String> getCproblemTitle() {
		return cproblemTitle;
	}


	public void setCproblemTitle(List<String> cproblemTitle) {
		this.cproblemTitle = cproblemTitle;
	}


	public boolean isSuccess() {
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
