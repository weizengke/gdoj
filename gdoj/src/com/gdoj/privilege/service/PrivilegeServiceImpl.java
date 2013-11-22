package com.gdoj.privilege.service;

import java.util.List;

import com.gdoj.privilege.dao.PrivilegeDAO;
import com.gdoj.privilege.vo.Privilege;

public class PrivilegeServiceImpl implements PrivilegeService {

	private PrivilegeDAO privilegeDao;
	
	public PrivilegeDAO getPrivilegeDao() {
		return privilegeDao;
	}
	public void setPrivilegeDao(PrivilegeDAO privilegeDao) {
		this.privilegeDao = privilegeDao;
	}

	public void delete(Privilege privilege) {
		// TODO Auto-generated method stub
		privilegeDao.delete(privilege);
	}

	public Privilege query(String queryString) {
		// TODO Auto-generated method stub
		return privilegeDao.query(queryString);
	}

	public void save(Privilege privilege) {
		// TODO Auto-generated method stub
		privilegeDao.save(privilege);
	}
	public Privilege query(Integer privilegeId){
		return privilegeDao.query(privilegeId);
	}
	public List<Privilege> query(){
		return privilegeDao.query();
	}
	public List<Privilege> queryByRight(String rightstr){
		return privilegeDao.queryByRight(rightstr);
	}
}
