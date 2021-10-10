/**
 * 
 */
package com.gdoj.admin.action;

import java.io.File;

import com.util.StreamHandler;
import com.util.Config;
import com.opensymphony.xwork2.ActionSupport;

public class ShowTestFileAction extends ActionSupport {

	private static final long serialVersionUID = -15980198L;
	
	private Integer problemId;

	private String inputFilesName;
	private String content;


	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public String getInputFilesName() {
		return inputFilesName;
	}
	public String getContent() {
		return content;
	}
	public void setInputFilesName(String inputFilesName) {
		this.inputFilesName = inputFilesName;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String execute() {
		
		try {
			File file;
			//System.out.println(problemId);
			try {
					file = new File(Config.getValue("OJ_DATA_PATH") +problemId.toString() + "\\" + inputFilesName);
				}catch(NullPointerException npe) {
					this.content = "File Not Found, Please Check First!";
					return SUCCESS;
				}

			try {
				//this.content = StreamHandler.read(file);
				//System.out.println(content);
				this.content = StreamHandler.readEx(file).replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;");
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
