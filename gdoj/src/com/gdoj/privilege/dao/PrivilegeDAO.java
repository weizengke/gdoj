package com.gdoj.privilege.dao;

import java.util.List;

import com.gdoj.privilege.vo.Privilege;

public interface PrivilegeDAO {

	public void save(Privilege privilege);
	public void delete(Privilege privilege);
	public Privilege query(Integer privilegeId);
	public Privilege query(String queryString);
	public List<Privilege> query();
	public List<Privilege> queryByRight(String rightstr);
}
