package com.gdoj.contest.problem.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.user.vo.User;
import com.util.HibernateSessionFactory;

public class CProblemDaoImpl  extends HibernateDaoSupport implements CProblemDAO  {
	public CProblem queryProblemByPid(Integer problemId,Integer contestId){
		Integer[] param = new Integer[] {problemId,contestId};
		String sql = "from CProblem as p where p.problem_id=? and p.contest_id=?";
		List<CProblem> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
		
	}
	public CProblem queryProblemByNum(String num,Integer contestId) {
		// TODO Auto-generated method stub
		
		String sql = "from CProblem as p where p.num='"+num+"' and p.contest_id="+contestId;
		List<CProblem> list = getHibernateTemplate().find(sql);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<CProblem> queryProblems(Integer contestId) {
		// TODO Auto-generated method stub	
		Integer[] param = new Integer[] {contestId};
		String sql = "from CProblem as p where p.contest_id=?";
		
		return getHibernateTemplate().find(sql, param);
	}

	public void save(CProblem problem) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(problem);
	}
	public void delete(CProblem problem){
		this.getHibernateTemplate().delete(problem);
	}
	public Integer countProblems(Integer contestId){
		Integer[] param = new Integer[] {contestId};
		String sql = "select count(p.problem_id) from CProblem p where p.contest_id=?";
		List list = getHibernateTemplate().find(sql,param);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
}
