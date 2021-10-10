package com.gdoj.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.jdbc.Expectation;
import org.json.simple.JSONObject;

import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.solution_source.service.Solution_sourceService;
import com.gdoj.solution_source.vo.Solution_source;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.StreamHandler;

public class Solution_sourceAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Solution_sourceService solutionSourceService; 
	private SolutionService solutionService;
	private ProblemService problemService;
	private CProblemService cproblemService;
	private ContestService contestService;
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private Integer solutionId=0;
	private Solution_source solutionSource;
	private Solution solution;
	private String problemTitle;
	private String verdict;
	private String problemId;
	private String className;
	private String contestTitle;
	private String judgeLog;
	
	public String getJudgeLog() {
		return judgeLog;
	}

	public void setJudgeLog(String judgeLog) {
		this.judgeLog = judgeLog;
	}
	public String getContestTitle() {
		return contestTitle;
	}
	public void setContestTitle(String contestTitle) {
		this.contestTitle = contestTitle;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getProblemId() {
		return problemId;
	}
	public void setProblemId(String problemId) {
		this.problemId = problemId;
	}
	public String getVerdict() {
		return verdict;
	}
	public void setVerdict(String verdict) {
		this.verdict = verdict;
	}

	public String solutionSource() throws Exception{
		
		try {
			Solution_source solutionSource_ = new Solution_source();
			solutionSource_ = solutionSourceService
					.querySolutionSource(solutionId);
			if (null == solutionSource_) {
				ActionContext.getContext().put("tip", "No such solution source.");				
				return ERROR;
			}
			Solution solution_ = new Solution();
			solution_ = solutionService.querySolution(solutionId);
			if (null == solution_) {
				ActionContext.getContext().put("tip", "No such solution");	
				return ERROR;
			}
			
			String username = (String)ActionContext.getContext().getSession().get("session_username");
			if(username==null){
				ActionContext.getContext().put("tip", "No such contest.");	
				return LOGIN;
			}
			
			String problemTitle_ = new String();
			problemId = new String();
			if(solution_.getContest_id()>0){
				problemId = cproblemService.queryProblemByPid(solution_.getProblem_id(), solution_.getContest_id()).getNum();
				problemTitle_ = cproblemService.queryProblemByPid(solution_.getProblem_id(), solution_.getContest_id()).getTitle();
			
			}else{
				problemId = solution_.getProblem_id().toString();
				problemTitle_ = problemService.queryProblem(solution_.getProblem_id()).getTitle();
			}
			
			//System.out.println(problemId+problemTitle_);
			
			if (null == problemTitle_) {
				ActionContext.getContext().put("tip", "No such problem.");	
				return ERROR;
			}
			solution = solution_;
			solutionSource = solutionSource_;
			problemTitle = problemTitle_;
			verdict = getText("verdict"+solution_.getVerdict());
			
			String className_[]={"cpp","cpp","cpp","cpp","java","csharp","fsharp","delphi","python","ruby","perl","lua","tcl","pike","haskell","php","bf","bf","go","scala","jscript","groovy"};

			className = "brush:"+className_[solution.getLanguage()-1]+";";
			
			
			try {
				File file;
				judgeLog = new String();
				file = new File(Config.getValue("OJ_JUDGE_LOG") + "judge-log-"
						+ solutionId + ".log");
				judgeLog = StreamHandler.readEx(file);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
	}
	
	public void outString(String str) {
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String JsonSolutionSource() throws IOException{
		String username = (String)ActionContext.getContext().getSession().get("session_username");
		if (username == null) {
			outString(getError("need login!"));
			return null;
		}
		
		Solution_source solutionSource_ = new Solution_source();
		solutionSource_ = solutionSourceService
				.querySolutionSource(solutionId);
		if (null == solutionSource_) {			
			outString(getError("No such solution source."));
			return null;
		}
		Solution solution_ = new Solution();
		solution_ = solutionService.querySolution(solutionId);
		if (null == solution_) {
			outString(getError("No such solution!"));
			return null;
		}
		
		String problemTitle_ = new String();
		problemId = new String();
		if(solution_.getContest_id()>0){
			problemId = cproblemService.queryProblemByPid(solution_.getProblem_id(), solution_.getContest_id()).getNum();
			problemTitle_ = cproblemService.queryProblemByPid(solution_.getProblem_id(), solution_.getContest_id()).getTitle();
		
		}else{
			problemId = solution_.getProblem_id().toString();
			problemTitle_ = problemService.queryProblem(solution_.getProblem_id()).getTitle();
		}
		
		//System.out.println(problemId+problemTitle_);
		
		if (null == problemTitle_) {
	        outString(getError("No such problem."));
			return null;
		}
		solution = solution_;
		solutionSource = solutionSource_;
		problemTitle = problemTitle_;
		verdict = getText("verdict"+solution_.getVerdict());
		
		String className_[]={"cpp","cpp","cpp","cpp","java","csharp","fsharp","delphi","python","ruby","perl","lua","tcl","pike","haskell","php","bf","bf","go","scala","jscript","groovy"};

		className = "brush:"+className_[solution.getLanguage()-1]+";";
				
		try {
			File file;
			judgeLog = new String();
			file = new File(Config.getValue("OJ_JUDGE_LOG") + "judge-log-"
					+ solutionId + ".log");
			judgeLog = StreamHandler.read(file);
		} catch (Exception e) {
			// TODO: handle exception
		}		
		
		JSONObject obj = new JSONObject();  

        obj.put("error", 0);  
        obj.put("source", solution); 
        obj.put("solutionSource", solutionSource); 
        obj.put("problemTitle", problemTitle); 
        obj.put("problemId", problemId); 
        obj.put("solutionId", solutionId); 
        obj.put("verdict", verdict); 
        obj.put("className", className); 
        obj.put("contestTitle", contestTitle); 
        obj.put("judgeLog", judgeLog); 
        obj.put("message", "Operate Success...");                            
        outString(obj.toJSONString());
        return null;
	}
	
	private String getError (String message )  
	{  
        JSONObject obj = new JSONObject();  
        obj.put("error", 1);  
        obj.put("message", message);  
        return obj.toJSONString();  
    }
	
	public CProblemService getCproblemService() {
		return cproblemService;
	}
	public void setCproblemService(CProblemService cproblemService) {
		this.cproblemService = cproblemService;
	}

	public Solution_sourceService getSolutionSourceService() {
		return solutionSourceService;
	}
	public void setSolutionSourceService(
			Solution_sourceService solutionSourceService) {
		this.solutionSourceService = solutionSourceService;
	}

	public Integer getSolutionId() {
		return solutionId;
	}

	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
	}

	public Solution_source getSolutionSource() {
		return solutionSource;
	}
	public void setSolutionSource(Solution_source solutionSource) {
		this.solutionSource = solutionSource;
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
	public Solution getSolution() {
		return solution;
	}
	public void setSolution(Solution solution) {
		this.solution = solution;
	}

	public String getProblemTitle() {
		return problemTitle;
	}

	public void setProblemTitle(String problemTitle) {
		this.problemTitle = problemTitle;
	}
	
	@JSON(deserialize=false,serialize=false) 
	public ContestService getContestService() {
		return contestService;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
}
