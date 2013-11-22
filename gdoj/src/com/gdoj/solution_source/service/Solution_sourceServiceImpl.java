package com.gdoj.solution_source.service;

import com.gdoj.solution_source.dao.Solution_sourceDAO;
import com.gdoj.solution_source.vo.Solution_source;

public class Solution_sourceServiceImpl implements Solution_sourceService {
	
	private Solution_sourceDAO solutionSourceDao;

	
	public Solution_source querySolutionSource(Integer solutionId) {
		// TODO Auto-generated method stub
		return solutionSourceDao.querySolutionSource(solutionId);
	}

	public void save(Solution_source solutionSource) {
		// TODO Auto-generated method stub
		solutionSourceDao.save(solutionSource);
	}

	public Solution_sourceDAO getSolutionSourceDao() {
		return solutionSourceDao;
	}

	public void setSolutionSourceDao(Solution_sourceDAO solutionSourceDao) {
		this.solutionSourceDao = solutionSourceDao;
	}

}
