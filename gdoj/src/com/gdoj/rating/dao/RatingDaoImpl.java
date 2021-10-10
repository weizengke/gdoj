package com.gdoj.rating.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.rating.vo.Rating;
import com.util.HibernateSessionFactory;

public class RatingDaoImpl extends HibernateDaoSupport implements RatingDAO {
	public List<Rating> query(String sql){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query q = (Query) session.createQuery(sql);
		List<Rating> ratings = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return ratings;
	}
	
	public Rating queryUserContestRating(Integer contestId, String username) {
		// TODO Auto-generated method stub	
		String sql = "from Rating as r where r.contest_id="+contestId+" and r.username='"+username+"'";
		List<Rating> list = getHibernateTemplate().find(sql);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}	
}
