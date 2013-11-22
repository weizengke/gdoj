package com.gdoj.privilege.service;

import java.util.List;

import com.gdoj.privilege.vo.Privilege;

public interface PrivilegeService {
	public void save(Privilege privilege);
	public void delete(Privilege privilege);
	public Privilege query(String queryString);
	public Privilege query(Integer privilegeId);
	public List<Privilege> query();
	public List<Privilege> queryByRight(String rightstr);
}
