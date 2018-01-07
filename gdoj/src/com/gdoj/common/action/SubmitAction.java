package com.gdoj.common.action;


import java.util.HashMap;
import java.util.Map;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;

public class SubmitAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	
	private Integer problemId;
	private Integer language;
	private Problem problem;
	private UserService userService; 
	private ProblemService problemService;
	private Map<String,String> languageMap;
	private String vjudge_name;
	
	public Map<String, String> getLanguageMap() {
		return languageMap;
	}
	public void setLanguageMap(Map<String, String> languageMap) {
		this.languageMap = languageMap;
	}
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public void setProblem(Problem problem) {
		this.problem = problem;
	}
	public Problem getProblem() {
		return problem;
	}
	public ProblemService getProblemService() {
		return problemService;
	}
	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public void setVjudge_name(String vjudge_name) {
		this.vjudge_name = vjudge_name;
	}
	public String getVjudge_name() {
		return vjudge_name;
	}
	public String execute()throws Exception {
		try {
			String username = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (null == username || "".equals(username)) {
				return LOGIN;
			}
			
			problem = problemService.queryProblem(problemId);
			if(null == problem){
				ActionContext.getContext().put("tip", "No such problem.");
				System.out.println("not find problem.");
				return ERROR;
			}

			User user_ = userService.queryUser(username);
			language = user_.getLanguage();
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;	
		}
		return SUCCESS;	
	}
}
