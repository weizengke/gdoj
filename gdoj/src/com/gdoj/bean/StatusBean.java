package com.gdoj.bean;

public class StatusBean {
	Integer solutionId;
	String status_description;
	Integer testCase;
	Integer verdictId;
	Integer time;
	Integer memory;
	Integer problemId;
	
	/*contest*/
	Integer contestId;
	String problemNum;
	String contestTimes;
	
	public String getStatus_description() {
		return status_description;
	}
	public void setStatus_description(String statusDescription) {
		status_description = statusDescription;
	}
	public String getContestTimes() {
		return contestTimes;
	}
	public void setContestTimes(String contestTimes) {
		this.contestTimes = contestTimes;
	}
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public String getProblemNum() {
		return problemNum;
	}
	public void setProblemNum(String problemNum) {
		this.problemNum = problemNum;
	}
	public Integer getTestCase() {
		return testCase;
	}
	public void setTestCase(Integer testCase) {
		this.testCase = testCase;
	}
	public Integer getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
	}
	public Integer getVerdictId() {
		return verdictId;
	}
	public void setVerdictId(Integer verdictId) {
		this.verdictId = verdictId;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public Integer getMemory() {
		return memory;
	}
	public void setMemory(Integer memory) {
		this.memory = memory;
	}
	public Integer getContestId() {
		return contestId;
	}
	public void setContestId(Integer contestId) {
		this.contestId = contestId;
	}
	
}
