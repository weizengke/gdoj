package com.gdoj.contest.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.mapping.Array;

import com.gdoj.bean.ContestListBean;
import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class ContestListAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private ContestService contestService;
	private AttendService attendService;
	private Integer page=1;  //ended
	private List<Integer> pageList;  //ended
	private String order;
	private Integer pageSize=100;  //ended
	private Integer intRowCount=0;  //ended
	private List<ContestListBean> endedList;
	private List<ContestListBean> rpList;
	
	private Integer pageCount = 0;
	
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	
	public List<ContestListBean> getEndedList() {
		return endedList;
	}
	public void setEndedList(List<ContestListBean> endedList) {
		this.endedList = endedList;
	}
	public List<ContestListBean> getRpList() {
		return rpList;
	}
	public void setRpList(List<ContestListBean> rpList) {
		this.rpList = rpList;
	}
	
	public String contestSet()throws Exception {
		
		try {
			List<Contest> endedList_ = new ArrayList<Contest>();
			List<Contest> rpList_ = new ArrayList<Contest>();
			
			endedList = new ArrayList<ContestListBean>();
			rpList = new ArrayList<ContestListBean>();
			
			if (pageSize > 100) {
				pageSize = 100;
			}		
			intRowCount = contestService.countContests(1,"USER");
			
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			
			endedList_ = contestService.queryContests(from, pageSize,1,order,"USER");		
			
			for(Contest c:endedList_){
				ContestListBean clb_ = new ContestListBean();
				clb_.setContest(c);
				clb_.setDuring(DateUtil.secondToString((c.getEnd_time().getTime()-c.getStart_time().getTime())/1000));

				clb_.setRegistrants(attendService.countContestAttends(c.getContest_id()));
				endedList.add(clb_);
			}
	
			
			rpList_ = contestService.queryContests(0, pageSize,2,order,"USER");	
			
			String username = (String) ActionContext.getContext().getSession().get(
			"session_username");
			
			Date dt = new Date();
			
			for(Contest c:rpList_){
				ContestListBean clb_ = new ContestListBean();
				clb_.setContest(c);
				clb_.setRegistrants(attendService.countContestAttends(c.getContest_id()));
				clb_.setDuring(DateUtil.secondToString((c.getEnd_time().getTime()-c.getStart_time().getTime())/1000));
									
				if(c.getStart_time().getTime()>dt.getTime()){ //未开始
					clb_.setStatus("PENDING");
					clb_.setLeftTime(DateUtil.secondToString((c.getStart_time().getTime()-new Date().getTime())/1000));
					clb_.setFriendlyLeftTime(getFriendlyTimeLeft((c.getStart_time().getTime()- new Date().getTime())/1000));
					
				}else if(c.getEnd_time().getTime()>dt.getTime()){//Running
					clb_.setStatus("RUNNING");
					clb_.setLeftTime(DateUtil.secondToString((c.getEnd_time().getTime()-new Date().getTime())/1000));
					clb_.setFriendlyLeftTime(getFriendlyTimeLeft((c.getEnd_time().getTime()-new Date().getTime())/1000));
				}else{ //ended
					clb_.setStatus("ENDED");
					clb_.setLeftTime("00:00:00");
					clb_.setFriendlyLeftTime("00:00:00");
				}
				
				if(c.getStart_reg().getTime()>dt.getTime()){ //注册时间未到
					clb_.setRegStatus("PENDING");
					clb_.setRegleftTime(DateUtil.secondToString((c.getStart_reg().getTime()-new Date().getTime())/1000));
					clb_.setFriendlyRegleftTime(getFriendlyTimeLeft((c.getStart_reg().getTime()-new Date().getTime())/1000));
				}else if(c.getEnd_reg().getTime()>dt.getTime()){ //注册时间ing
					clb_.setRegStatus("RUNNING");
					clb_.setRegleftTime(DateUtil.secondToString((c.getEnd_reg().getTime()-new Date().getTime())/1000));
					clb_.setFriendlyRegleftTime(getFriendlyTimeLeft((c.getEnd_reg().getTime()-new Date().getTime())/1000));
				}else{ //注册时间结束
					clb_.setRegStatus("ENDED");	
					clb_.setRegleftTime("00:00:00");
					clb_.setFriendlyRegleftTime("00:00:00");
				}					
				
				if(null!=username){
					if(null!=attendService.queryUserAttend(c.getContest_id(), username)){
						//registered		
						clb_.setIsRegister("Y");
					}else{
						clb_.setIsRegister("N");
					}
				}
				rpList.add(clb_);
			}
			

			
			List<Integer> volume = new ArrayList<Integer>();
			if(pageCount<7){
				for (Integer i = 1; i <= pageCount; i++) {
					volume.add(i);
				}
			}
			else
			{
				volume.add(1);
				if(page>4){
					volume.add(0); //省略号	
				}
				Integer start_i = new Integer(2);
				Integer end_i = new Integer(pageCount-1);
				if(page-2>2){
					start_i = page-2;
				}
				if(page+2<pageCount){
					end_i = page+2;
				}
				
				for(Integer i=start_i;i<= end_i;i++){
						volume.add(i);
				}	
				if(page<pageCount-3){ 		
					volume.add(0); //省略号
				}
				
				volume.add(pageCount);
			}	
			pageList = volume;
			
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		
		
		
		return SUCCESS;
	}
	
	public String getFriendlyTimeLeft(long timeLeft){
		//System.out.println("timeLeft="+timeLeft);
		if(timeLeft < 172800){ //两天内显示时间
			return DateUtil.secondToString(timeLeft);
		};
		if(timeLeft >= 172800 && timeLeft < 2592000){ //86400 * 30
			long day = timeLeft / 86400 ;	
			return day +getText("days_after");		
		}
		if(timeLeft >= 2592000 && timeLeft < 31104000) //86400 * 30
			return timeLeft / 2592000 +getText("months_after");
		return timeLeft / 31104000 + getText("years_after");
	}	

	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	public AttendService getAttendService() {
		return attendService;
	}
	public void setAttendService(AttendService attendService) {
		this.attendService = attendService;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getIntRowCount() {
		return intRowCount;
	}
	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}
	
	
}
