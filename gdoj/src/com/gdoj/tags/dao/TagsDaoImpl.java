package com.gdoj.tags.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.tags.vo.Tags;
import com.gdoj.user.vo.User;
import com.util.HibernateSessionFactory;

public class TagsDaoImpl extends HibernateDaoSupport implements TagsDAO {

	public Integer counts(String sql) {
		// TODO Auto-generated method stub		
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public List<Tags> query(String sql) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find(sql);
	}

	public List<Tags> query(String sql, String keyword) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		Query q = (Query) session.createQuery(sql);
		q.setString(0, "%"+keyword+"%");
		q.setString(1, "%"+keyword+"%");
		List<Tags> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}

	public List<Tags> queryTags(Integer from, Integer pageSize, String order) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
				
	    sql = "select t from Tags t where t.defunct='N' order by t.tag_id ASC";
		
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);
		List<Tags> tags = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return tags;
	}

	public void save(Tags tags) {
		// TODO Auto-generated method stub
		tags.setName(tags.getName().toLowerCase());
		getHibernateTemplate().saveOrUpdate(tags);
	}
	public Tags queryTag(Integer tagId){
		Integer[] param = new Integer[] { tagId};
		String sql = "from Tags as t where t.tag_id=?";
		List<Tags> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	
	public Tags queryTag(String tagName){
		String[] param = new String[] { tagName};
		String sql = "from Tags as t where t.name=?";
		List<Tags> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	
	public List<String> queryAllTagsName(String sql,String keyword,Integer pageSize){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		Query query = (Query) session.createQuery(sql);
		query.setString(0, "%"+keyword+"%");
		query.setFirstResult(0); 
		query.setMaxResults(pageSize);
		List<String> list = query.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
}
