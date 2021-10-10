package com.gdoj.bean;

public class TestBean {
	String  session_id;
	String  code;
	String  input;
	String  output;
	String  verdict;
	String  compile_error;
	String time;
	String memory;
	String problem_id;
	String language_id;

	public TestBean() {
		
	}
	
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String sessionId) {
		session_id = sessionId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public String getVerdict() {
		return verdict;
	}
	public void setVerdict(String verdict) {
		this.verdict = verdict;
	}
	public String getCompile_error() {
		return compile_error;
	}
	public void setCompile_error(String compileError) {
		compile_error = compileError;
	}
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getProblem_id() {
		return problem_id;
	}

	public void setProblem_id(String problemId) {
		problem_id = problemId;
	}

	public String getLanguage_id() {
		return language_id;
	}

	public void setLanguage_id(String languageId) {
		language_id = languageId;
	}

}
