package com.gdoj.solution.vo;

import java.io.Serializable;
import java.util.Date;

public class Solution implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer solution_id;
	private Integer problem_id;
	private String username;
	private Date submit_date;
	private Integer memory;
	private Integer time;
	private Integer code_length;
	private Integer language;
	private Integer verdict;
	private Integer contest_id;
	private Integer testcase;
	
	
	public Solution() {
		this.memory = 0;
		this.time = 0;
		this.contest_id = 0;
		this.testcase = 0;
		this.verdict = 1;
	}
	
	public Integer getSolution_id() {
		return solution_id;
	}
	public void setSolution_id(Integer solutionId) {
		solution_id = solutionId;
	}
	public Integer getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(Integer problemId) {
		problem_id = problemId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(Date submitDate) {
		submit_date = submitDate;
	}
	public Integer getMemory() {
		return memory;
	}
	public void setMemory(Integer memory) {
		this.memory = memory;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public Integer getCode_length() {
		return code_length;
	}
	public void setCode_length(Integer codeLength) {
		code_length = codeLength;
	}
	public Integer getLanguage() {
		return language;
	}
	public void setLanguage(Integer language) {
		this.language = language;
	}
	public Integer getVerdict() {
		return verdict;
	}
	public void setVerdict(Integer verdict) {
		this.verdict = verdict;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setContest_id(Integer contestId) {
		contest_id = contestId;
	}
	public Integer getTestcase() {
		return testcase;
	}
	public void setTestcase(Integer testcase) {
		this.testcase = testcase;
	}
	
	
	
	
}
