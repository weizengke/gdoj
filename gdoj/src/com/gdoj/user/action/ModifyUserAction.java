package com.gdoj.user.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;

public class ModifyUserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	
	private UserService userService; 
	
	private String username;
	private String old_password;
	private String password;
	private String repeat_password;
	private User user;
	private boolean success;
	private String error;
	private String birthday;

	
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOld_password() {
		return old_password;
	}
	public void setOld_password(String oldPassword) {
		old_password = oldPassword;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepeat_password() {
		return repeat_password;
	}
	public void setRepeat_password(String repeatPassword) {
		repeat_password = repeatPassword;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	//@JSON(deserialize=false,serialize=false)  
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	

	public String modifyUser() throws Exception {
		try {	
		//	username = "solo";
		//	System.out.println(user.getEmail()+" "+user.getMotto());
			
			username = (String)ActionContext.getContext().getSession().get("session_username");
			this.setUsername(username);
			
			  if(null==username){	
				    error="Your must login first.";
				    success = false;
				  	return LOGIN;
		    }
		/*	  
			 Pattern pEmail = Pattern.compile("^[-_A-Za-z0-9]+@([_A-Za-z0-9]+.)+[A-Za-z0-9]{2,3}$");
			 Pattern pPass = Pattern.compile("{6,20}$");
			 
			 Matcher m =null;
			 m = pEmail.matcher(user.getEmail()) ;
			   if(m.matches()==false){					
					this.addFieldError("user.email", "Your email is invalid");
					return INPUT;
			   }
	*/
			
		/*	   
			 try {
				if (null == user.getEmail()||"".equals(user.getEmail().trim())) {
					this.addFieldError("user.email", "Your email is invalid");
					error = "Email shouldn't be empty.";
					success = false;
					return INPUT;
				}
			} catch (Exception e) {
				// TODO: handle exception
				this.addFieldError("user.email", "Your email is invalid");
				error = "Email shouldn't be empty.";
				success = false;
				return INPUT;
			}
			*/	
			 User u = userService.getUserByEmail(user.getEmail());
			 if(u != null){
				 if(!u.getUsername().equals(username)){
					 this.addFieldError("user.email", "This email is currently in use.");
						return INPUT;
				 }
			}
			
			if(null==old_password){	
					this.addFieldError("old_password", "Input your password first.");
				    error="Input your password first.";
				    success = false;
				  	return INPUT;
		    }	
			
			User user_ = new User();
			user_ = userService.checkLogin(username, old_password);
			
			if(user_==null){
				this.addFieldError("old_password", "Your password is invalid");
				error="Your password is invalid.";
				success = false;
				return INPUT;
			}
			Date birDay = null;
			if(birthday!=null){
				
				birDay = DateUtil.StringToDate(birthday, "yyyy-MM-dd");
			/*	if(birDay==null){
					this.addFieldError("birthday", "birthday is invalid");
					error="birthday is invalid.";
					success = false;
					return INPUT;
				}*/
			}
		
			if(null!=user_){
				
				if((null==password||"".equals(password.trim()))&
						(null==repeat_password||"".equals(repeat_password.trim()))){
					//不修改密码
					//System.out.println("NULL");
					this.getUser().setPassword(old_password);
				}else{
				/*	System.out.println(password+" " +repeat_password);
					 m = pPass.matcher(password);
					 if(m.matches()==false){					
							this.addFieldError("password", "password-length should be between 6 and 20");
							return INPUT;
					 }
				*/	if (!password.equals(repeat_password)) {
						//两次密码不一样
						this.addFieldError("repeat_password", "Confirm new password mismatched.");
						error="Confirm new password mismatched.";
						success = false;
						return INPUT;
					}
					else{
						this.getUser().setPassword(password);
					}
				}
		
				user_.setPassword(this.getUser().getPassword());
				user_.setEmail(this.getUser().getEmail());		
				user_.setNickname(this.getUser().getNickname());
				user_.setSchool(this.getUser().getSchool());
				if(this.getUser().getMotto()!=null&&this.getUser().getMotto().length()>50){
					user_.setMotto(this.getUser().getMotto().substring(0, 50));
				}else{
					user_.setMotto(this.getUser().getMotto());
				}
				user_.setBirthday(birDay);
				user_.setLanguage(this.getUser().getLanguage());
				user_.setOpensource(this.getUser().getOpensource());
			//	System.out.println(username+ " submit modify...");
				userService.save(user_);
				success = true;
				return SUCCESS;
			}
			else{
				error="unknon error!";
				success = false;
				return INPUT;
			}	
		} catch (Exception e) {
			// TODO: handle exception	
			error="unknon error!";
			success = false;
			return INPUT;
		}
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
}
