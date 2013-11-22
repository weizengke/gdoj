package com.gdoj.mail.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.mail.vo.Mail;
import com.util.HibernateSessionFactory;

public class MailDaoImpl extends HibernateDaoSupport implements MailDAO {

	public Integer countMails(String sql) {
		// TODO Auto-generated method stub
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public Mail queryMail(Integer mailId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {mailId};
		String sql = "from Mail as m where m.mail_id=?";
		List<Mail> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);	
	}

	public List<Mail> queryMails(int from,int pageSize,String sql){
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<Mail> mails = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return mails;	
	}

	public void save(Mail mail) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(mail);
	}
	public void changeStatus(Integer mailId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String  sql = "update Mail m set m.isnew=0 where m.mail_id=?";
		Query query=session.createQuery(sql);	
		query.setParameter(0, mailId).executeUpdate() ;
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
	}
}
