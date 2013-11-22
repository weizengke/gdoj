package com.gdoj.solution.service;

import java.util.Date;
import java.util.List;

import com.gdoj.solution.dao.SolutionDAO;
import com.gdoj.solution.vo.Solution;

public class SolutionServiceImpl implements SolutionService {

	private SolutionDAO solutionDao;
	public SolutionDAO getSolutionDao() {
		return solutionDao;
	}
	public void setSolutionDao(SolutionDAO solutionDao) {
		this.solutionDao = solutionDao;
	}
	
	public Integer countSolutions(String sql) {
		// TODO Auto-generated method stub
		return solutionDao.countSolutions(sql);
	}

	public Solution querySolution(Integer solutionId) {
		// TODO Auto-generated method stub
		return solutionDao.querySolution(solutionId);
	}

	public List<Solution> querySolutions(Integer from, Integer pageSize,String sql) {
		// TODO Auto-generated method stub
		return solutionDao.querySolutions(from, pageSize, sql);
	}

	public void save(Solution solution) {
		// TODO Auto-generated method stub
		solutionDao.save(solution);
	}
	public List<Object> query(String sql){
		return solutionDao.query(sql);
	}
	
	public List<Integer> getBydaily(Date date, Integer size){
		return solutionDao.getBydaily(date, size);
	}
	public List<Integer> getBymonthly(Date date, Integer size){
		return solutionDao.getBymonthly(date, size);
	}
}
