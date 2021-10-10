package com.gdoj.common.action;

import java.io.File;
import net.sf.json.JSONObject;

import com.gdoj.bean.TestBean;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Config;
import com.util.StreamHandler;

public class JsonCheckAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sessionId;
	private boolean success;
	private String error;
	private TestBean result;
	
	public String Check() throws Exception{
		try {
			String path = Config.getValue("OJ_JUDGE_LOG") + "judge-log-"+ sessionId + ".json";
			System.out.println("path:" + path);
			
			File file = new File(path);
			if(!file.exists()){
				success = false;
				error="pending";				
				return SUCCESS;
			}
			
			String result_json = StreamHandler.readEx(file);
			System.out.println("result_json:" + result_json);
			
			JSONObject jsonObject=JSONObject.fromObject(result_json);
			result =(TestBean)JSONObject.toBean(jsonObject, TestBean.class);
		        
			//System.out.println("error:" + result.getCompile_error() + " sessionId:" + result.getSession_id());
			success = true;
			error="";
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error="check failed";
			return SUCCESS;
		}
	}
	
	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError() {
		return error;
	}

	public void setResult(TestBean result) {
		this.result = result;
	}

	public TestBean getResult() {
		return result;
	}
}