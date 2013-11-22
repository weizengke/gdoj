package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ContestShowAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ContestService contestService;
	private Contest contest;
	private Integer contestId;
	private List<Problem> problemList;
	private List<CProblem> cproblemList; 
	private CProblemService cproblemService;
	private ProblemService problemService;
	private String index="A";
	
	
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String contestShow()throws Exception {
		try {
			contest = contestService.queryContest(contestId,"ADMIN");
			if(null==contest){
				ActionContext.getContext().put("tip", "No such contest.");
				return ERROR;
			}
			//System.out.println(contest.getTitle());
			cproblemList = cproblemService.queryProblems(contestId);
			
			List<Problem> problemList_ = new ArrayList<Problem>();;
			String[] indexList={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
			int i=0;
			//System.out.println(indexList[i]);
			for(CProblem cp:cproblemList){
			//	System.out.println(cp.getProblem_id());
				i++;
				problemList_.add(problemService.queryProblem(cp.getProblem_id()));
			}
			if(i<26){
				index=indexList[i];
			}else index=null;
			problemList = problemList_;
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	public List<Problem> getProblemList() {
		return problemList;
	}

	public void setProblemList(List<Problem> problemList) {
		this.problemList = problemList;
	}

	public List<CProblem> getCproblemList() {
		return cproblemList;
	}

	public void setCproblemList(List<CProblem> cproblemList) {
		this.cproblemList = cproblemList;
	}

	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
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
}
