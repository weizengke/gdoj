package com.gdoj.contest.problem.service;

import java.util.List;

import com.gdoj.contest.problem.dao.CProblemDAO;
import com.gdoj.contest.problem.vo.CProblem;

public class CProblemServiceImpl implements CProblemService {

	private CProblemDAO cproblemDao;
	
	
	public CProblemDAO getCproblemDao() {
		return cproblemDao;
	}

	public void setCproblemDao(CProblemDAO cproblemDao) {
		this.cproblemDao = cproblemDao;
	}

	public CProblem queryProblemByNum(String num,Integer contestId) {
		// TODO Auto-generated method stub
		return cproblemDao.queryProblemByNum(num,contestId);
	}
	public CProblem queryProblemByPid(Integer problemId,Integer contestId){
		return cproblemDao.queryProblemByPid(problemId, contestId);
	}
	
	public List<CProblem> queryProblems(Integer contestId) {
		// TODO Auto-generated method stub
		return cproblemDao.queryProblems(contestId);
	}

	public void save(CProblem problem) {
		// TODO Auto-generated method stub
		cproblemDao.save(problem);
	}
	public void delete(CProblem problem){
		cproblemDao.delete(problem);
	}
	public Integer countProblems(Integer contestId){
		return cproblemDao.countProblems(contestId);
	}

}
