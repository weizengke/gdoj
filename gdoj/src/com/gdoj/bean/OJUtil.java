package com.gdoj.bean;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.StreamHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
	public static List<LangBean> getSupportLanguages(String szOjName) {
		List<LangBean> langs = new ArrayList<LangBean>();
		String jsonBuff = StreamHandler.read(Config.getValue("OJ_CONFIG_FILE_PATH"));
		if (jsonBuff != null) {
			String langItem = "languages";
			if (szOjName.equals("HDU")) {
				langItem = "hdu_languages";
			} else if (szOjName.equals("CF")) {
				langItem = "cf_languages";
			}
			JSONObject jsonObject = JSONObject.fromObject(jsonBuff);
			JSONArray languages = jsonObject.getJSONArray(langItem);
			for (Object language : languages) {
				JSONObject languageObj = JSONObject.fromObject(language.toString());

				Integer local_language_id = 0;
				try {
					local_language_id = Integer.parseInt(languageObj.getString("local_language_id"));
				} catch (Exception e) {
					local_language_id = 0;
				}

				LangBean lang = new LangBean(Integer.parseInt(languageObj.getString("id")),
						local_language_id, languageObj.getString("language_name"));
				Integer disableObj = new Integer(0);
				try {
					disableObj = Integer.parseInt(languageObj.getString("disable"));
				} catch (Exception e) {
					disableObj = 0;
				}
				if (disableObj == 0) {
					langs.add(lang);
				}
			}
		}
		return langs;
	}

	public static String getLanguageName(String szOjName, Integer languageId) {
		List<LangBean> languages = getSupportLanguages(szOjName);
		if (languages == null) {
			return null;
		}
		for (LangBean language : languages) {
			if (language.getId().equals(languageId)) {
				return language.getLangName();
			}
		}

		return null;
	}

	public static Integer getLocalLanguageId(String szOjName, Integer languageId) {
		List<LangBean> languages = getSupportLanguages(szOjName);
		if (languages == null) {
			return 0;
		}

		for (LangBean language : languages) {
			if (language.getId().equals(languageId)) {
				return language.getLocal_lang_id();
			}
		}

		return 0;
	}
	public static List<LangBean> getSupportLanguages() {
		return getSupportLanguages("GUET");
	}
	public static List<LangBean> getSupportLanguages(Integer problemId) {
		String szOjName = "GUET";
		try {
			Problem problem = OJUtil.queryProblem(problemId);
			if (problem != null) {
				szOjName = problem.getOj_name();
			}
		} catch (Exception e) {
		}
		return getSupportLanguages(szOjName);
	}

	public static List<LangBean> getSupportLanguages(Integer contestId, String problemNum) {
		Problem problem = OJUtil.queryProblemByContest(problemNum, contestId);
		String szOjName = "GUET";
		if (problem != null) {
			szOjName = problem.getOj_name();
		}
		return getSupportLanguages(szOjName);
	}

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
