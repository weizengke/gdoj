package com.gdoj.contest.attend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.problem.vo.Problem;
import com.util.HibernateSessionFactory;

public class AttendDaoImpl extends HibernateDaoSupport implements AttendDAO {

	public Integer countUserAttends(String username){
		String[] param = new String[] {username};
		String sql = "select count(a.id) from Attend a where a.username=?";
		List list = getHibernateTemplate().find(sql,param);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	public Integer countContestAttends(Integer contestId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {contestId};
		String sql = "select count(a.id) from Attend a where a.contest_id=?";
		List list = getHibernateTemplate().find(sql,param);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public Attend queryUserAttend(Integer contestId, String username) {
		// TODO Auto-generated method stub	
		String sql = "from Attend as a where a.contest_id="+contestId+" and a.username='"+username+"'";
		List<Attend> list = getHibernateTemplate().find(sql);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	
	public List<Attend> queryContestAttends(Integer from,Integer pageSize,Integer contestId,Integer type) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		
		if(type.equals(0)){
			sql = "select a from Attend  a where a.contest_id=? order by a.solved DESC ,a.penalty ASC";
		}else if(type.equals(1)){
			sql = "select a from Attend  a where a.contest_id=? order by a.score DESC ,a.penalty ASC";
		}else{
			sql = "select a from Attend  a where a.contest_id=? order by a.solved DESC ,a.penalty ASC";
		}
		
		
		Query q = (Query) session.createQuery(sql)
		.setParameter(0, contestId);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<Attend> attends = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return attends;

	}
	public List<Attend> queryContestRegistrants(Integer from,Integer pageSize,Integer contestId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		
		sql = "select a from Attend  a where a.contest_id=? order by a.id DESC";
		
		Query q = (Query) session.createQuery(sql)
		.setParameter(0, contestId);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<Attend> attends = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return attends;

	}

	public void save(Attend attend) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(attend);
	}

	public void delete(Attend attend){
		this.getHibernateTemplate().delete(attend);
	}
	
	public Integer getUserRank(Attend attend,Integer type){
		//排名优先级规则solved/score- penalty
		   Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql =new String();
		
			Integer tmp_score =0;
			if(type.equals(0)){
				sql="select count(a) from Attend  a where a.contest_id = :contestId and (a.solved> :score"
					+" or (a.solved= :score and a.penalty< :penalty))";
				tmp_score=attend.getSolved();
			}else if(type.equals(1)){
				sql="select count(a) from Attend  a where a.contest_id = :contestId and (a.score> :score"
					+" or (a.score= :score and a.penalty< :penalty))";
				tmp_score=attend.getScore();
			}else{
				sql="select count(a) from Attend  a where a.contest_id = :contestId and (a.solved> :score"
					+" or (a.solved= :score and a.penalty< :penalty))";
				tmp_score=attend.getSolved();
			}
			
			Query query=(Query)session.createQuery(sql)
											.setParameter("contestId", attend.getContest_id())
											.setParameter("score", tmp_score)
											.setParameter("penalty", attend.getPenalty());
			int n = ((Long)query.list().get(0)).intValue();
			session.getTransaction().commit();
			HibernateSessionFactory.closeSession();
			return n+1; 
	}
}
