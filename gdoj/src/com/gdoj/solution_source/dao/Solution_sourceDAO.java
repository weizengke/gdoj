package com.gdoj.solution_source.dao;

import com.gdoj.solution_source.vo.Solution_source;

public interface Solution_sourceDAO {
	public Solution_source querySolutionSource(Integer solutionId);
	public void save(Solution_source solutionSource);
	
}
