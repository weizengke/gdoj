/**
 * 
 */
package com.gdoj.admin.action;

import java.io.File;

import com.util.StreamHandler;
import com.util.Config;
import com.opensymphony.xwork2.ActionSupport;

public class ShowFileContentAction extends ActionSupport {

	private static final long serialVersionUID = -15980198L;
	
	private String fileName;
	private String content;

	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String execute() {
		
		try {
			File file;
			//System.out.println(Config.getValue("OJ_TMP") + "\\" +  fileName);
			try {
					file = new File(Config.getValue("OJ_TMP") + "\\" + fileName);
				}catch(NullPointerException npe) {
					this.content = "File Not Found, Please Check First!";
					return SUCCESS;
				}

			try {
				this.content = StreamHandler.readEx(file).replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
			} catch (NullPointerException npe) {
				this.content = "File Not Found, Please Check First!";
				return SUCCESS;
			}
			return SUCCESS;
		}catch(Exception e) {
			return "error";
		}

	}
	
}
