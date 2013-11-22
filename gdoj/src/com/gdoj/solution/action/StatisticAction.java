package com.gdoj.solution.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.bean.StatisticBean;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;

public class StatisticAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5701824724377184171L;
	
	private SolutionService solutionService;
	private ProblemService problemService;
	private ContestService contestService;
	private UserService userService;
	private String  type;
	private Integer size = 30;
	private List<StatisticBean> list;
	private boolean success;
	private String error;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<StatisticBean> getList() {
		return list;
	}
	public void setList(List<StatisticBean> list) {
		this.list = list;
	}
	
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
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
	public String statistic() throws Exception{
		
		try {
			List<Integer> list_ = new ArrayList<Integer>();
			List<StatisticBean> list_res = new ArrayList<StatisticBean>();
			
			Calendar calendar = Calendar.getInstance();

			Date t = calendar.getTime();
			
			if ("hourly".equals(type)) {
				list_ = null;
			} else if ("daily".equals(type)) {
				list_ = solutionService.getBydaily(t,size);
				calendar.add(Calendar.DATE, 1); //得到x一天;
				calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE),0,0,0);
			} else if ("monthly".equals(type)) {
				list_ = solutionService.getBymonthly(t,size);
				calendar.add(Calendar.MONTH, 1); //得到x一月;
				calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),1,0,0,0);
			} else {
				list_ = solutionService.getBydaily(t,size);
				calendar.add(Calendar.DATE, 1); //得到x一天;
				calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE),0,0,0);
			}
			list = new ArrayList<StatisticBean>();

			for(int i=0;i < list_.size();i++){
				StatisticBean e = new StatisticBean();
				e.setX(calendar.getTimeInMillis());    
				e.setY(list_.get(i));
				list_res.add(e);
				
				if ("hourly".equals(type)) {
					list_ = null;
				} else if ("daily".equals(type)) {
					calendar.add(Calendar.DATE, -1); //得到前一天;
				} else if ("monthly".equals(type)) {
					calendar.add(Calendar.MONTH, -1); //得到前一天;
				} else {
					calendar.add(Calendar.DATE, -1); //得到前一天;
				}
			}
			
			for (int i=list_.size() - 1;i >= 0; i--)
			{
				list.add(list_res.get(i));
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
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}@JSON(deserialize=false,serialize=false)  
	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}@JSON(deserialize=false,serialize=false)  
	public SolutionService getSolutionService() {
		return solutionService;
	}
	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}@JSON(deserialize=false,serialize=false)  
	public ProblemService getProblemService() {
		return problemService;
	}
	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	

	
}
