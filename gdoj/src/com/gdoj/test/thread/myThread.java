
package com.gdoj.test.thread;

import java.io.IOException;


import com.gdoj.user.service.UserService;
import com.util.MyApplicationContextUtil;


public class myThread extends Thread {
	
	public void run() {
		while (true) {
			//System.out.println("Thread...");
			//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
			
			UserService userService = (UserService)MyApplicationContextUtil.getContext().getBean("userService");
			
			System.out.println("U:"+userService.countUsers());
			
			
			Integer runId = JudgeQueue.pollGCC();
			try {
				//System.out.println("No judge...");
				Thread.sleep(2000);
			} catch(Exception e) {
			}
			if(runId==null) {
				try {
					//System.out.println("No judge...");
					Thread.sleep(10);
				} catch(Exception e) {
				}
			} else {
				System.out.println("Start judge..."+runId+", and Queue left "+JudgeQueue.getsize());
				//.......start
			 	String[] cmd={"D:\\OJ\\Client.exe",Integer.toString(runId)};   
				try {			
					Runtime.getRuntime().exec(cmd);	
				} catch (IOException e) {	
					e.printStackTrace();
				}
		   }

		}	
	}
}
