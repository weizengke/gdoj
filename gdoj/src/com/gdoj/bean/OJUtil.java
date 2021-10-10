package com.gdoj.bean;
import java.util.Date;

import javax.servlet.http.Cookie;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import com.gdoj.problem.service.ProblemService;
import com.gdoj.contest.problem.service.CProblemService;
import com.gdoj.contest.problem.vo.CProblem;
import com.gdoj.problem.vo.Problem;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.util.MyApplicationContextUtil;
import com.util.OnlineUsers;
import com.gdoj.user.service.UserService;

public class OJUtil {
	public static String getVerdictName(Integer verdictId, Integer testcase) {
		ActionSupport action = new ActionSupport();
		String verdictName = "";
		switch (verdictId) {
			case 5:
				verdictName = action.getText("verdict"+verdictId);
				break;
			default:
				verdictName = action.getText("verdict"+verdictId);
				if (testcase > 0) {
					verdictName += " on test " + testcase;
				}
				break;
		}
		return verdictName;
	}
	public static Problem queryProblem(Integer problemId) {
		// TODO Auto-generated method stub
		ProblemService problemService = (ProblemService)MyApplicationContextUtil.getContext().getBean("problemService");
		Problem problem = problemService.queryProblem(problemId);
		return problem;
	}

	public static Problem queryProblemByContest(String num,Integer contestId) {
		// TODO Auto-generated method stub
		CProblemService cproblemService = (CProblemService)MyApplicationContextUtil.getContext().getBean("cproblemService");
		CProblem cProblem = cproblemService.queryProblemByNum(num, contestId);
		if (null == cProblem)
		{
			System.out.println("queryProblemByContest->queryProblemByNum failed. " + num + " " + contestId);
			return null;
		}
		
		Problem problem = queryProblem(cProblem.getProblem_id());
		
		return problem;
	}
	
	public static int doLogin(String handle, String password)
	{
		System.out.println(handle+ " dologin auto.");
		
		UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
		if(false==userService.isUsernameExist(handle)){
			System.out.println(new Date()+":"+handle + " is not exist.(dologin auto)");
			return 0;
		}
		
		User user_ = new User();
		user_ = userService.checkLogin(handle, password);
		if (null != user_) {
			ActionContext.getContext().getSession().put("session_username",user_.getUsername());
			ActionContext.getContext().getSession().put("session_avatar",user_.getAvatar());
			OnlineUsers.onlineUser(user_.getUsername());
			user_.setLastlogin(new Date());
			userService.save(user_);
			
			return 1;
		}else{
			System.out.println(new Date()+":"+handle+" dologin auto ,but password is invalid.");
			return 0;
		}
	}
}
