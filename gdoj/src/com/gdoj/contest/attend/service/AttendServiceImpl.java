package com.gdoj.contest.attend.service;

import java.util.List;

import com.gdoj.contest.attend.dao.AttendDAO;
import com.gdoj.contest.attend.vo.Attend;

public class AttendServiceImpl implements AttendService {

	private AttendDAO attendDao;
	

	public AttendDAO getAttendDao() {
		return attendDao;
	}
	public void setAttendDao(AttendDAO attendDao) {
		this.attendDao = attendDao;
	}

	public Integer countContestAttends(Integer contestId) {
		// TODO Auto-generated method stub
		return attendDao.countContestAttends(contestId);
	}

	public Integer countUserAttends(String username) {
		// TODO Auto-generated method stub
		return attendDao.countUserAttends(username);
	}
	public List<Attend> queryContestRegistrants(Integer from,Integer pageSize,Integer contestId){
		return attendDao.queryContestRegistrants(from, pageSize, contestId);
	}
	
	public List<Attend> queryContestAttends(Integer from,Integer pageSize,Integer contestId,Integer type) {
		// TODO Auto-generated method stub
		return attendDao.queryContestAttends(from,pageSize,contestId,type);
	}

	public Attend queryUserAttend(Integer contestId, String username) {
		// TODO Auto-generated method stub
		return attendDao.queryUserAttend(contestId, username);
	}

	public void save(Attend attend) {
		// TODO Auto-generated method stub
		attendDao.save(attend);
	}
	public void delete(Attend attend){
		attendDao.delete(attend);
	}
	public Integer getUserRank(Attend attend,Integer type){
		return attendDao.getUserRank(attend,type);
	}
}
