package com.gdoj.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gdoj.privilege.service.PrivilegeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class IsHeadInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -5718204L;

	private PrivilegeService privilegeService;
	
	public PrivilegeService getPrivilegeService() {
		return privilegeService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		String username = (String)actionContext.getSession().get("session_username");

		if( null != username ) {
			//actionContext.put("tip","Login");
			//超级管理员
			String queryString = "from Privilege p where p.username='"+username+"' and p.rightstr='HEAD'";
			if(privilegeService.query(queryString)!=null){
				return invocation.invoke();
			}	
		}
		actionContext.put("tip", "You have no privilege!");
		return ActionSupport.ERROR;
	}
}
