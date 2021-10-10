package com.gdoj.solution.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gdoj.bean.OJUtil;
import com.util.DateUtil;
import org.apache.struts2.json.annotations.JSON;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.opensymphony.xwork2.ActionSupport;

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
	private Integer fromSolutionId;
	private Integer pageSize = 20;

	private Integer contestOnly = 0;
	private boolean success;
	private String error;

	private List<Solution> solutions;

	public String queryStatusList() throws Exception{
		try {
			String sql_count = new String();
			String sql_query = new String();
			String sql_condition = new String();
			
			Integer intRowCount=0;
			Integer page=1;

			List<Solution> solutionList = new ArrayList<Solution>();

			sql_count = "select count(s.solution_id) from Solution s where s.solution_id>0 ";
			sql_query = "select s from Solution s where s.solution_id>0 ";

			Contest contest_ = null;
			if (contestId != 0) {
				sql_condition += " and s.contest_id=" + contestId;
				contest_ = contestService.queryContest(contestId,"ADMIN");
				if (null == contest_){
					success = false;
					error = "No such contest.";
					return SUCCESS;
				}
				/* 只查询比赛期间 */
				if (contestOnly != 0) {
					sql_condition += " and s.submit_date between '" + contest_.getStart_time() + "' and '" + contest_.getEnd_time() + "'";
				}
			}

			if(problemId !=null ){
				Integer problemId_ = 0;
				if (null != contestId && contestId != 0) {
					CProblem cproblem_ = new CProblem();
					cproblem_ = cproblemService.queryProblemByNum(problemId, contestId);
					if(cproblem_== null){
						success = false;
						error = "No such problem.";
						return SUCCESS;
					}
					problemId_ = cproblem_.getProblem_id();
				} else {
					problemId_ = Integer.valueOf(problemId);
				}

				sql_condition += " and s.problem_id=" + problemId_;
			}
			if (null != username) {
				sql_condition += " and s.username='" + username+"'";
			}
			if (null != fromSolutionId) {
				sql_condition += " and s.solution_id<" + fromSolutionId;
			}

			if (null != contestOnly && contestOnly != 0) {
				sql_condition +=" order by s.solution_id ASC";
			}else {
				sql_condition +=" order by s.solution_id DESC";
			}

			//System.out.println(sql_condition);

			if (getPageSize() > 100) {
				setPageSize(100);
			}
			intRowCount = solutionService.countSolutions(sql_count
					+ sql_condition);
			Integer pageCount = ((intRowCount + getPageSize() - 1) / getPageSize());
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * getPageSize();
			solutions = solutionService.querySolutions(from, getPageSize(),
			sql_query + sql_condition);
			if (null != solutionList) {
				for (Solution s : solutions) {
					s.setLanguage_name(getText("language"+s.getLanguage()));
					s.setStatus_description(OJUtil.getVerdictName(s.getVerdict(), s.getTestcase()));
					s.setFriendlySubmitDate(DateUtil.toFriendlyDate(s.getSubmit_date()));

					if (contest_ != null) {
						//int 强制转换存在风险
						s.setTimeSinceContestStart(DateUtil.penaltyString((int)((s.getSubmit_date().getTime()-contest_.getStart_time().getTime())/1000)));
						CProblem cp = new CProblem();
						cp = cproblemService.queryProblemByPid(s.getProblem_id(), contestId);
						if(cp != null){
							s.setProblemNum(cp.getNum());
						}else{
							success = false;
							error = "Failed to get contest problem num. solutionId="+ s.getSolution_id() + ", contestId=" + contestId + ", problemId=" + s.getProblem_id();
							return SUCCESS;
						}
					}

				}
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
	
	public List<Solution> getSolutions() {
		return solutions;
	}
	public void setSolutions(List<Solution> solutions) {
		this.solutions = solutions;
	}

	public Integer getFromSolutionId() {
		return fromSolutionId;
	}

	public void setFromSolutionId(Integer fromSolutionId) {
		this.fromSolutionId = fromSolutionId;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getContestOnly() {
		return contestOnly;
	}

	public void setContestOnly(Integer contestOnly) {
		this.contestOnly = contestOnly;
	}

}
