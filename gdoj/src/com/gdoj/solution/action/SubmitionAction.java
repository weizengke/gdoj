package com.gdoj.solution.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.solution_source.service.Solution_sourceService;
import com.gdoj.solution_source.vo.Solution_source;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;

public class SubmitionAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	private ProblemService problemService;
	private Solution_sourceService solutionSourceService;
	private Solution solution;
	private String source;
	private Integer language;
	private Integer problemId;
	
	
	
	public String submitSolution() throws Exception{
		try {
			//System.out.println(problemId+" "+language+" "+source);
			String username = (String)ActionContext.getContext().getSession().get("session_username");
			 if(null==username){			
				 this.addFieldError("tip", "Your must login first."); 	
				 return INPUT;
		    }	
			 
			Date dt_prevSubmit = (Date)ActionContext.getContext().getSession().get("session_submit");
			Date dt = new Date(); 
			
			if(dt_prevSubmit!=null){
				//System.out.println(dt.getTime()-dt_prevSubmit.getTime());
				if(dt.getTime()-dt_prevSubmit.getTime()<3000){  //限制5s一次提交
					System.out.println(username+" submit twice at 3 second.");
				//	this.addFieldError("tip", "");
					return "success";
				}
			}
			ActionContext.getContext().getSession().put("session_submit", dt);
			
			if(source.length()<10||null==source){
				this.addFieldError("tip", "Source must at least 10 chars.");
				return INPUT;
			}
			if(source.length()>65535){
				this.addFieldError("tip", "Source must at most 65535 chars.");
				return INPUT;
			}
			if(null==problemService.queryProblem(problemId)){
				this.addFieldError("tip", "No such problem.");
				return INPUT;
			}
			
			
			Solution solution_ = new Solution();
			
			solution_.setUsername(username);
			solution_.setProblem_id(problemId);
			solution_.setLanguage(language);
			
			solution_.setSubmit_date(dt);
			solution_.setCode_length(source.length());
			
			solution = solution_;
			
			solutionService.save(solution);		
			
			
		//	System.out.println("sid="+solution.getSolution_id());
			
			if(null==solution.getSolution_id()){
				//Skip the judge
				this.addFieldError("tip", "Submit failed,please retry.");
				return INPUT;
			}
			Solution_source solutionSource = new Solution_source();
			solutionSource.setSolution_id(solution.getSolution_id());
			solutionSource.setSource(source);
			solutionSourceService.save(solutionSource);
			
			String[] cmd={Config.getValue("OJ_PATH")+"Client.exe",Integer.toString(solution.getSolution_id()),Integer.toString(solution.getLanguage()),Config.getValue("OJ_INI_PATH")};  
			try {			
				Runtime.getRuntime().exec(cmd);	
			} catch (IOException e) {	
				e.printStackTrace();
			}
			
			
			
			//JudgeQueue.addGCC(solution.getSolution_id());
			
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Submit failed,please retry.");
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public Solution_sourceService getSolutionSourceService() {
		return solutionSourceService;
	}

	public void setSolutionSourceService(
			Solution_sourceService solutionSourceService) {
		this.solutionSourceService = solutionSourceService;
	}
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	public Solution getSolution() {
		return solution;
	}

	public void setSolution(Solution solution) {
		this.solution = solution;
	}
	public SolutionService getSolutionService() {
		return solutionService;
	}

	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

}
