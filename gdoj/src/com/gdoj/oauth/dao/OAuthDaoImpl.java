package com.gdoj.oauth.dao;

import java.util.List;

import com.gdoj.vote.vo.Vote;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.oauth.vo.OAuth;
import com.util.HibernateSessionFactory;

public class OAuthDaoImpl extends HibernateDaoSupport implements OAuthDAO {
	public void save(OAuth oauth) {
		// TODO Auto-generated method stub
		getHibernateTemplate().saveOrUpdate(oauth);
	}
	public void delete(OAuth oauth) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(oauth);
	}
	public List<OAuth> query(String sql){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query q = (Query) session.createQuery(sql);
		List<OAuth> oauths = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return oauths;
	}
	public List<OAuth> queryByUser(String username) {
		String[] param = new String[] { username};
		String sql = "from OAuth as o where o.username=?";
		List<OAuth> list = getHibernateTemplate().find(sql, param);
		return list;
	}
	public OAuth queryOAuthByUser(String provider, String username) {
		// TODO Auto-generated method stub	
		String sql = "from OAuth as o where o.provider='"+provider+"' and o.username='"+username+"'";
		List<OAuth> list = getHibernateTemplate().find(sql);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	public OAuth queryOAuthByLoginName(String provider, String login) {
		// TODO Auto-generated method stub
		String sql = "from OAuth as o where o.provider='"+provider+"' and o.login='"+login+"'";
		List<OAuth> list = getHibernateTemplate().find(sql);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
}
