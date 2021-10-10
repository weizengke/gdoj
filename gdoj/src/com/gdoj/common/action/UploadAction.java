package com.gdoj.common.action;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.CompressImage;
import com.util.RoundHeadImgUtil;
import com.util.Upload;

public class UploadAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	
	private UserService userService; 
	private File titlePhoto;
	
	public File getTitlePhoto() {
		return titlePhoto;
	}
	public void setTitlePhoto(File titlePhoto) {
		this.titlePhoto = titlePhoto;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String uploadPhoto()throws Exception {
		try {
			//System.out.println(titlePhoto);
			String username = (String) ActionContext.getContext().getSession()
					.get("session_username");
			if (null == username || "".equals(username)) {
				return LOGIN;
			}
			User user_ = userService.queryUser(username);
			if(user_==null){
				return LOGIN;
			}
			String root = ServletActionContext.getRequest().getRealPath("/upload");
			String path_orig = root+"/userphoto/"+username;
			if(Upload.uploadFile(titlePhoto, path_orig, "photo.png")==false){
				return ERROR;
			}
			user_.setAvatar("Y");
			userService.save(user_);
		} catch (Exception e) {
			// TODO: handle exception
			this.addFieldError("tip", "Unknown error.");
			return ERROR;	
		}
		return SUCCESS;	
	}
}
