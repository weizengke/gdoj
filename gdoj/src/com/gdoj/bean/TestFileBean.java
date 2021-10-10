package com.gdoj.bean;

public class TestFileBean {
	private Integer problemId;
	private String inFileName;
	private String outFileName;
	private String inputString;
	private String outputString;
	
	public TestFileBean() {
	}
	
	public Integer getProblemId() {
		return problemId;
	}
	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}
	public String getInFileName() {
		return inFileName;
	}
	public void setInFileName(String inFileName) {
		this.inFileName = inFileName;
	}	
	public String getOutFileName() {
		return outFileName;
	}
	public void setOutFileName(String outFileName) {
		this.outFileName = outFileName;
	}
	public String getInputString() {
		return inputString;
	}
	public void setInputString(String inputString) {
		this.inputString = inputString;
	}
	public String getOutputString() {
		return outputString;
	}
	public void setOutputString(String outputString) {
		this.outputString = outputString;
	}
	
}
