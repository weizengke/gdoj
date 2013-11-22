package com.gdoj.contest.attend.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.attend.vo.Attend;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class ContestStandingsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AttendService attendService;
	private ContestService contestService;
	private CProblemService cproblemService;
	private UserService userService;
	private List<User> userList;
	
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	private String username;
	private List<Attend> attendList;
	private List<Integer> rankList;
	private List<Integer> pageList;
	private List<CProblem> cproblemList;
	private List<String> fisrtSolvedUsers;
	private Map<String,List<String>> acTimeList;
	private Map<String,List<Integer>> acTimeIntList;
	private Map<String,List<Integer>> wrongSubmits;
	private List<String> penaltyList;
	private Integer intRowCount=0;
	private Integer pageSize=50;
	private Integer page=1;
	private Integer contestId=0;
	private Contest contest;
	
	private long timeLeft=0;
	
	
	public long getTimeLeft() {
		return timeLeft;
	}
	public void setTimeLeft(long timeLeft) {
		this.timeLeft = timeLeft;
	}
	public List<Integer> getRankList() {
		return rankList;
	}


	public void setRankList(List<Integer> rankList) {
		this.rankList = rankList;
	}


	public Contest getContest() {
		return contest;
	}


	public void setContest(Contest contest) {
		this.contest = contest;
	}


	public String queryStandingsList() throws Exception{
		
		try {
			//检查有没有这个比赛
			//System.out.println(contestId + " " + page);
			
			Contest contest_ = contestService.queryContest(contestId,"USER");
			if(null==contest_){
				this.addFieldError("contestId", "No such contest.");
				return ERROR;
			}
			
			contest=contest_;
			
			Date nowTime = new Date();
			if(nowTime.getTime() < contest.getStart_time().getTime()){
				timeLeft=-1;
			}else if(nowTime.getTime() > contest.getEnd_time().getTime()){
				timeLeft=0;
			}else{
				timeLeft = (contest.getEnd_time().getTime()-nowTime.getTime())/1000;
			}
			
			List<Attend> attendList_ = new ArrayList<Attend>();
			List<CProblem> cproblemList_ = new ArrayList<CProblem>();
			cproblemList_ = cproblemService.queryProblems(contestId);
			intRowCount = attendService.countContestAttends(contestId);
			if (pageSize > 1000) {
				pageSize = 1000;
			}
			Integer pageCount = (intRowCount + pageSize - 1) / pageSize;
			List<Integer> volume = new ArrayList<Integer>();
			for (int i = 1; i <= pageCount; i++) {
				volume.add(i);
			}
			pageList = volume;
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			
			attendList_ = attendService.queryContestAttends(from, pageSize,
					contestId,contest_.getType());	
			
			
			Map<String, List<String>> acTimeList_ = new HashMap<String, List<String>>();
			Map<String, List<Integer>> wrongSubmitsList_ = new HashMap<String, List<Integer>>();
			Map<String, List<Integer>> acTimeIntList_ = new HashMap<String, List<Integer>>();
			List<String> penaltyList_ = new ArrayList<String>();
			
			rankList = new ArrayList<Integer>();
			userList = new ArrayList<User>();
			for (Attend c : attendList_) {
				List<String> ACtime_ = new ArrayList<String>();
				List<Integer> wrongSubmit_ = new ArrayList<Integer>();
				List<Integer> acTimeInt_ = new ArrayList<Integer>();
				
				userList.add(userService.queryUser(c.getUsername()));
				rankList.add(attendService.getUserRank(c,contest_.getType()));		
				
				penaltyList_.add(DateUtil.penaltyString(c.getPenalty()));
				for (int i = 1; i <= cproblemList_.size(); i++) {
					Integer tInt = c.getACtime(i);
					acTimeInt_.add(tInt);
					ACtime_.add(DateUtil.penaltyString(tInt));
					wrongSubmit_.add(c.getwrongsubmits(i));
				}
				acTimeList_.put(c.getUsername(), ACtime_);
				wrongSubmitsList_.put(c.getUsername(), wrongSubmit_);
				acTimeIntList_.put(c.getUsername(), acTimeInt_);
			}
			acTimeIntList = acTimeIntList_;
			penaltyList = penaltyList_;
			acTimeList = acTimeList_;
			wrongSubmits = wrongSubmitsList_;
			attendList = attendList_;
			cproblemList = cproblemList_;
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Unknown error.");
			return ERROR;
		}
		return SUCCESS;
	}


	public AttendService getAttendService() {
		return attendService;
	}


	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}


	public ContestService getContestService() {
		return contestService;
	}


	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}


	public CProblemService getCproblemService() {
		return cproblemService;
	}


	public void setCproblemService(CProblemService cproblemService) {
		this.cproblemService = cproblemService;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public List<Attend> getAttendList() {
		return attendList;
	}


	public void setAttendList(List<Attend> attendList) {
		this.attendList = attendList;
	}


	public List<Integer> getPageList() {
		return pageList;
	}


	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}


	public List<CProblem> getCproblemList() {
		return cproblemList;
	}


	public void setCproblemList(List<CProblem> cproblemList) {
		this.cproblemList = cproblemList;
	}


	public List<String> getFisrtSolvedUsers() {
		return fisrtSolvedUsers;
	}


	public void setFisrtSolvedUsers(List<String> fisrtSolvedUsers) {
		this.fisrtSolvedUsers = fisrtSolvedUsers;
	}


	public Map<String, List<String>> getAcTimeList() {
		return acTimeList;
	}


	public void setAcTimeList(Map<String, List<String>> acTimeList) {
		this.acTimeList = acTimeList;
	}


	public Map<String, List<Integer>> getAcTimeIntList() {
		return acTimeIntList;
	}


	public void setAcTimeIntList(Map<String, List<Integer>> acTimeIntList) {
		this.acTimeIntList = acTimeIntList;
	}


	public Map<String, List<Integer>> getWrongSubmits() {
		return wrongSubmits;
	}


	public void setWrongSubmits(Map<String, List<Integer>> wrongSubmits) {
		this.wrongSubmits = wrongSubmits;
	}


	public List<String> getPenaltyList() {
		return penaltyList;
	}


	public void setPenaltyList(List<String> penaltyList) {
		this.penaltyList = penaltyList;
	}


	public Integer getIntRowCount() {
		return intRowCount;
	}


	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
	}


	public Integer getContestId() {
		return contestId;
	}


	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}

}
