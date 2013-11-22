package com.gdoj.contest.problem.dao;

import java.util.List;

import com.gdoj.contest.problem.vo.CProblem;

public interface CProblemDAO {
	public List<CProblem> queryProblems(Integer contestId);
	public void save(CProblem problem);
	public void delete(CProblem problem);
	public CProblem queryProblemByNum(String num,Integer contestId);
	public Integer countProblems(Integer contestId);
	public CProblem queryProblemByPid(Integer problemId,Integer contestId);

}
