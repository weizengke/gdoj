package com.gdoj.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.util.Config;
import com.gdoj.privilege.service.PrivilegeService;


public class SourceInterceptor extends AbstractInterceptor {
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

		//超级管理员
		String queryString = "from Privilege p where p.username='"+username+"' and p.rightstr='HEAD'";
		if(privilegeService.query(queryString)!=null){
			return invocation.invoke();
		}
		
		//普通管理员
		queryString = "from Privilege p where p.username='"+username+"' and p.rightstr='ADMIN'";
		if(privilegeService.query(queryString)!=null){
			return invocation.invoke();
		}
		
		if ("YES".equals(Config.getValue("OPENBBS"))){
			return invocation.invoke();
		}
		
		ActionContext.getContext().put("tip", "This operation is now closed.");
		return ActionSupport.ERROR;
	}
}
