package com.gdoj.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.user.vo.User;
import com.util.HibernateSessionFactory;

public class UserDaoImpl extends HibernateDaoSupport implements UserDAO {
	public void save(User user){
		getHibernateTemplate().saveOrUpdate(user);
	}
	
	public boolean isUsernameExist(String username){
		
		String[] param = new String[] {username};
		String sql = "from User as u where u.username=?";
		List<User> list = getHibernateTemplate().find(sql, param);
		if (list != null && list.size() > 0){
			return true;
		}
		else{
			return false;
		}
	}
	public User getUserByEmail(String email){
		String[] param = new String[] {email};
		String sql = "from User as u where u.email=?";
		List<User> list = getHibernateTemplate().find(sql, param);
		if (list != null && list.size() > 0){
			return list.get(0);
		}
		else{
			return null;
		}
	}
	public User checkLogin(String username,String password){
		
		String[] param = new String[] { username, password };
		String sql = "from User as u where u.username=? and u.password=?";
		
		List<User> list = getHibernateTemplate().find(sql, param);
		if (list != null && list.size() > 0){
			return list.get(0);
		}
		else{
			return null;
		}
	}
	public User queryUser(String username){
		String[] param = new String[] { username};
		String sql = "from User as u where u.username=?";
		List<User> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	public List<User> queryUsers(Integer from,Integer pageSize){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		
		
		sql = "select u from User u order by u.id ASC";
	
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);
		List<User> Users = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return Users;
	}
	
	public List<String> queryAllUserName(String sql,String q,Integer pageSize){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Query query = (Query) session.createQuery(sql);
		query.setString(0, q+"%");
		query.setFirstResult(0); 
		query.setMaxResults(pageSize);
		List<String> list = query.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
	
	public Integer countUsers(){
		String sql = "select count(u.id) from User u";
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	public List<User> getStandings(Integer from,Integer pageSize,String order){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		
		if("rating".equals(order)){
			sql = "select u from User u order by u.rating DESC, u.solved DESC, u.submit ASC,u.id ASC";
		}else if("solved".equals(order)){
			sql = "select u from User u order by u.solved DESC,u.rating DESC, u.submit ASC,u.id ASC";
		}else {
			sql = "select u from User u order by u.rating DESC, u.solved DESC, u.submit ASC,u.id ASC";
		}
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);
		List<User> Users = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return Users;
	}
	
	public List<User> query(String sql,String word){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		Query q = (Query) session.createQuery(sql);
		q.setString(0, "%"+word+"%");
		q.setString(1, "%"+word+"%");
		q.setString(2, "%"+word+"%");
		List<User> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
	   public int getUserRank(User user){
		   //排名优先级规则solved - submit
		   Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String sql =new String();
			sql="select count(u) from User u where u.rating> :rating" +
					" or (u.rating= :rating and u.solved< :solved)"				
				+" or (u.rating= :rating and u.solved= :solved  and u.submit< :submit)"
			     +" or (u.rating= :rating and u.solved= :solved  and u.submit= :submit) and u.id< :id";
			Query query=(Query)session.createQuery(sql)
											.setParameter("rating", user.getRating())
											.setParameter("solved", user.getSolved())											
											.setParameter("submit", user.getSubmit())
											.setParameter("id", user.getId());
			int n = ((Long)query.list().get(0)).intValue();
			session.getTransaction().commit();
			HibernateSessionFactory.closeSession();	
			return n+1; 
	   }
}
