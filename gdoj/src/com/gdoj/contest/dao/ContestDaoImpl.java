package com.gdoj.contest.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.contest.vo.Contest;
import com.util.HibernateSessionFactory;

public class ContestDaoImpl extends HibernateDaoSupport implements ContestDAO {


	public Integer countContests(Integer type,String mode) {
		// TODO Auto-generated method stub
		String sql = "select count(c.contest_id) from Contest c";

		switch(type){
		case 0:{//all
			if(mode.equals("ADMIN")){
				sql+=" order by c.contest_id DESC";
			}else{
				sql+=" where c.defunct='N' order by c.contest_id DESC";
			}
			break;
		}
		case 1:{//finished
			if(mode.equals("ADMIN")){
				sql+=" where c.end_time<SYSDATE() order by c.contest_id DESC";
			}else{
				sql+=" where c.end_time<SYSDATE() and c.defunct='N' order by c.contest_id DESC";
			}
			break;
		}
		case 2:{//running or pending
			if(mode.equals("ADMIN")){
				sql+=" where c.end_time<SYSDATE() order by c.contest_id DESC";
			}else{
				sql+=" where c.end_time>SYSDATE() and c.defunct='N' order by c.start_time ASC";
			}
			break;
		}
	}

		List list = getHibernateTemplate().find(sql);
		if (list != null && list.size() > 0) {
			return ((Long) list.get(0)).intValue();
		} else
			return 0;
	}

	public Contest queryContest(Integer contestId,String mode) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Integer[] param = new Integer[] {contestId};
		String sql =new String();
		
		if(mode.equals("ADMIN")){
			sql+="from Contest as c where  c.contest_id=?";
		}else{
			sql+="from Contest as c where c.contest_id=? and c.defunct='N'";
		}
		List<Contest> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<Contest> queryContests(Integer from, Integer pageSize,Integer type,String order,String mode)  {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql =new String();
		sql = "select c from Contest c";
		
		switch(type){
			case 0:{//all
				if(mode.equals("ADMIN")){
					sql+=" order by c.contest_id DESC";
				}else{
					sql+=" where c.defunct='N' order by c.contest_id DESC";
				}
				break;
			}
			case 1:{//finished
				if(mode.equals("ADMIN")){
					sql+=" where c.end_time<SYSDATE() order by c.contest_id DESC";
				}else{
					sql+=" where c.end_time<SYSDATE() and c.defunct='N' order by c.contest_id DESC";
				}
				break;
			}
			case 2:{//running or pending
				if(mode.equals("ADMIN")){
					sql+=" where c.end_time<SYSDATE() order by c.contest_id DESC";
				}else{
					sql+=" where c.end_time>SYSDATE() and c.defunct='N' order by c.start_time ASC";
				}
				break;
			}
		}
		Query q = (Query) session.createQuery(sql);
		q.setFirstResult(from); 
		q.setMaxResults(pageSize);	
		List<Contest> contests = q.list();
		session.getTransaction().commit();
		HibernateSessionFactory.closeSession();	
		return contests;
	}

	public void save(Contest contest) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(contest);
	}

}
