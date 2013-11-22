/**
 * 
 */
package com.gdoj.common.interceptor;

import java.util.Date;

import com.gdoj.contest.attend.service.AttendService;
import com.gdoj.contest.service.ContestService;
import com.gdoj.contest.vo.Contest;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class IsContestRegisterInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -57112204L;
	private ContestService contestService ;
	private AttendService attendService;
	
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

	public String intercept(ActionInvocation invocation) throws Exception {

		try {
			ActionContext actionContext = invocation.getInvocationContext();
			Integer contestId = (Integer) actionContext.getValueStack()
					.findValue("contestId");
			if (contestId == null) {
				ActionContext.getContext().put("tip", "No such contest.");
				return "error";
			}
			
			Contest contest = contestService.queryContest(contestId,"USER");
			if (contest == null) {
				ActionContext.getContext().put("tip", "No such contest.");
				return "error";
			}		
			
			Date dt = new Date();
			if(contest.getEnd_time().getTime()<dt.getTime()){ //ended
				return invocation.invoke();
			}
			
			String username = (String)actionContext.getSession().get("session_username");
			if(username==null){
				ActionContext.getContext().put("tip", "You must login first.");
				return "login";
			}
			
			if(null==attendService.queryUserAttend(contestId, username)){			
				ActionContext.getContext().put("tip", "You must register this contest first.");
				return "error";
			} else {
				return invocation.invoke();
			}
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("tip", "Operation error!");
			return "error";
		}
	}
}
