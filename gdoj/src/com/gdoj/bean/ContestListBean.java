package com.gdoj.bean;


import com.gdoj.contest.vo.Contest;

public class ContestListBean {

	private Contest contest;

	private String leftTime;
	private String regleftTime;
	private String during;
	private Integer registrants;
	private String status;
	private String regStatus;
	
	private String isRegister;


	public String getLeftTime() {
		return leftTime;
	}
	public void setLeftTime(String leftTime) {
		this.leftTime = leftTime;
	}
	public String getRegleftTime() {
		return regleftTime;
	}
	public void setRegleftTime(String regleftTime) {
		this.regleftTime = regleftTime;
	}
	public Contest getContest() {
		return contest;
	}
	public void setContest(Contest contest) {
		this.contest = contest;
	}
	public String getDuring() {
		return during;
	}
	public void setDuring(String during) {
		this.during = during;
	}
	public Integer getRegistrants() {
		return registrants;
	}
	public void setRegistrants(Integer registrants) {
		this.registrants = registrants;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegStatus() {
		return regStatus;
	}

	public void setRegStatus(String regStatus) {
		this.regStatus = regStatus;
	}
	public String getIsRegister() {
		return isRegister;
	}
	public void setIsRegister(String isRegister) {
		this.isRegister = isRegister;
	}
}
