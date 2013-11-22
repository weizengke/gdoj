package com.gdoj.mail.action;

import java.util.ArrayList;
import java.util.List;

import com.gdoj.mail.service.MailService;
import com.gdoj.mail.vo.Mail;
import com.gdoj.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MailAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private MailService mailService;
	private UserService userService;
	private List<Mail> mailList;
	private List<Integer> pageList;
	private Integer page=1;	
	private Integer intRowCount=0;
	private Integer pageCount = 0;
	private Integer pageSize=50;
	private Mail mail;
	private String username;
	private Integer mailId=0;	
	
	public Integer getMailId() {
		return mailId;
	}
	public void setMailId(Integer mailId) {
		this.mailId = mailId;
	}
	public String querySendMails()throws Exception{
		try {
			String username_ = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (username_ == null) {
				ActionContext.getContext().put("tip", "You must login first.");
				return LOGIN;
			}
			if (pageSize > 100) {
				pageSize = 100;
			}
				
			String sql = new String();
			sql = "select count(m.mail_id) from Mail m where m.defunct='N' and m.from_user='"+username_+"'";
		
			intRowCount = mailService.countMails(sql);
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			
			Integer from = (page - 1) * pageSize;
			sql = "select m from Mail m where m.defunct='N' and m.from_user='"
					+ username_ + "' order by m.mail_id DESC";
			mailList = new ArrayList<Mail>();
			mailList = mailService.queryMails(from, pageSize, sql);
			
			List<Integer> volume = new ArrayList<Integer>();
			if (pageCount < 7) {
				for (Integer i = 1; i <= pageCount; i++) {
					volume.add(i);
				}
			} else {
				volume.add(1);
				if (page > 4) {
					volume.add(0); //省略号	
				}
				Integer start_i = new Integer(2);
				Integer end_i = new Integer(pageCount - 1);
				if (page - 2 > 2) {
					start_i = page - 2;
				}
				if (page + 2 < pageCount) {
					end_i = page + 2;
				}

				for (Integer i = start_i; i <= end_i; i++) {
					volume.add(i);
				}
				if (page < pageCount - 3) {
					volume.add(0); //省略号
				}
				volume.add(pageCount);
			}
			pageList = volume;
			username = username_;
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("tip", "Unknown Error.");
			return ERROR;
		}
		return SUCCESS;
	}
	public String queryRecvMails()throws Exception{	
		try {
			String username_ = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (username_ == null) {
				ActionContext.getContext().put("tip", "You must login first.");
				return LOGIN;
			}
			String sql = new String();
			if (pageSize > 100) {
				pageSize = 100;
			}
			sql = "select count(m.mail_id) from Mail m where m.defunct='N' and m.to_user='"+username_+"'";
			
			intRowCount = mailService.countMails(sql);
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			
			if (page < 1) {
				page = 1;
			}
			if (page > pageCount) {
				page = pageCount;
			}
			Integer from = (page - 1) * pageSize;
			sql = "select m from Mail m where m.defunct='N' and m.to_user='"
					+ username_ + "' order by m.mail_id DESC";
			mailList = new ArrayList<Mail>();
			mailList = mailService.queryMails(from, pageSize, sql);
			
			intRowCount = mailList.size();
			pageCount = ((intRowCount + pageSize - 1) / pageSize);//计算出总页数
			List<Integer> volume = new ArrayList<Integer>();
			if (pageCount < 7) {
				for (Integer i = 1; i <= pageCount; i++) {
					volume.add(i);
				}
			} else {
				volume.add(1);
				if (page > 4) {
					volume.add(0); //省略号	
				}
				Integer start_i = new Integer(2);
				Integer end_i = new Integer(pageCount - 1);
				if (page - 2 > 2) {
					start_i = page - 2;
				}
				if (page + 2 < pageCount) {
					end_i = page + 2;
				}

				for (Integer i = start_i; i <= end_i; i++) {
					volume.add(i);
				}
				if (page < pageCount - 3) {
					volume.add(0); //省略号
				}
				volume.add(pageCount);
			}
			pageList = volume;
			username = username_;
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("tip", "Unknown Error.");
			return ERROR;
		}
		return SUCCESS;
	}
	public String showMail()throws Exception{
		try {
			String username_ = (String)ActionContext.getContext().getSession().get("session_username");
			if(username_==null){
				ActionContext.getContext().put("tip", "You must login first.");
				
				return LOGIN;
			}
			
			mail = new Mail();
			mail = mailService.queryMail(mailId);
			if (mail == null) {
				ActionContext.getContext().put("tip", "No such mail.");
				return ERROR;
			}
		//	System.out.println(username_+" " + mail.getTo_user()+ " " +mail.getFrom_user()+" "+mail.getIsnew());
			if(mail.getTo_user().equals(username_)||mail.getFrom_user().equals(username_)){
				if(mail.getTo_user().equals(username_)&&mail.getIsnew().equals(1)){
					mailService.changeStatus(mailId);
				}
				username = username_;
			}else{
				ActionContext.getContext().put("tip", "You have no such mail.");
				return ERROR;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().put("tip", "Unknown Error.");
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	public MailService getMailService() {
		return mailService;
	}
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List<Mail> getMailList() {
		return mailList;
	}
	public void setMailList(List<Mail> mailList) {
		this.mailList = mailList;
	}
	public List<Integer> getPageList() {
		return pageList;
	}
	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getIntRowCount() {
		return intRowCount;
	}
	public void setIntRowCount(Integer intRowCount) {
		this.intRowCount = intRowCount;
	}
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
	public Mail getMail() {
		return mail;
	}
	public void setMail(Mail mail) {
		this.mail = mail;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	
}
