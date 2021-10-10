package com.gdoj.contest.attend.dao;

import java.util.List;

import com.gdoj.contest.attend.vo.Attend;

public interface AttendDAO {
	public void save(Attend attend);
	public void delete(Attend attend);
	public List<Attend> queryContestRegistrants(Integer from,Integer pageSize,Integer contestId);
	public List<Attend> queryContestAttends(Integer from,Integer pageSize,Integer contestId,Integer type);
	public Integer countContestAttends(Integer contestId);
	public Attend queryUserAttend(Integer contestId,String username);
	public Integer countUserAttends(String username);
	public Integer getUserRank(Attend attend,Integer type);
	public List<Attend> getUserAttends(String username);
}
