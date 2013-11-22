package com.gdoj.test.thread;

import junit.framework.TestCase;


public class testthread extends TestCase{

	
	public void test() {
		//Mail.sendMail();
		JudgeQueue.addGCC(100);
		System.out.println("test");
		try {
			System.out.println("sleep 1000s");
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("sleep over");
	}
	
}
