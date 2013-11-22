package com.gdoj.solution.action;



import java.util.ArrayList;
import java.util.List;

import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.opensymphony.xwork2.ActionSupport;

public class SolutionStatisticAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	private ProblemService problemService;
	private ContestService contestService;
	private List<Integer> countList;
	private List<Float> percentageList;
	
	private Integer other=0;
	private Integer submit=0;
	private Integer solved=0;
	private Integer submitUser=0;
	private Integer problemId;
	private String username;
	private String problemTitle;
	
	public Integer getOther() {
		return other;
	}
	public void setOther(Integer other) {
		this.other = other;
	}
	public List<Float> getPercentageList() {
		return percentageList;
	}
	public void setPercentageList(List<Float> percentageList) {
		this.percentageList = percentageList;
	}
	public List<Integer> getCountList() {
		return countList;
	}

	public void setCountList(List<Integer> countList) {
		this.countList = countList;
	}

	public String getProblemTitle() {
		return problemTitle;
	}

	public void setProblemTitle(String problemTitle) {
		this.problemTitle = problemTitle;
	}

	public Integer getSubmitUser() {
		return submitUser;
	}

	public void setSubmitUser(Integer submitUser) {
		this.submitUser = submitUser;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String queryProblemStatistic() throws Exception{
		try {
			
			Problem problem_ = new Problem();
			problem_ = problemService.queryProblem(problemId);
			if(problem_==null){
				return ERROR;
			}
			problemTitle = problem_.getTitle();
			
			//submit = problem_.getSubmit();
			submitUser = problem_.getSubmit_user();
			solved = problem_.getSolved();
			
			String sql_count = new String();
			String sql_condition = new String();
			sql_count = "select count(s.solution_id) from Solution s where s.problem_id="+problemId;
	
			submit = solutionService.countSolutions(sql_count);
			//sql_condition = "select count(DISTINCT(s.username)) from Solution s where s.verdict=5 and s.problem_id="+problemId;
			//solved = solutionService.countSolutions(sql_count+sql_condition);
			
			countList = new ArrayList<Integer>();
			
			sql_condition = " and s.verdict=5";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=6";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=3";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=7";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=8";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=9";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=11";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			sql_condition = " and s.verdict=10";
			countList.add(solutionService.countSolutions(sql_count+sql_condition)) ;
			
			 
		//	System.out.println(countList.get(0));
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public SolutionService getSolutionService() {
		return solutionService;
	}

	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
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

	public Integer getSubmit() {
		return submit;
	}

	public void setSubmit(Integer submit) {
		this.submit = submit;
	}

	public Integer getSolved() {
		return solved;
	}

	public void setSolved(Integer solved) {
		this.solved = solved;
	}

	public ContestService getContestService() {
		return contestService;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
}
