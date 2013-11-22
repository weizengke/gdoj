package com.gdoj.contest.problem.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.solution.service.SolutionService;
import com.opensymphony.xwork2.ActionSupport;

public class ProblemAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ContestService contestService;
	private CProblem problem;
	private Integer problemId=1000;	
	private String num="A";
	private CProblemService cproblemService;
	
	private Integer contestId=0;
	
	
	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	public String problemAdd()throws Exception {
		try {
			//需要不重复的题目?
			CProblem problem_ = new CProblem();
			//System.out.println(problem.getTitle()+problem.getProblem_id()+problem.getContest_id());
			problem_.setTitle(problem.getTitle());
			problem_.setProblem_id(problem.getProblem_id());
			problem_.setNum(problem.getNum());
			problem_.setContest_id(problem.getContest_id());
			problem_.setPoint(problem.getPoint());
			cproblemService.save(problem_);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}

		return SUCCESS;
	}
	public String problemBeforeModify()throws Exception {
		try {
			
			problem = cproblemService.queryProblemByNum(num,contestId);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public String problemModify()throws Exception {
		try {
			
			cproblemService.save(problem);
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String problemDelete()throws Exception {
		try {
			Contest contest_ = new Contest();
			contest_ = contestService.queryContest(contestId,"USER");
			if (contest_ == null) {
				return ERROR;
			}
		/*	if (contest_.getStart_time().before(new Date())) {
				this.addFieldError("tip",
						"you can't delete problem after contest start.");
				return ERROR;
			}		
		*/	
			
			List<CProblem> problemList_ = cproblemService.queryProblems(contestId);
			boolean flag = false;
			List<String> num_ = new ArrayList<String>();
			for(CProblem p:problemList_){
				num_.add(p.getNum());
			}
			for(int i=0;i<problemList_.size();i++){
				if(flag){
					CProblem problem__ = problemList_.get(i);
					problem__.setNum(num_.get(i-1));
					cproblemService.save(problem__);
				}	
				if(problemList_.get(i).getNum().equals(num)&&flag==false){
					CProblem problem_ = cproblemService.queryProblemByNum(num, contestId);
					if(problem_==null){
						this.addFieldError("tip",
						"No such problem.");
						return ERROR;
					}
					cproblemService.delete(problem_);
					flag=true;					
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public CProblem getProblem() {
		return problem;
	}

	public void setProblem(CProblem problem) {
		this.problem = problem;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Integer getProblemId() {
		return problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
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

	
	
	
}
