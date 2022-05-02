package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.List;
import com.gdoj.bean.LangBean;
import com.gdoj.bean.OJUtil;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.service.SolutionService;
import com.gdoj.solution.vo.Solution;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.OJSocket;

public class ReJudgeAction extends ActionSupport{
	public ProblemService getProblemService() {
		return problemService;
	}

	public void setProblemService(ProblemService problemService) {
		this.problemService = problemService;
	}

	private ProblemService problemService;
	private SolutionService solutionService;
	private Integer problemId;
	private Integer solutionId;
	private Integer contestId;
	
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	public Integer getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
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
	
	public String reJudge()throws Exception {
		try {
			String condition_ = new String();
			if(problemId!=null){
				condition_ = "s.problem_id="+ problemId;
				if(contestId!=null){
					condition_ += " and s.contest_id="+ contestId;
				}
			}else if(contestId!=null){
				condition_ = "s.contest_id="+ contestId;
			}
			else if(solutionId!=null){
				condition_ = "s.solution_id="+ solutionId;
			}
			List<Solution> solution_ = new ArrayList<Solution>();
			String sql = "from Solution s where "+condition_ +" order by s.solution_id ASC";
			solution_ = solutionService.querySolutions(0, -1, sql);
			if(solution_ ==null){
				System.out.println("no solution to be ReJudge");
				return ERROR;
			}

			for (Solution s : solution_) {
				Problem problem = problemService.queryProblem(s.getProblem_id());
				if(null == problem){
					System.out.println("No such problem.");
					continue;
				}

				boolean found = false;
				List<LangBean> languages = OJUtil.getSupportLanguages(problem.getOj_name());
				for(LangBean lang:languages){
					if(lang.getId().equals(s.getLanguage())){
						found = true;
						break;
					}
				}
				if(found==false){
					continue;
				}
				if (s.getLanguage_name() == null) {
					s.setLanguage_name(OJUtil.getLanguageName(problem.getOj_name(), s.getLanguage()));
				}

				s.setVerdict(1);
				s.setTestcase(0);
				s.setTime(0);
				s.setMemory(0);
				solutionService.save(s);
				
				String judger_ip = Config.getValue("OJ_JUDGER_IP");
				Integer judger_port = Integer.valueOf(Config.getValue("OJ_JUDGER_PORT")).intValue();
				OJSocket.JudgeRequest(judger_ip, judger_port, s.getSolution_id());

				Thread.sleep(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
}
