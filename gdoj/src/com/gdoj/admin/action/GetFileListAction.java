package com.gdoj.admin.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.StreamHandler;

public class GetFileListAction extends ActionSupport{
private static final long serialVersionUID = -29181731L;
	private String type;
	private String path;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	private List<String> inputFilesName;
	
	
	public List<String> getInputFilesName() {
		return inputFilesName;
	}

	public void setInputFilesName(List<String> inputFilesName) {
		this.inputFilesName = inputFilesName;
	}
	
	public String fileList() {
		
		try {
			String[] inN = StreamHandler.getFilesNameList( Config.getValue(type) + path);
			
			inputFilesName = new ArrayList<String>();
			
			if(inN != null)
				for(int i = 0; i < inN.length; i++) {
					inputFilesName.add(inN[i]);
					//System.out.println(inN[i]);
				}
			return SUCCESS;
		}catch(Exception e) {
			return "error";
		}

	}
	
}
