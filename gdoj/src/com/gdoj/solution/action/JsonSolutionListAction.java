package com.gdoj.solution.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.bean.StatusBean;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class JsonSolutionListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	private ContestService contestService;
	private CProblemService cproblemService;
	private String problemId;
	private String username;
	private Integer contestId=0;
	
	private boolean success;
	private String error;

	private List<StatusBean> solutions;

	public String queryStatusList() throws Exception{
		try {
			
			
			String sql_count = new String();
			String sql_query = new String();
			String sql_condition = new String();
			
			Integer intRowCount=0;
			Integer pageSize=100;
			Integer page=1;
			List<Solution> solutionList = new ArrayList<Solution>();
			//System.out.println(contestId);
			Contest contest_ = contestService.queryContest(contestId,"ADMIN");
			if(null==contest_){
				success = false;
				error = "No such contest.";
				return SUCCESS;
			}

		
			sql_count = "select count(s.solution_id) from Solution s where s.contest_id="+contestId+" and s.submit_date between '" + contest_.getStart_time() +"' and '"+ contest_.getEnd_time()+"'";
			sql_query = "select s from Solution s where s.contest_id="+contestId +" and s.submit_date between '" + contest_.getStart_time() +"' and '"+ contest_.getEnd_time()+"'";
			
			if(problemId!=null){
				CProblem cproblem_ = new CProblem();
				cproblem_ = cproblemService.queryProblemByNum(problemId, contestId);
				if(cproblem_==null){
					success = false;
					error = "No such problem.";
					return SUCCESS;
				}
				sql_condition += " and s.problem_id=" + cproblem_.getProblem_id();
			}
			if (null != username) {
				sql_condition += " and s.username='" + username+"'";
			}
			sql_condition +=" order by s.solution_id ASC";
			
			if (pageSize > 100) {
				pageSize = 100;
			}
			intRowCount = solutionService.countSolutions(sql_count
					+ sql_condition);
			Integer pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			solutionList = solutionService.querySolutions(from, pageSize,
			sql_query + sql_condition);
			
			solutions = new ArrayList<StatusBean>();
			
			for(Solution s:solutionList){
				StatusBean sb = new StatusBean();
				sb.setSolutionId(s.getSolution_id());
				sb.setTestCase(s.getTestcase());
				sb.setTime(s.getTime());
				sb.setContestId(s.getContest_id());
				String case_str = new String();
				if(s.getVerdict()!=5&&s.getVerdict()<12&&s.getVerdict()>3){
					case_str = " on test "+s.getTestcase();
					sb.setStatus_description(getText("verdict"+s.getVerdict())+case_str);
				}else{
					sb.setStatus_description(getText("verdict"+s.getVerdict()));
				}
				//int 强制转换存在风险
				sb.setContestTimes(DateUtil.penaltyString((int)((s.getSubmit_date().getTime()-contest_.getStart_time().getTime())/1000)));
				
				CProblem cproblem_ = new CProblem();
				cproblem_ = cproblemService.queryProblemByPid(s.getProblem_id(), contestId);
				if(cproblem_!=null){
					sb.setProblemNum(cproblem_.getNum());
				}else{
					success = false;
					error = "Error.";
					return SUCCESS;
				}
				solutions.add(sb);	
			}
		
			//System.out.println(verdicts.get(0));
			
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error = "Error.";
			return SUCCESS;
		}
		success = true;		
		return SUCCESS;
	}
	@JSON(deserialize=false,serialize=false)  
	public ContestService getContestService() {
		return contestService;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}

	@JSON(deserialize=false,serialize=false)  
	public SolutionService getSolutionService() {
		return solutionService;
	}

	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}

	public String getProblemId() {
		return problemId;
	}

	public void setProblemId(String problemId) {
		this.problemId = problemId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
	
	public List<StatusBean> getSolutions() {
		return solutions;
	}
	public void setSolutions(List<StatusBean> solutions) {
		this.solutions = solutions;
	}
}
