package com.gdoj.problem.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.bean.ProblemInfoBean;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.opensymphony.xwork2.ActionSupport;

public class JsonProblemListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<ProblemInfoBean> problems;
	private boolean success;
	private String error;
	private String searchString;	
	private ProblemService problemService;


	

	public List<ProblemInfoBean> getProblems() {
		return problems;
	}
	public void setProblems(List<ProblemInfoBean> problems) {
		this.problems = problems;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public String problemSet()throws Exception {
		try {
			problems = new ArrayList<ProblemInfoBean>();
			List<Problem> problemList_ = new ArrayList<Problem>();		 
			
			problemList_ = problemService.searchProblem(10,searchString);
			
			for(Problem p:problemList_){
				ProblemInfoBean p_ = new ProblemInfoBean();
				p_.setProblemId(p.getProblem_id());
				p_.setTitle(p.getTitle());
		//		System.out.println(p.getProblem_id());
		//problemMap.put(p.getProblem_id().toString(), p.getTitle());
				problems.add(p_);
			}
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error = "Error.";
			return SUCCESS;
		}
		success = true;
		return SUCCESS;
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



	@JSON(deserialize=false,serialize=false)  
	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}
	
	
	
}
