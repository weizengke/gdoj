
package com.gdoj.common.action;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import com.gdoj.bean.OJUtil;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.bean.TestBean;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.gdoj.solution_source.service.Solution_sourceService;
import com.gdoj.solution_source.vo.Solution_source;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.OJSocket;
import com.util.PasswordMD5;
import com.util.StreamHandler;

public class JsonSubmitAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SolutionService solutionService;
	private Solution_sourceService solutionSourceService;
	private ContestService contestService;	
	private ProblemService problemService;
	private CProblemService cproblemService;
	private String sessionId;
	private String source;
	private String input;
	private String language;
	private String problemId;
	private Integer contestId;
	private Integer submit;
	private Problem problem;
	private boolean success;
	private String error;
	
	public String Submit() throws Exception{
		try {
			String username = (String) ActionContext.getContext().getSession().get("session_username");
			if (problemId != null && Integer.parseInt(problemId) != 0) {
				if (null == username) {
					success = false;
					error = "Your must login first.";
					return SUCCESS;
				}
			}

			Date dt = new Date();
			Date dt_prevSubmit = (Date)ActionContext.getContext().getSession().get("session_submit");
			if(dt_prevSubmit != null){
				if (dt.getTime() - dt_prevSubmit.getTime() < 3000){  //限制3s一次提交
					success = false; error="You submit frequently.";
					return SUCCESS;
				}
			}
			ActionContext.getContext().getSession().put("session_submit", dt);
			
			if(source == null || source.length()<10){
				success = false; error = "Code source must at least 10 chars.";
				return SUCCESS;
			}
			if(source == null || source.length()>65535){
				success = false; error="Code source is at most 65535 chars.";
				return SUCCESS;
			}
			
			if (contestId != null && contestId > 0) {
				CProblem cproblem = new CProblem();
				cproblem=cproblemService.queryProblemByNum(problemId, contestId);
				if(null==cproblem){
					success = false; error="No such problem.";
					return SUCCESS;
				}
				problemId = cproblem.getProblem_id().toString();
			} else {
				contestId = 0;
			}

			String OJName = "GUET";
			if (Integer.parseInt(problemId) != 0) {
				problem = problemService.queryProblem(Integer.parseInt(problemId));
				if(null == problem){
					success = false; error="No such problem.";
					return SUCCESS;
				}
				OJName = problem.getOj_name();
			}

			if (submit == 0) {
				TestBean testBean = new TestBean();
				testBean.setCode(source);
				testBean.setInput(input);
				if (!OJName.equals("GUET")) {
					testBean.setLanguage_id(OJUtil.getLocalLanguageId(OJName, Integer.parseInt(language)).toString());
				} else {
					testBean.setLanguage_id(language);
				}

				testBean.setProblem_id(problemId);

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss"); 
				sessionId = PasswordMD5.MD5(username+df.format(new Date())+ new Random().nextInt(1000)).toString();				
				testBean.setSession_id(sessionId);
				
				String resultJson = null;
	            try {
					resultJson = JSONObject.fromObject(testBean).toString();/*JsonUtil.objectToJson(testBean);*/
					System.out.println("resultJson"+resultJson+username);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("json serialize failed.");
					success = false; error="json serialize failed.";
					return SUCCESS;
				}
				String judger_ip = Config.getValue("OJ_JUDGER_IP");
				Integer judger_port = Integer.valueOf(Config.getValue("OJ_JUDGER_PORT")).intValue();
				OJSocket.JudgeTestRequest(judger_ip, judger_port, resultJson);
			} else {
				Solution solution_ = new Solution();
				solution_.setUsername(username);
				solution_.setProblem_id(Integer.parseInt(problemId));
				solution_.setLanguage(Integer.parseInt(language));
				solution_.setLanguage_name(OJUtil.getLanguageName(OJName, Integer.parseInt(language)));
				solution_.setContest_id(contestId);
				
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				solution_.setSubmit_date(Timestamp.valueOf(simpleDate.format(dt)));
				solution_.setCode_length(source.length());
				
				Solution solution = solution_;
				solutionService.save(solution);		
				
				if(null==solution.getSolution_id()){
					success = false;
					error = "Submit failed, please retry.";
					return SUCCESS;
				}
				sessionId = solution.getSolution_id().toString();
				
				Solution_source solutionSource = new Solution_source();
				solutionSource.setSolution_id(solution.getSolution_id());
				solutionSource.setSource(source);
				solutionSourceService.save(solutionSource);
				
				String judger_ip = Config.getValue("OJ_JUDGER_IP");
				Integer judger_port = Integer.valueOf(Config.getValue("OJ_JUDGER_PORT")).intValue();
				OJSocket.JudgeRequest(judger_ip, judger_port, solution.getSolution_id());
			}			
			
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error="Submit failed, please retry.";
			return SUCCESS;
		}
		
		success = true;
		return SUCCESS;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@JSON(deserialize=false,serialize=false)   
	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError() {
		return error;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getProblemId() {
		return problemId;
	}

	public void setProblemId(String problemId) {
		this.problemId = problemId;
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

	public void setSubmit(Integer submit) {
		this.submit = submit;
	}

	public Integer getSubmit() {
		return submit;
	}

	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	
	@JSON(deserialize=false,serialize=false) 
	public ContestService getContestService() {
		return contestService;
	}
	
	@JSON(deserialize=false,serialize=false) 
	public SolutionService getSolutionService() {
		return solutionService;
	}

	public void setSolutionService(SolutionService solutionService) {
		this.solutionService = solutionService;
	}
	
	@JSON(deserialize=false,serialize=false) 
	public Solution_sourceService getSolutionSourceService() {
		return solutionSourceService;
	}

	public void setSolutionSourceService(Solution_sourceService solutionSourceService) {
		this.solutionSourceService = solutionSourceService;
	}

}

