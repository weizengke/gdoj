package com.gdoj.contest.problem.vo;

import java.io.Serializable;
import java.util.Date;

public class CProblem implements Serializable  {
	private Integer id;
	private Integer problem_id;
	private Integer contest_id;
    private String  title;
    private String  num;
    private Integer submit;
    private Integer accepted;
    private Integer submit_user;
    private Integer solved;
    private Integer point;
    private String defunct;
    
    
	public CProblem() {
		this.submit = 0;
		this.accepted = 0;
		submit_user = 0;
		this.solved = 0;
		this.point=1;
		this.defunct = "N";
	}
	
	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(Integer problemId) {
		problem_id = problemId;
	}
	public Integer getContest_id() {
		return contest_id;
	}
	public void setContest_id(Integer contestId) {
		contest_id = contestId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public String getDefunct() {
		return defunct;
	}
	public void setDefunct(String defunct) {
		this.defunct = defunct;
	}
    
}
