package com.gdoj.message.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.message.vo.Message;
import com.gdoj.problem.vo.Problem;
import com.util.HibernateSessionFactory;

public class MessageDaoImpl extends HibernateDaoSupport implements MessageDAO {

	public void save(Message message){
		getHibernateTemplate().saveOrUpdate(message);
	}
	
	@SuppressWarnings("unchecked")
	public Message queryMessage(Integer messageId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] { messageId };
		String sql = "from Message as m where m.message_id=? and m.defunct='N'";
		List<Message> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Message> query(String sql) {
		// TODO Auto-generated method stub
		
		return getHibernateTemplate().find("from Message as m order by m.orderNum ASC, m.root_id DESC,m.parent_id ASC,m.message_id ASC");
	}
	public List<Message> queryRootMessages(Integer pageNow,Integer pageSize){
	/*	
		String sql = "from Message as m group by m.root_id  order by max(m.message_id) DESC";
		HibernateTemplate ht  =   this.getHibernateTemplate();  
		ht.setMaxResults(limit);
		List<Message> list = ht.find(sql);
		return list;
		*/
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		//���������ۻ򷢱�Ϊ��
		//String sql = "from Message as m group by m.root_id  order by m.orderNum DESC,max(m.message_id) DESC";
		
		//��¥��ʱ������
		String sql = "from Message as m where m.message_id=m.root_id and m.defunct='N' order by m.orderNum DESC,m.message_id DESC";
		
		Integer from = (pageNow - 1) * pageSize;
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);
		List<Message> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
	public Message getLatestReply(Integer messageId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		//���������ۻ򷢱�Ϊ��
		String 	sql = "from Message m where m.parent_id!=0 and m.root_id="+messageId+" order by m.message_id DESC";
		
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(0); 
		q.setMaxResults(1);
		List<Message> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	public List<Message> queryMessagesByRootId(Integer rootId){
		
		Integer[] param = new Integer[] { rootId };
		String sql = "from Message as m where m.root_id=? and m.defunct='N' order by m.parent_id ASC,m.message_id ASC";
		List<Message> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list;
	}
	
	public List<Message> queryChildMessages(Integer parentId){
		Integer[] param = new Integer[] { parentId };
		String sql = "from Message as m where m.parent_id=? and m.defunct='N' order by m.message_id DESC";
		List<Message> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list;
	}
	public Integer count(String sql){		
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	
	public Integer countMessages(){
		String sql = "select count(m.message_id) from Message m where m.defunct='N'";
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	public Integer countRootMessages(){
		String sql = "select count(m.message_id) from Message m where m.parent_id=0 and m.defunct='N'";
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	public List<Message> queryLatestMessages(String username,Integer pageNow,Integer size){
		Integer from = (pageNow - 1) * size;
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql ="";
		if(username==null){
				sql = "from Message as m where m.defunct='N' group by m.root_id,m.create_user order by m.message_id DESC";
		}else{
			sql = "from Message as m where m.create_user='"+ username+"' and m.defunct='N' group by m.root_id order by m.message_id DESC";
		}
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(size);
		List<Message> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}

	public List<Message> query(String sql,String word){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		Query q = (Query) session.createQuery(sql);
		q.setString(0,"%"+word+"%");
		List<Message> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
}
