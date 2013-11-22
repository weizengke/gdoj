package com.gdoj.common.action;

import com.gdoj.test.thread.JudgeQueue;

import com.opensymphony.xwork2.ActionSupport;

public class QueueAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3552864426020089250L;
	private Integer solutionId;
	
	public Integer getSolutionId() {
		return solutionId;
	}

	public void setSolutionId(Integer solutionId) {
		this.solutionId = solutionId;
	}

	public String execute()throws Exception {
		
		JudgeQueue.addGCC(solutionId);
		System.out.println("Push one , size="+JudgeQueue.getsize());
		return SUCCESS;
	}
}
