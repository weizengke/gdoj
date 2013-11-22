package com.gdoj.problem.vo;

import java.io.Serializable;
import java.util.Date;

public class Problem implements Serializable {
	
	
		/**
	 * 
	 */
	private static final long serialVersionUID = 7429722296983465259L;
		private Integer problem_id;
	    private String title;
	    private String description;
	    private String input;
	    private String output; 
	    private String sample_input;
	    private String sample_output;
	    private Date create_date;
	    private Integer submit;
	    private Integer accepted;
	    private Integer submit_user;
	    private Integer solved;
	    private float ratio;
	    private Integer memory_limit;
	    private Integer time_limit;
	    private String author;
	    private String source;
	    private float difficulty;
	    private String hint;
	    private Integer spj;
	    private String defunct;
	    private String tag;
	    private Integer contest_id;
	    
	    private String oj_name;
	    private Integer oj_pid;
	    private Integer isvirtual;
	    
		public String getOj_name() {
			return oj_name;
		}
		public void setOj_name(String ojName) {
			oj_name = ojName;
		}
		public Integer getOj_pid() {
			return oj_pid;
		}
		public void setOj_pid(Integer ojPid) {
			oj_pid = ojPid;
		}
		public Integer getIsvirtual() {
			return isvirtual;
		}
		public void setIsvirtual(Integer isvirtual) {
			this.isvirtual = isvirtual;
		}
		public Integer getContest_id() {
			return contest_id;
		}
		public void setContest_id(Integer contestId) {
			contest_id = contestId;
		}
		public void setDifficulty(float difficulty) {
			this.difficulty = difficulty;
		}
		public float getDifficulty() {
			return difficulty;
		}
	
		public Problem() {
			this.submit = 0;
			this.accepted = 0;
			this.submit_user = 0;
			this.solved = 0;
			this.ratio = 0;
			this.memory_limit = 0;
			this.time_limit = 0;
			this.difficulty = 0;
			this.spj = 0;
			this.create_date=new Date();
			this.oj_name="GUET";
			this.oj_pid = 0;
			this.isvirtual = 0 ;
			this.defunct = "N";
		}
		public Integer getProblem_id() {
			return problem_id;
		}
		public void setProblem_id(Integer problemId) {
			problem_id = problemId;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
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
		public String getSample_input() {
			return sample_input;
		}
		public void setSample_input(String sampleInput) {
			sample_input = sampleInput;
		}
		public String getSample_output() {
			return sample_output;
		}
		public void setSample_output(String sampleOutput) {
			sample_output = sampleOutput;
		}
		public Date getCreate_date() {
			return create_date;
		}
		public void setCreate_date(Date createDate) {
			create_date = createDate;
		}
		public Integer getSubmit() {
			return submit;
		}
		public void setSubmit(Integer submit) {
			this.submit = submit;
		}
		public Integer getAccepted() {
			return accepted;
		}
		public void setAccepted(Integer accepted) {
			this.accepted = accepted;
		}
		public Integer getSubmit_user() {
			return submit_user;
		}
		public void setSubmit_user(Integer submitUser) {
			submit_user = submitUser;
		}
		public Integer getSolved() {
			return solved;
		}
		public void setSolved(Integer solved) {
			this.solved = solved;
		}
		public float getRatio() {
			return ratio;
		}
		public void setRatio(float ratio) {
			this.ratio = ratio;
		}
		public Integer getMemory_limit() {
			return memory_limit;
		}
		public void setMemory_limit(Integer memoryLimit) {
			memory_limit = memoryLimit;
		}
		public Integer getTime_limit() {
			return time_limit;
		}
		public void setTime_limit(Integer timeLimit) {
			time_limit = timeLimit;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getSource() {
			return source;
		}
		public void setSource(String source) {
			this.source = source;
		}
	
		public String getHint() {
			return hint;
		}
		public void setHint(String hint) {
			this.hint = hint;
		}
		public Integer getSpj() {
			return spj;
		}
		public void setSpj(Integer spj) {
			this.spj = spj;
		}
		public String getDefunct() {
			return defunct;
		}
		public void setDefunct(String defunct) {
			this.defunct = defunct;
		}
		public String getTag() {
			return tag;
		}
		public void setTag(String tag) {
			this.tag = tag;
		}
	    
	    
	    
	    
	    
	    
	    
}
