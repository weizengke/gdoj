package com.gdoj.compileinfo.action;

import org.apache.struts2.json.annotations.JSON;

import com.gdoj.compileinfo.service.CompileInfoService;
import com.gdoj.compileinfo.vo.CompileInfo;
import com.opensymphony.xwork2.ActionSupport;

public class JsonCompileInfoAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CompileInfoService compileInfoService;
	private Integer solutionId;
	private String errorInfo;
	private boolean success;
	private String error;
	
	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getCompileError() throws Exception{
		try {
			CompileInfo compileInfo_ = new CompileInfo();
			compileInfo_ = compileInfoService.queryCompileInfo(solutionId);
			if (null == compileInfo_) {
				success = false;
				error="No such compile information.";
				return ERROR;
			}	
			
			errorInfo = compileInfo_.getError().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
			
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			error="Unknown Error.";
			return ERROR;
		}
		success = true;
		return SUCCESS;
	}
	
	@JSON(deserialize=false,serialize=false)
	public CompileInfoService getCompileInfoService() {
		return compileInfoService;
	}
	public void setCompileInfoService(CompileInfoService compileInfoService) {
		this.compileInfoService = compileInfoService;
	}
	public Integer getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}

}
