package com.gdoj.common.action;


import com.gdoj.user.service.UserService;
import com.gdoj.user.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.PasswordMD5;
import com.util.Upload;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class JsonUploadAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8183005531295919951L;
	private UserService userService; 
	private File file;
	private String filePath;
	private boolean success;
	private String error;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	@JSON(deserialize=false,serialize=false)
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String upload()throws Exception {
		try {
			String username = (String) ActionContext.getContext().getSession().get("session_username");
			if (null == username || "".equals(username)) {
				success = false;
				error = "You must login first.";
				return SUCCESS;
			}
			User user_ = userService.queryUser(username);
			if(user_==null){
				success = false;
				error = "You must login first.";
				return SUCCESS;
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			String root = ServletActionContext.getRequest().getRealPath("/upload");
			String path_orig = root + "/image/" + ymd;

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			filePath = df.format(new Date()) + "_" + PasswordMD5.MD5(username+df.format(new Date())+ new Random().nextInt(1000)) + ".png";

			if(Upload.uploadFile(file, path_orig, filePath)==false){
				success = false;
				error = "upload images failed.";
				return SUCCESS;
			}

			filePath = ServletActionContext.getRequest().getContextPath() + "/upload/image/" + ymd + "/" + filePath;
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error = "upload images failed.";
			return SUCCESS;
		}
		success = true;
		return SUCCESS;
	}
}
