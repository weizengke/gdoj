package com.gdoj.problem.service;

import java.util.List;

import com.gdoj.problem.dao.ProblemDAO;
import com.gdoj.problem.vo.Problem;

public class ProblemServiceImpl implements ProblemService {

	private ProblemDAO problemDao;
	
	public ProblemDAO getProblemDao() {
		return problemDao;
	}
	public void setProblemDao(ProblemDAO problemDao) {
		this.problemDao = problemDao;
	}

	public Problem queryProblem(Integer problemId) {
		// TODO Auto-generated method stub
		return problemDao.queryProblem(problemId);
	}

	public List<Problem> queryProblems(Integer from, Integer pageSize,
			String order, String ojName,String role) {
		// TODO Auto-generated method stub
		return problemDao.queryProblems(from, pageSize, order,ojName,role);
	}
	public List<Problem> searchProblem(Integer pageSize,String searchString){
		return problemDao.searchProblem(pageSize,searchString);
	}
	public void save(Problem problem) {
		// TODO Auto-generated method stub
		problemDao.save(problem);
	}
	public Integer countProblems(String role, String ojName){
		return problemDao.countProblems(role,ojName);
	}
	public List<Problem> query(String sql,String word){
		return problemDao.query(sql, word);
	}
}
