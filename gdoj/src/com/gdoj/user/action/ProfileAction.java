package com.gdoj.user.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.bean.OnlineUserBean;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;
import com.util.OnlineUsers;

public class ProfileAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService; 
	private SolutionService solutionService; 
	private ProblemService problemService; 
	
	private List<Problem> problemSolvedList;
	private List<Problem> problemTryList;
	
	private User user;
	private String username;
	private Integer rank;
	
	private String registerDate; 
	private String lastAccessTime; /* online now , last vist time */
	private Integer statusFlag;  /* 1(online), 0(offline) */
	
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public Integer getStatusFlag() {
		return statusFlag;
	}
	public void setStatusFlag(Integer statusFlag) {
		this.statusFlag = statusFlag;
	}
	public String getLastAccessTime() {
		return lastAccessTime;
	}
	public void setLastAccessTime(String lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
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
	public List<Problem> getProblemSolvedList() {
		return problemSolvedList;
	}
	public void setProblemSolvedList(List<Problem> problemSolvedList) {
		this.problemSolvedList = problemSolvedList;
	}
	public List<Problem> getProblemTryList() {
		return problemTryList;
	}
	public void setProblemTryList(List<Problem> problemTryList) {
		this.problemTryList = problemTryList;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String queryUser()  throws Exception {
		try {
			if(username==null){
				username=(String)ActionContext.getContext().getSession().get("session_username");
			}
			if(username==null){
				return LOGIN;
			}
			user = new User();
			user = userService.queryUser(username);
			if(user==null){
				this.addFieldError("tip", "No such user!");
				return ERROR;
			}
			
			/* rank */
			rank = userService.getUserRank(user);
			
			/* problem solved */
			String sql = "select DISTINCT s.problem_id from Solution s where s.verdict=5 and s.username='"+user.getUsername()+"' order by s.problem_id ASC;";
			List<Object> solvedProblemIdList = new ArrayList<Object>();
			solvedProblemIdList = solutionService.query(sql);
			problemSolvedList = new ArrayList<Problem>();
			for(Object i:solvedProblemIdList){
			//	System.out.println(i);
				Problem problem_ = new Problem();
				problem_ = problemService.queryProblem((Integer) i);
				if(problem_!=null){
					problemSolvedList.add(problem_);
				}
			}
			
			/* problem try */
			sql="select distinct s.problem_id from Solution s where "+
			"s.username='"+user.getUsername()+"' group by s.problem_id " +
			"having SUM(s.verdict=5)<1 order by s.problem_id ASC;";
			
			List<Object> tryProblemIdList = new ArrayList<Object>();
			tryProblemIdList = solutionService.query(sql);
			problemTryList = new ArrayList<Problem>();
			for(Object i:tryProblemIdList){
				//System.out.println(i);
				Problem problem_ = new Problem();
				problem_ = problemService.queryProblem((Integer) i);
				if(problem_!=null){
					problemTryList.add(problem_);
				}
			}
			
			
			registerDate = new String();
			registerDate = DateUtil.toFriendlyDate(user.getRegdate());
			/* lastAccestTime */
			lastAccessTime = new String();
			OnlineUserBean ou = new OnlineUserBean();
			ou = OnlineUsers.getUser(username);
			if (null != ou){
				lastAccessTime = DateUtil.toFriendlyDate(ou.getLastAccessTime());
				user.setLastaccesstime(ou.getLastAccessTime());
				if (1 == ou.getStatusFlag()){
					statusFlag = 1;
				}else{
					statusFlag = 0;
				}
			}
			else{
				lastAccessTime = DateUtil.toFriendlyDate(user.getLastaccesstime());
				statusFlag = 0;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}		
}
