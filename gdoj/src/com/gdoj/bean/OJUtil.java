package com.gdoj.bean;
import com.gdoj.problem.service.ProblemService;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.problem.vo.Problem;
import com.util.MyApplicationContextUtil;

public class OJUtil {

	public static Problem queryProblem(Integer problemId) {
		// TODO Auto-generated method stub
		ProblemService problemService = (ProblemService)MyApplicationContextUtil.getContext().getBean("problemService");
		Problem problem = problemService.queryProblem(problemId);
		return problem;
	}

	public static Problem queryProblemByContest(String num,Integer contestId) {
		// TODO Auto-generated method stub
		CProblemService cproblemService = (CProblemService)MyApplicationContextUtil.getContext().getBean("cproblemService");
		CProblem cProblem = cproblemService.queryProblemByNum(num, contestId);
		if (null == cProblem)
		{
			System.out.println("queryProblemByContest->queryProblemByNum failed. " + num + " " + contestId);
			return null;
		}
		
		Problem problem = queryProblem(cProblem.getProblem_id());
		
		return problem;
	}
}
