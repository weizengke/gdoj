package com.gdoj.solution_source.vo;

import java.io.Serializable;

public class Solution_source implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer solution_id;
	private String source;

	public Solution_source() {
		
	}
	
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getSolution_id() {
		return solution_id;
	}
	public void setSolution_id(Integer solutionId) {
		solution_id = solutionId;
	}

	
	
}
