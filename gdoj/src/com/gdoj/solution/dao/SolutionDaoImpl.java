package com.gdoj.solution.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.problem.vo.Problem;
import com.gdoj.solution.vo.Solution;
import com.util.HibernateSessionFactory;

public class SolutionDaoImpl extends HibernateDaoSupport implements SolutionDAO {

	public Integer countSolutions(String sql){
		// TODO Auto-generated method stub
	//	String sql = "select count(s.solution_id) from Solution s";
		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	@SuppressWarnings("unchecked")
	public Solution querySolution(Integer solutionId) {
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {solutionId};
		String sql = "from Solution as s where s.solution_id=?";
		List<Solution> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<Solution> querySolutions(Integer from,Integer pageSize,String sql){
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	//	String sql =new String();
	
	//	sql = "select s from Solution s";
		
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		if(!pageSize.equals(-1)){
			q.setMaxResults(pageSize);	
		}
		List<Solution> solutions = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return solutions;
	}

	public void save(Solution solution) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(solution);
	}
	public List<Object> query(String sql){//sql，不是hql
		List<Object> list = new ArrayList<Object>();
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		SQLQuery query=session.createSQLQuery(sql);
		//query.addEntity("s", Integer.class);
		
		list=query.list();

		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return list;
		
		/*list = this.getHibernateTemplate().find(sql);
		 if(list==null||list.size()<1){
			 return null;
		 }
		 return list;*/
	}
	
	/*
	 * 
	 date往前size个单位	
	 */
	public List<Integer> getBydaily(Date date, Integer size){
		
		/*
		 * 	Calendar和Date的转化

			(1) Calendar转化为Date
			Calendar cal=Calendar.getInstance();
			Date date=cal.getTime();
			
			(2) Date转化为Calendar
			Date date=new Date();
			Calendar cal=Calendar.getInstance();
			cal.setTime(date);
		 */
	    Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
	    List<Integer> list =new ArrayList<Integer>(0);
		
		//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置显示格式
		String maxTime=new String();
		String minTime=new String();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		calendar.add(Calendar.DATE, 1);    //得到明天日期
	//	System.out.println(calendar.getTime().toString());
		calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE),0,0,0);
	//	System.out.println(calendar.getTime().toString());

		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day =calendar.get(Calendar.DATE);
		
		maxTime=year+"-"+month+"-"+day;
		minTime=maxTime;
		//System.out.println(maxTime);
		String sql=new String();
		
		//calendar.add(Calendar.MONTH, -1);//得到前一个月
		for(int i=0;i<size;i++){
			maxTime=minTime;
			calendar.add(Calendar.DATE, -1);    //得到前一天
			int year1 = calendar.get(Calendar.YEAR);
			int month1 = calendar.get(Calendar.MONTH)+1;
			int day1 =calendar.get(Calendar.DATE);
			minTime=year1+"-"+month1+"-"+day1;
			sql="select count(s.solution_id) from Solution s where s.submit_date between '"+minTime+"' and '"+maxTime+"'";
			Query query=session.createQuery(sql);
			int n = ((Long)query.list().get(0)).intValue();
			list.add(n);
			
			//System.out.println(minTime+" ~ "+maxTime+" = "+n);
		}
		return list;
	}
	public List<Integer> getBymonthly(Date date, Integer size){
		 Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
		    List<Integer> list =new ArrayList<Integer>(0);
			
			String maxTime=new String();
			String minTime=new String();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			
			calendar.add(Calendar.MONTH, 1);
			calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),1,0,0,0);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH)+1;
			
			maxTime=year+"-"+month+"-"+"01";
			minTime=maxTime;
			//System.out.println(maxTime);
			String sql=new String();

			//calendar.add(Calendar.MONTH, -1);//得到前一个月
			for(int i=0;i<size;i++){
				maxTime=minTime;
				calendar.add(Calendar.MONTH, -1);    //得到前一月
				int year1 = calendar.get(Calendar.YEAR);
				int month1 = calendar.get(Calendar.MONTH)+1;
				minTime=year1+"-"+month1+"-"+"01";
				sql="select count(s.solution_id) from Solution s where s.submit_date between '"+minTime+"' and '"+maxTime+"'";
				Query query=session.createQuery(sql);
				int n = ((Long)query.list().get(0)).intValue();
				list.add(n);
				
				//System.out.println(minTime+" ~ "+maxTime+" = "+n);
			}
			return list;
	 }
}
