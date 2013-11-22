package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemShowAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Problem problem;
	private Integer problemId=1000;	
	private ProblemService problemService;


	public String problemShow()throws Exception {
		try {
			problem = problemService.queryProblem(problemId);
		
			if(null==problem){
				ActionContext.getContext().put("tip", "No such problem.");
				return ERROR;
			}	

		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		
		
		return SUCCESS;
	}
	
	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public Integer getProblemId() {
		return problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	
	
	
}
