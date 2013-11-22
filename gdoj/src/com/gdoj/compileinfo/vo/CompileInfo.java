package com.gdoj.compileinfo.vo;

import java.io.Serializable;

public class CompileInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer solution_id;
	private String error;
	

	public CompileInfo() {
		
	}
	public Integer getSolution_id() {
		return solution_id;
	}
	public void setSolution_id(Integer solutionId) {
		solution_id = solutionId;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
}
