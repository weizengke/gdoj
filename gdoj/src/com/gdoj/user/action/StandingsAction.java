package com.gdoj.user.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

public class StandingsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService; 
	private List<User> usersList;
	private Integer page=1;
	
	private String order;
	private List<Integer> pageList;
	private Integer pageSize=100;
private Integer pageCount = 0;
	
	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public List<User> getUsersList() {
		return usersList;
	}
	public void setUsersList(List<User> usersList) {
		this.usersList = usersList;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}

	public UserService getUserService() {
		return userService;
	}  
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String standings()throws Exception {
		
		try {
			if (pageSize > 100) {
				pageSize = 100;
			}
			Integer intRowCount = userService.countUsers();
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			usersList = userService.getStandings(from, pageSize, order);
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
		// System.out.println(jsonResult);  
        return SUCCESS;
	}
   
}
