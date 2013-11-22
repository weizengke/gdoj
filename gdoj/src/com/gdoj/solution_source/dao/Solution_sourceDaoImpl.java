package com.gdoj.solution_source.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.problem.vo.Problem;
import com.gdoj.solution_source.vo.Solution_source;

public class Solution_sourceDaoImpl extends HibernateDaoSupport implements Solution_sourceDAO {

	public Solution_source querySolutionSource(Integer solutionId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {solutionId};
		String sql = "from Solution_source as ss where ss.solution_id=?";
		List<Solution_source> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public void save(Solution_source solutionSource) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(solutionSource);
	}

}
