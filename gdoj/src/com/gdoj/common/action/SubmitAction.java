package com.gdoj.common.action;


import java.util.HashMap;
import java.util.Map;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubmitAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	
	private Integer problemId;
	private Integer language;
	private UserService userService; 
	private Map<String,String> languageMap;
	
	public Map<String, String> getLanguageMap() {
		return languageMap;
	}
	public void setLanguageMap(Map<String, String> languageMap) {
		this.languageMap = languageMap;
	}
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	public String execute()throws Exception {
		try {
			String username = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (null == username || "".equals(username)) {
				return LOGIN;
			}
			User user_ = userService.queryUser(username);
			language = user_.getLanguage();
			
			/*	Integer count = Integer.parseInt(getText("languageCount"));
			
			languageMap = new HashMap<String, String>();
			Integer j = new Integer(1);			
			for(Integer i=1;i<=count&&j<50;){
				try {
					String languageName = new String();
					languageName = getText("language"+ j);
					if(null!=languageName&&!languageName.equals("language"+ j)){
						languageMap.put(j.toString(), languageName);
						i++;
						System.out.println(j.toString()+" "+languageName);
					}
					
				} catch (Exception e) {
					// TODO: handle exception	
				}
				j++;
			}*/
			//System.out.println(count);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;	
		}
		return SUCCESS;	
	}
}
