package com.gdoj.common.action;


import java.util.ArrayList;
import java.util.List;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ContestSubmitAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;

	private ContestService contestService;
	private CProblemService cproblemService;
	private String numId;
	private Integer contestId;
	private List<CProblem> problemList;
	private Integer language;
	private UserService userService; 
	
	
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getNumId() {
		return numId;
	}
	public void setNumId(String numId) {
		this.numId = numId;
	}
	public List<CProblem> getProblemList() {
		return problemList;
	}
	public void setProblemList(List<CProblem> problemList) {
		this.problemList = problemList;
	}
	public CProblemService getCproblemService() {
		return cproblemService;
	}
	public void setCproblemService(CProblemService cproblemService) {
		this.cproblemService = cproblemService;
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
	public String execute()throws Exception {
		
		try {
			if (null == contestService.queryContest(contestId,"USER")) {
				ActionContext.getContext().put("tip", "No such contest.");
				return ERROR;
			}
			if(null==cproblemService.queryProblemByNum(numId, contestId)){
				ActionContext.getContext().put("tip", "No such problem.");
				return ERROR;
			}
			String username = (String) ActionContext.getContext().getSession()
			.get("session_username");
			if (null == username || "".equals(username)) {
				return LOGIN;
			}
			User user_ = userService.queryUser(username);
			language = user_.getLanguage();
			
			List<CProblem> problemList_ = new ArrayList<CProblem>();
			problemList_ = cproblemService.queryProblems(contestId);
			
			problemList = problemList_;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("tip", "Unknown Error.");
			return ERROR;
		}
		return SUCCESS;	
	}
}
