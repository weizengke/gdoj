package com.gdoj.contest.service;

import java.util.List;

import com.gdoj.contest.dao.ContestDAO;
import com.gdoj.contest.vo.Contest;

public class ContestServiceImpl implements ContestService {

	private ContestDAO contestDao;
	
	public ContestDAO getContestDao() {
		return contestDao;
	}

	public void setContestDao(ContestDAO contestDao) {
		this.contestDao = contestDao;
	}

	
	public Integer countContests(Integer type,String mode) {
		// TODO Auto-generated method stub
		return contestDao.countContests(type,mode);
	}

	public Contest queryContest(Integer contestId,String mode) {
		// TODO Auto-generated method stub
		return contestDao.queryContest(contestId,mode);
	}

	public List<Contest> queryContests(Integer from, Integer pageSize,Integer type,
			String order,String mode) {
		// TODO Auto-generated method stub
		return contestDao.queryContests(from, pageSize,type, order,mode);
	}

	public void save(Contest contest) {
		// TODO Auto-generated method stub
		contestDao.save(contest);
	}

}
