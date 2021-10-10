package com.gdoj.privilege.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.privilege.service.PrivilegeService;
import com.gdoj.privilege.vo.Privilege;
import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PrivilegeAction extends ActionSupport{

	private PrivilegeService privilegeService;
	private UserService userService;
	private List<Privilege> privilegeList;
	private Integer privilegeId;
	private Privilege privilege;

	public Integer getPrivilegeId() {
		return privilegeId;
	}
	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}
	public String addPrivilege(){
		try {
			if("".equals(privilege.getRightstr())||privilege.getRightstr().length()<1||privilege.getRightstr().length()>30){
				return ERROR;
			}
			if(!(privilege.getRightstr().equals("ADMIN")||privilege.getRightstr().equals("NOEDIT_ADMIN"))){
				this.addFieldError("tip", "No such privilege.");
				return ERROR;
			}
			
			User user_ = new User();
			user_ = userService.queryUser(privilege.getUsername());
			if(user_==null){
				this.addFieldError("tip", "No such user.");
				return ERROR;
			}
			
			if(null!=privilegeService.query("from Privilege as p where p.username='"+user_.getUsername()+"' and p.rightstr='"+privilege.getRightstr()+"'")){
				this.addFieldError("tip", "This user has the privilege("+privilege.getRightstr()+") now.");
				return ERROR;
			}
			
			privilegeService.save(privilege);
		} catch (Exception e) {
			// TODO: handle exception
			
			return ERROR;
		}
		return SUCCESS;
	}
	public String deletePrivilege(){
		try {
			Privilege privilege_ = new Privilege();
			privilege_ = privilegeService.query(privilegeId);
			if(privilege_.getRightstr().equals("HEAD")){
				this.addFieldError("tip", "Head can't be delete.");
				return ERROR;
			}
			if (privilege_ == null) {
				return ERROR;
			}
			privilegeService.delete(privilege_);
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String ListPrivilege(){
		try {
			String []str={"HEAD","ADMIN","NOEDIT_ADMIN"};
			privilegeList = new ArrayList<Privilege>();
			List<Privilege> privilegeList_ = new ArrayList<Privilege>();
			for(String s:str){
				privilegeList_ = privilegeService.queryByRight(s);
				if(privilegeList_!=null){
					for(Privilege p:privilegeList_){
						User user_ = new User();
						user_ = userService.queryUser(p.getUsername());
						if(user_ != null){
							p.setUser(user_);
						}
					}
					
					privilegeList.addAll(privilegeList_);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return SUCCESS;
	}
	
	public PrivilegeService getPrivilegeService() {
		return privilegeService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<Privilege> getPrivilegeList() {
		return privilegeList;
	}

	public void setPrivilegeList(List<Privilege> privilegeList) {
		this.privilegeList = privilegeList;
	}

	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}
	
	
}
