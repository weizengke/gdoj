package com.gdoj.contest.attend.action;

import java.util.ArrayList;
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

public class ContestRegistrantsAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AttendService attendService;
	private ContestService contestService;
	private UserService userService;
	private List<User> userList;
	private List<Integer> pageList;

	private Integer intRowCount=0;
	private Integer pageSize=100;
	private Integer page=1;
	private Integer contestId=0;
	private Contest contest;
	




	public String queryRegistrantsList() throws Exception{
		
		try {
			//检查有没有这个比赛
			//System.out.println(contestId + " " + page);
			
			Contest contest_ = contestService.queryContest(contestId,"USER");
			if(null==contest_){
				this.addFieldError("contestId", "No such contest.");
				return ERROR;
			}
			contest=contest_;
			List<Attend> attendList_ = new ArrayList<Attend>();	
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
			attendList_ = attendService.queryContestRegistrants(from, pageSize,contestId);
			 userList = new ArrayList<User>();
			for(Attend a:attendList_){
				userList.add(userService.queryUser(a.getUsername()));
			}

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

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
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


	public Contest getContest() {
		return contest;
	}


	public void setContest(Contest contest) {
		this.contest = contest;
	}
}
