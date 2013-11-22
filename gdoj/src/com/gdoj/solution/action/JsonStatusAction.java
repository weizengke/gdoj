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

public class JsonStatusAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	private ContestService contestService;
	private CProblemService cproblemService;
	private String ids;
	private List<StatusBean> status;
	
	public List<StatusBean> getStatus() {
		return status;
	}
	public void setStatus(List<StatusBean> status) {
		this.status = status;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	private boolean success;
	private String error;
	
	public String queryStatus() throws Exception{
		
		try {
			String[] id = ids.split(",");
			
			status = new ArrayList<StatusBean>();
			for (String i : id) {
				//System.out.println(i);
				Solution solution_ = new Solution();
				StatusBean status_ = new StatusBean();
				solution_ = solutionService.querySolution(Integer.parseInt(i));
				if (solution_ != null) {
					status_.setSolutionId(solution_.getSolution_id());
					status_.setStatus_description(getText("verdict"
							+ solution_.getVerdict()));
					status_.setTestCase(solution_.getTestcase());
					status_.setContestId(solution_.getContest_id());
					status_.setVerdictId(solution_.getVerdict());
					status_.setMemory(solution_.getMemory());
					status_.setTime(solution_.getTime());
					
					status.add(status_);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			success = false;		
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

	@JSON(deserialize=false,serialize=false)  
	public CProblemService getCproblemService() {
		return cproblemService;
	}

	public void setCproblemService(CProblemService cproblemService) {
		this.cproblemService = cproblemService;
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
}
