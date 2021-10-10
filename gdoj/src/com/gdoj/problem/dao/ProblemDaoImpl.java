package com.gdoj.problem.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.problem.vo.Problem;
import com.gdoj.user.vo.User;
import com.util.HibernateSessionFactory;

public class ProblemDaoImpl  extends HibernateDaoSupport implements ProblemDAO  {

	public Problem queryProblem(Integer problemId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {problemId};
		String sql = "from Problem as p where p.problem_id=?";
		List<Problem> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<Problem> queryProblems(Integer from, Integer pageSize, String order, String ojName, String role) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		String condition = new String();
		String order_str =new String();
		
		sql = "select p from Problem p ";
		
		if(role.equals("admin")){
		}else{
			condition = "where p.contest_id=0 ";
		}
		
		if (ojName != null && ojName.length() != 0)
		{
			if (condition != null && !"".equals(condition))
			{
				condition += " and p.oj_name = '" + ojName +"'";
			}
			else
			{
				condition = " where p.oj_name = '" + ojName +"'";
			}
		}
		
		sql += condition;
		
		if("BY_SOLVED_DESC".equals(order)){
			order_str="order by p.solved DESC,p.problem_id DESC";
		}else if("BY_SOLVED_ASC".equals(order)){
			order_str="order by p.solved ASC,p.problem_id DESC";
		}else if("BY_ID_ASC".equals(order)){
			order_str="order by p.problem_id ASC";
		} else {
			order_str="order by p.difficulty DESC,p.problem_id DESC";
		}
		
		sql+=order_str;
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<Problem> problems = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return problems;
	}
	public List<Problem> searchProblem(Integer pageSize,String searchString){  //以后加数量限制
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		sql = "select p from Problem p where p.problem_id like '%"+ searchString +"%' or p.title like '%"+searchString +"%'";
		//System.out.println(sql);
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(0); 
		q.setMaxResults(pageSize);	
		List<Problem> problems = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return problems;
	}
	public void save(Problem problem) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(problem);
	}
	public Integer countProblems(String role, String ojName){
		String sql = new String() ;
		String condition = new String();
		
		sql = "select count(p.problem_id) from Problem p ";
		
		if(role.equals("admin")){
		}else{
			condition = "where p.contest_id=0 ";
		}
		
		if (ojName != null && ojName.length() != 0)
		{
			if (condition != null && !"".equals(condition))
			{
				condition += " and p.oj_name = '" + ojName +"'";
			}
			else
			{
				condition = " where p.oj_name = '" + ojName +"'";
			}
		}
		
		sql += condition;
		
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}
	
	public List<Problem> query(String sql,String word){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	
		Query q = (Query) session.createQuery(sql);
		q.setString(0, "%"+word+"%");
		q.setString(1, "%"+word+"%");
		q.setString(2, "%"+word+"%");
		List<Problem> list = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
	}
}
