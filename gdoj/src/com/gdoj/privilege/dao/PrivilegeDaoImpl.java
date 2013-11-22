package com.gdoj.privilege.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gdoj.privilege.vo.Privilege;
import com.gdoj.problem.vo.Problem;

public class PrivilegeDaoImpl extends HibernateDaoSupport implements PrivilegeDAO {

	public void delete(Privilege privilege) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(privilege);
	}

	public void save(Privilege privilege) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(privilege);
	}

	public Privilege query(String queryString) {
		// TODO Auto-generated method stub
		List<Privilege> list = this.getHibernateTemplate().find(queryString);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public Privilege query(Integer privilegeId){
		Integer[] param = new Integer[] {privilegeId};
		String sql = "from Privilege as p where p.id=?";
		List<Privilege> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}
	public List<Privilege> query(){
		return this.getHibernateTemplate().find("from Privilege");		
	}
	public List<Privilege> queryByRight(String rightstr){
		String[] param = new String[] {rightstr};
		String sql = "from Privilege as p where p.rightstr=?";
		List<Privilege> list = getHibernateTemplate().find(sql, param);
		if(list == null || list.size() == 0){
			return null;
		}
		return list;
	}
}
