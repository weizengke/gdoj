package com.gdoj.tagsview.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.problem.vo.Problem;
import com.gdoj.tags.vo.Tags;
import com.gdoj.tagsview.vo.Tagsview;
import com.util.HibernateSessionFactory;

public class TagsviewDaoImpl extends HibernateDaoSupport implements TagsviewDAO {

	public Integer counts(String sql) {
		// TODO Auto-generated method stub
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public boolean isExistByMessages(Integer tagId, Integer messageId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] { tagId,messageId};
		String sql = "from Tagsview as t where t.tag_id=? and t.message_id=?";
		List<Tagsview> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return false;
		} 
		return true;
	}

	public boolean isExistByProblems(Integer tagId, Integer problemId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] { tagId,problemId};
		String sql = "from Tagsview as t where t.tag_id=? and t.problem_id=?";
		List<Tagsview> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return false;
		} 
		return true;
	}

	public List<Tagsview> queryByMessages(Integer messageId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {messageId};
		String sql = "from Tagsview as t where t.message_id=?";
		List<Tagsview> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		} 
		return list;
	}

	public List<Tagsview> queryByProblems(Integer problemId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] { problemId};
		String sql = "from Tagsview as t where t.problem_id=?";
		List<Tagsview> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		} 
		return list;
	}

	public void save(Tagsview tagsview) {
		// TODO Auto-generated method stub
		getHibernateTemplate().saveOrUpdate(tagsview);
	}
	
	public void removeProblemTag(Integer tagId,Integer problemId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		String sql ="delete Tagsview as t where t.tag_id=? and t.problem_id=?";
		
		Query query = (Query) session.createQuery(sql);
		 query.setInteger(0,tagId);
		 query.setInteger(1,problemId);
		 query.executeUpdate();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
	
	}
	public void removeMessageTag(Integer tagId,Integer messageId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		String sql ="delete Tagsview as t where t.tag_id=? and t.message_id=?";
		
		Query query = (Query) session.createQuery(sql);
		 query.setInteger(0,tagId);
		 query.setInteger(1,messageId);
		 query.executeUpdate();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
	}
	public void removeProblemsTag(Integer problemId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		String sql ="delete Tagsview as t where t.problem_id=?";
		
		Query query = (Query) session.createQuery(sql);
		 query.setInteger(0,problemId);
		 query.executeUpdate();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
	}
	public void removeMessagesTag(Integer messageId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		String sql ="delete Tagsview as t where  t.message_id=?";
		
		Query query = (Query) session.createQuery(sql);
		 query.setInteger(0,messageId);
		 query.executeUpdate();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
	};
}
