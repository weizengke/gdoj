package com.gdoj.news.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.mail.vo.Mail;
import com.gdoj.news.vo.News;
import com.util.HibernateSessionFactory;

public class NewsDaoImpl extends HibernateDaoSupport implements NewsDAO {

	public Integer countNews(String sql) {
		// TODO Auto-generated method stub
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public List<News> queryNews(int from, int pageSize, String sql) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<News> news = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return news;	
	}

	public News queryNews(String sql) {
		// TODO Auto-generated method stub
		List<News> list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	public void save(News news) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(news);
	}

}
